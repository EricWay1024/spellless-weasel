#include "stdafx.h"
#include <WeaselConstants.h>
#include "WeaselTSF.h"
#include "EditSession.h"

// Spellless: read the text immediately before the insertion point.
//
// Rime's own view of the document is its commit history, which is a record of
// what the input method itself put there.  That is not the document: librime
// clears the history on Backspace and Return (commit_history.cc), it never
// hears about a click or an arrow key, and it cannot see a thing the user
// typed while another input method was active.  Every rule built on it --
// where a sentence starts, whether a space is due, whether the space behind
// the caret is ours to take back -- is therefore a guess.
//
// The frontend does not have to guess.  It holds a TSF range and can simply
// look, which is what this does: clone the composition (or the selection when
// nothing is composing), walk its start backwards, and read.
//
// Cheap enough for every keystroke: one synchronous read-only edit session
// over at most SURROUNDING_CHARS characters, and applications that will not
// grant one just get the old behaviour.

namespace {

// Enough for the spacing and capitalisation rules to see a sentence boundary
// and a word or two, and short enough that the read stays trivial.
const LONG SURROUNDING_CHARS = 32;

class CReadSurroundingEditSession : public CEditSession {
 public:
  CReadSurroundingEditSession(com_ptr<WeaselTSF> pTextService,
                              com_ptr<ITfContext> pContext,
                              com_ptr<ITfComposition> pComposition)
      : CEditSession(pTextService, pContext), _pComposition(pComposition) {}

  STDMETHODIMP DoEditSession(TfEditCookie ec);

  std::wstring text;

 private:
  com_ptr<ITfComposition> _pComposition;
};

STDMETHODIMP CReadSurroundingEditSession::DoEditSession(TfEditCookie ec) {
  com_ptr<ITfRange> pRange;

  if (_pComposition != nullptr) {
    // Read from the start of the composition, not the caret: with inline
    // preedit on, the text being composed is already in the document and
    // would otherwise be read back as though it were behind us.
    if (FAILED(_pComposition->GetRange(&pRange)))
      return S_OK;
  } else {
    TF_SELECTION sel;
    ULONG fetched = 0;
    if (FAILED(_pContext->GetSelection(ec, TF_DEFAULT_SELECTION, 1, &sel,
                                       &fetched)) ||
        fetched == 0)
      return S_OK;
    pRange.Attach(sel.range);
  }

  com_ptr<ITfRange> pBefore;
  if (FAILED(pRange->Clone(&pBefore)))
    return S_OK;
  if (FAILED(pBefore->Collapse(ec, TF_ANCHOR_START)))
    return S_OK;

  LONG shifted = 0;
  if (FAILED(pBefore->ShiftStart(ec, -SURROUNDING_CHARS, &shifted, nullptr)))
    return S_OK;
  const LONG taken = shifted < 0 ? -shifted : shifted;
  if (taken <= 0)
    return S_OK;  // start of the document

  std::wstring buffer(static_cast<size_t>(taken), L'\0');
  ULONG fetched = 0;
  if (FAILED(pBefore->GetText(ec, 0, &buffer[0], static_cast<ULONG>(taken),
                              &fetched)))
    return S_OK;
  buffer.resize(fetched);
  text = buffer;
  return S_OK;
}

}  // namespace

std::wstring WeaselTSF::_ReadSurroundingText(com_ptr<ITfContext> pContext) {
  if (pContext == nullptr)
    return std::wstring();

  com_ptr<CReadSurroundingEditSession> pSession;
  pSession.Attach(
      new CReadSurroundingEditSession(this, pContext, _pComposition));
  if (pSession == nullptr)
    return std::wstring();

  // Synchronous: the answer is needed before this keystroke is sent on, and
  // an asynchronous session would arrive a keystroke too late.  Read-only, so
  // the request is a modest one; an application that refuses simply leaves the
  // input method with what it had before.
  HRESULT hr = S_OK;
  if (FAILED(pContext->RequestEditSession(
          _tfClientId, pSession, TF_ES_SYNC | TF_ES_READ, &hr)) ||
      FAILED(hr))
    return std::wstring();

  return pSession->text;
}
