#pragma once

#define WEASEL_CODE_NAME "Spellless"
#define WEASEL_CODE_NAME_W L"Spellless"
// Base name of the modules installed into the system directory.
// Must not be "weasel": the files land in System32 under this name, and a
// stock Weasel install has its own weasel.dll and weasel.ime there.
#define WEASEL_MODULE_BASE L"spellless"
#define WEASEL_MODULE_BASE_A "spellless"
// Default user directory, when the registry names none.  Every copy of this
// fallback must agree, or the parts disagree about where the config lives.
#define WEASEL_USER_DIR_DEFAULT L"%AppData%\\Spellless"
#define WEASEL_REG_KEY L"Software\\Rime\\Spellless"
// Narrow form, for C APIs that take char* (WinSparkle).
#define WEASEL_REG_KEY_A "Software\\Rime\\Spellless"
// The 32-bit view of the same key, for the WOW64 half of a 64-bit install.
#define WEASEL_REG_KEY_WOW L"Software\\WOW6432Node\\Rime\\Spellless"
#define RIME_REG_KEY L"Software\\Rime"

// The TSF class and profile identifying this text service.  Generated fresh
// for Spellless -- Windows keys registration, enabling and *removal* on these,
// so sharing Weasel's would mean uninstalling Spellless tore out the stock
// Weasel's input method.  The GUID structs in WeaselTSF/Globals.cpp and
// WeaselSetup/imesetup.cpp must spell out these same values.
#define WEASEL_CLSID_TEXTSERVICE_STR L"{6ECD9DA4-3390-4F2D-8F8C-CC46E3A93F02}"
#define WEASEL_GUID_PROFILE_STR L"{82FA79D7-0667-4779-B842-1D4ABD996B38}"

// Spellless types English, so it belongs in the English language group:
// Win+Space then moves between it and a Chinese IME directly, instead of
// burying an English input method inside the Chinese one.  0x0409 is
// MAKELANGID(LANG_ENGLISH, SUBLANG_ENGLISH_US); spelt out so this header
// needs nothing from windows.h.
#define WEASEL_PROFILE_LANGID 0x0409
#define WEASEL_PROFILE_LANGID_STR L"0409"

#define STRINGIZE(x) #x
#define VERSION_STR(x) STRINGIZE(x)
#define WEASEL_VERSION VERSION_STR(VERSION_MAJOR.VERSION_MINOR.VERSION_PATCH)
