; weasel installation script
!include FileFunc.nsh
!include LogicLib.nsh
!include MUI2.nsh
!include x64.nsh
!include winVer.nsh

Unicode true

;--------------------------------
; General

!ifndef WEASEL_VERSION
!define WEASEL_VERSION 0.1.0
!endif

!ifndef WEASEL_BUILD
!define WEASEL_BUILD 0
!endif

!define WEASEL_ROOT $INSTDIR\spellless-${WEASEL_VERSION}
!define REG_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\Spellless"

; The name of the installer
Name "Spellless ${WEASEL_VERSION}"

; The file to write
OutFile "archives\spellless-${PRODUCT_VERSION}-installer.exe"

VIProductVersion "${WEASEL_VERSION}.${WEASEL_BUILD}"
VIAddVersionKey /LANG=2052 "ProductName" "Spellless"
VIAddVersionKey /LANG=2052 "Comments" "Fuzzy English input, powered by RIME"
VIAddVersionKey /LANG=2052 "CompanyName" "式恕堂"
VIAddVersionKey /LANG=2052 "LegalCopyright" "Copyleft RIME Developers"
VIAddVersionKey /LANG=2052 "FileDescription" "Spellless input method"
VIAddVersionKey /LANG=2052 "FileVersion" "${WEASEL_VERSION}"

!define MUI_ICON ..\resource\weasel.ico
SetCompressor /SOLID lzma


; Request application privileges for Windows Vista
RequestExecutionLevel admin

;--------------------------------

; Pages

!insertmacro MUI_PAGE_LICENSE "LICENSE.txt"
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

;--------------------------------

; Languages

!insertmacro MUI_LANGUAGE "TradChinese"
LangString DISPLAYNAME ${LANG_TRADCHINESE} "Spellless 輸入法"
LangString LNKFORMANUAL ${LANG_TRADCHINESE} "【Spellless】說明書"
LangString LNKFORSETTING ${LANG_TRADCHINESE} "【Spellless】輸入法設定"
LangString LNKFORDICT ${LANG_TRADCHINESE} "【Spellless】用戶詞典管理"
LangString LNKFORSYNC ${LANG_TRADCHINESE} "【Spellless】用戶資料同步"
LangString LNKFORDEPLOY ${LANG_TRADCHINESE} "【Spellless】重新部署"
LangString LNKFORSERVER ${LANG_TRADCHINESE} "Spellless 算法服務"
LangString LNKFORUSERFOLDER ${LANG_TRADCHINESE} "【Spellless】用戶文件夾"
LangString LNKFORAPPFOLDER ${LANG_TRADCHINESE} "【Spellless】程序文件夾"
LangString LNKFORUPDATER ${LANG_TRADCHINESE} "【Spellless】檢查新版本"
LangString LNKFORSETUP ${LANG_TRADCHINESE} "【Spellless】安裝選項"
LangString LNKFORUNINSTALL ${LANG_TRADCHINESE} "卸載 Spellless"
LangString CONFIRMATION ${LANG_TRADCHINESE} "安裝前，請先卸載舊版本的 Spellless。$\n$\n按下「確定」移除舊版本，按下「取消」放棄本次安裝。"
LangString SYSTEMVERSIONNOTOK ${LANG_TRADCHINESE} "您的系统不被支持，最低系統要求:Windows 8.1!"
LangString AUTOCHKUPDATE ${LANG_TRADCHINESE} "自動檢查版本更新？"

!insertmacro MUI_LANGUAGE "SimpChinese"
LangString DISPLAYNAME ${LANG_SIMPCHINESE} "Spellless 输入法"
LangString LNKFORMANUAL ${LANG_SIMPCHINESE} "【Spellless】说明书"
LangString LNKFORSETTING ${LANG_SIMPCHINESE} "【Spellless】输入法设定"
LangString LNKFORDICT ${LANG_SIMPCHINESE} "【Spellless】用户词典管理"
LangString LNKFORSYNC ${LANG_SIMPCHINESE} "【Spellless】用户资料同步"
LangString LNKFORDEPLOY ${LANG_SIMPCHINESE} "【Spellless】重新部署"
LangString LNKFORSERVER ${LANG_SIMPCHINESE} "Spellless 算法服务"
LangString LNKFORUSERFOLDER ${LANG_SIMPCHINESE} "【Spellless】用户文件夹"
LangString LNKFORAPPFOLDER ${LANG_SIMPCHINESE} "【Spellless】程序文件夹"
LangString LNKFORUPDATER ${LANG_SIMPCHINESE} "【Spellless】检查新版本"
LangString LNKFORSETUP ${LANG_SIMPCHINESE} "【Spellless】安装选项"
LangString LNKFORUNINSTALL ${LANG_SIMPCHINESE} "卸载 Spellless"
LangString CONFIRMATION ${LANG_SIMPCHINESE} '安装前，请先卸载旧版本的 Spellless。$\n$\n点击 "确定" 移除旧版本，或点击 "取消" 放弃本次安装。'
LangString SYSTEMVERSIONNOTOK ${LANG_SIMPCHINESE} "您的系統不被支持，最低系统要求:Windows 8.1!"
LangString AUTOCHKUPDATE ${LANG_SIMPCHINESE} "自动检查版本更新？"

!insertmacro MUI_LANGUAGE "English"
LangString DISPLAYNAME ${LANG_ENGLISH} "Spellless"
LangString LNKFORMANUAL ${LANG_ENGLISH} "Spellless Manual"
LangString LNKFORSETTING ${LANG_ENGLISH} "Spellless Settings"
LangString LNKFORDICT ${LANG_ENGLISH} "Spellless Dictionary Manager"
LangString LNKFORSYNC ${LANG_ENGLISH} "Spellless Sync User Profile"
LangString LNKFORDEPLOY ${LANG_ENGLISH} "Spellless Deploy"
LangString LNKFORSERVER ${LANG_ENGLISH} "Spellless Server"
LangString LNKFORUSERFOLDER ${LANG_ENGLISH} "Spellless User Folder"
LangString LNKFORAPPFOLDER ${LANG_ENGLISH} "Spellless App Folder"
LangString LNKFORUPDATER ${LANG_ENGLISH} "Spellless Check for Updates"
LangString LNKFORSETUP ${LANG_ENGLISH} "Spellless Installation Preference"
LangString LNKFORUNINSTALL ${LANG_ENGLISH} "Uninstall Spellless"
LangString CONFIRMATION ${LANG_ENGLISH} "Before installation, please uninstall the old version of Spellless.$\n$\nPress 'OK' to remove the old version, or 'Cancel' to abort installation."
LangString SYSTEMVERSIONNOTOK ${LANG_ENGLISH} "Your system not supported, minimium system required: Windows 8.1!"
LangString AUTOCHKUPDATE ${LANG_ENGLISH} "Automatically check for updates?"

;--------------------------------

Function .onInit
  ; if not version >= 8.1, quit and MessageBox(if not silent)
  ${IfNot} ${AtLeastWin8.1}
    IfSilent toquit
    MessageBox MB_OK '$(SYSTEMVERSIONNOTOK)'
toquit:
    Quit
  ${EndIf}

  ReadRegStr $R0 HKLM "Software\Rime\Spellless" "InstallDir"
  StrCmp $R0 "" 0 skip
  ; The default installation directory
  ; install x64 build for NativeARM64_WINDOWS11 and NativeAMD64_WINDOWS11
  ${If} ${AtLeastWin11} ; Windows 11 and above
    ${If} ${IsNativeARM64}
      StrCpy $INSTDIR "$PROGRAMFILES64\Rime"
    ${ElseIf} ${IsNativeAMD64}
      StrCpy $INSTDIR "$PROGRAMFILES64\Rime"
    ${Else}
      StrCpy $INSTDIR "$PROGRAMFILES\Rime"
    ${Endif}
  ; install x64 build for NativeAMD64_BELLOW_WINDOWS11
  ${Else} ; Windows 10 or bellow
    ${If} ${IsNativeAMD64}
      StrCpy $INSTDIR "$PROGRAMFILES64\Rime"
    ${Else}
      StrCpy $INSTDIR "$PROGRAMFILES\Rime"
    ${Endif}
  ${Endif}
skip:
  ReadRegStr $R0 HKLM \
  "Software\Microsoft\Windows\CurrentVersion\Uninstall\Spellless" \
  "UninstallString"
  StrCmp $R0 "" done

  StrCpy $0 "Upgrade"
  IfSilent uninst 0
  MessageBox MB_OKCANCEL|MB_ICONINFORMATION "$(CONFIRMATION)" IDOK uninst
  Abort

uninst:
  ; Backup data directory from previous installation, user files may exist
  ReadRegStr $R1 HKLM SOFTWARE\Rime\Spellless "WeaselRoot"
  StrCmp $R1 "" call_uninstaller
  IfFileExists $R1\data\*.* 0 call_uninstaller
  CreateDirectory $TEMP\spellless-backup
  CopyFiles $R1\data\*.* $TEMP\spellless-backup

call_uninstaller:
  ExecWait '"$R1\WeaselServer.exe" /quit'
  ExecWait '"$R1\WeaselSetup.exe" /u'
  ; Remove registry keys
  ; This product's key only.  Deleting SOFTWARE\Rime outright would take
  ; a stock Weasel's InstallDir with it, and the two are meant to coexist.
  DeleteRegKey HKLM SOFTWARE\Rime\Spellless
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Spellless"
  ; don't redirect on 64 bit system for auto run setting
  ${If} ${IsNativeARM64}
    SetRegView 64
  ${ElseIf} ${IsNativeAMD64}
    SetRegView 64
  ${Endif}
  DeleteRegValue HKLM "Software\Microsoft\Windows\CurrentVersion\Run" "SpelllessServer"
  ; recover back to 32bit view
  SetRegView 32
  ; Remove files and uninstaller
  Delete  "$R1\data\opencc\*.*"
  Delete  "$R1\data\preview\*.*"
  Delete  "$R1\data\*.*"
  Delete  "$R1\*.*"
  RMDir   "$R1\data\opencc"
  RMDir   "$R1\data\preview"
  RMDir   "$R1\data"
  RMDir   "$R1"
  SetShellVarContext all
  Delete  "$SMPROGRAMS\$(DISPLAYNAME)\*.*"
  RMDir  "$SMPROGRAMS\$(DISPLAYNAME)"
  ; Prompt reboot
  SetRebootFlag true
  Sleep 800

done:
FunctionEnd

; Registry key to check for directory (so if you install again, it will
; overwrite the old one automatically)
InstallDirRegKey HKLM "Software\Rime\Spellless" "InstallDir"

; The stuff to install
Section "Spellless"

  SectionIn RO

  ; Write the new installation path into the registry
  ; redirect on 64 bit system
  ; HKLM SOFTWARE\WOW6432Node\Rime\Spellless "InstallDir" "$INSTDIR"
  WriteRegStr HKLM SOFTWARE\Rime\Spellless "InstallDir" "$INSTDIR"

  ; Reset INSTDIR for the new version
  StrCpy $INSTDIR "${WEASEL_ROOT}"

  IfFileExists "$INSTDIR\WeaselServer.exe" 0 +2
  ExecWait '"$INSTDIR\WeaselServer.exe" /quit'

  SetOverwrite try
  ; Set output path to the installation directory.
  SetOutPath $INSTDIR

  IfFileExists $TEMP\spellless-backup\*.* 0 program_files
  CreateDirectory $INSTDIR\data
  CopyFiles $TEMP\spellless-backup\*.* $INSTDIR\data
  RMDir /r $TEMP\spellless-backup

program_files:
  File "LICENSE.txt"
  File "README.txt"
  File "7-zip-license.txt"
  File "7z.dll"
  File "7z.exe"
  File "COPYING-curl.txt"
  File "curl.exe"
  File "curl-ca-bundle.crt"
  File "rime-install.bat"
  File "rime-install-config.bat"
  File "start_service.bat"
  File "stop_service.bat"
  File "spellless.dll"
  ${If} ${RunningX64}
    File "spelllessx64.dll"
  ${EndIf}
  ${If} ${IsNativeARM64}
    File /nonfatal "spelllessARM.dll"
    File /nonfatal "spelllessARM64.dll"
    File /nonfatal "spelllessARM64X.dll"
  ${EndIf}
  File "spellless.ime"
  ${If} ${RunningX64}
    File "spelllessx64.ime"
  ${EndIf}
  ${If} ${IsNativeARM64}
    File /nonfatal "spelllessARM.ime"
    File /nonfatal "spelllessARM64.ime"
    File /nonfatal "spelllessARM64X.ime"
  ${EndIf}
  ; install x64 build for NativeARM64_WINDOWS11 and NativeAMD64_WINDOWS11
  ${If} ${AtLeastWin11} ; Windows 11 and above
    ${If} ${IsNativeARM64}
      File "WeaselDeployer.exe"
      File "WeaselServer.exe"
      File "rime.dll"
      File "WinSparkle.dll"
    ${ElseIf} ${IsNativeAMD64}
      File "WeaselDeployer.exe"
      File "WeaselServer.exe"
      File "rime.dll"
      File "WinSparkle.dll"
    ${Else}
      File "Win32\WeaselDeployer.exe"
      File "Win32\WeaselServer.exe"
      File "Win32\rime.dll"
      File "Win32\WinSparkle.dll"
    ${Endif}
  ; install x64 build for NativeAMD64_BELLOW_WINDOWS11
  ${Else} ; Windows 10 or bellow
    ${If} ${IsNativeAMD64}
      File "WeaselDeployer.exe"
      File "WeaselServer.exe"
      File "rime.dll"
      File "WinSparkle.dll"
    ${Else}
      File "Win32\WeaselDeployer.exe"
      File "Win32\WeaselServer.exe"
      File "Win32\rime.dll"
      File "Win32\WinSparkle.dll"
    ${Endif}
  ${Endif}

  File "WeaselSetup.exe"
  ; shared data files
  SetOutPath $INSTDIR\data
  File "data\*.yaml"
  File /nonfatal "data\*.txt"
  File /nonfatal "data\*.gram"
  File /nonfatal "data\*.ico"
  ; Spellless: the Lua matcher and the generated dictionary.  `data\*.yaml`
  ; above takes the schema and nothing else, so without these two the input
  ; method installs, loads, and produces no candidates at all.
  ;
  ; They go in the *shared* data directory rather than a user directory so that
  ; a fresh install works before the user has one.  librime-lua puts both
  ; directories on package.path -- user first, then shared (src/modules.cc) --
  ; and the schema looks for its dictionary in the same order, so a user who
  ; later installs their own build gets it in front of this one.
  SetOutPath $INSTDIR\data\lua
  File /r "data\lua\*.*"
  SetOutPath $INSTDIR\data\spellless
  File "data\spellless\*.*"
  ; opencc data files.  /nonfatal: OpenCC only serves the Chinese
  ; simplified/traditional conversion in the bundled Chinese schemas, and a
  ; Spellless build has no reason to fail to package because `build.bat opencc`
  ; was never run.  Run it if you want those schemas complete.
  SetOutPath $INSTDIR\data\opencc
  File /nonfatal "data\opencc\*.json"
  File /nonfatal "data\opencc\*.ocd*"
  ; images
  SetOutPath $INSTDIR\data\preview
  File "data\preview\*.png"

  SetOutPath $INSTDIR

  ; test /T flag for zh_TW locale
  StrCpy $R2 "/i"
  ${GetParameters} $R0
  ClearErrors
  ${GetOptions} $R0 "/S" $R1
  IfErrors +2 0
  StrCpy $R2 "/s"
  ${GetOptions} $R0 "/T" $R1
  IfErrors +2 0
  StrCpy $R2 "/t"

  ExecWait '"$INSTDIR\WeaselSetup.exe" $R2'

  ; Write the uninstall keys for Windows
  WriteRegStr HKLM "${REG_UNINST_KEY}" "DisplayName" "$(DISPLAYNAME)"
  WriteRegStr HKLM "${REG_UNINST_KEY}" "DisplayIcon" '"$INSTDIR\WeaselServer.exe"'
  WriteRegStr HKLM "${REG_UNINST_KEY}" "DisplayVersion" "${WEASEL_VERSION}.${WEASEL_BUILD}"
  WriteRegStr HKLM "${REG_UNINST_KEY}" "UninstallString" '"$INSTDIR\uninstall.exe"'
  WriteRegStr HKLM "${REG_UNINST_KEY}" "Publisher" "式恕堂"
  WriteRegStr HKLM "${REG_UNINST_KEY}" "URLInfoAbout" "https://rime.im/"
  WriteRegStr HKLM "${REG_UNINST_KEY}" "HelpLink" "https://rime.im/docs/"
  WriteRegDWORD HKLM "${REG_UNINST_KEY}" "NoModify" 1
  WriteRegDWORD HKLM "${REG_UNINST_KEY}" "NoRepair" 1
  WriteUninstaller "$INSTDIR\uninstall.exe"

  ; run as user...
  IfSilent deploy_silently
  ExecWait "$INSTDIR\WeaselDeployer.exe /install"
  GoTo deploy_done

  deploy_silently:
  ExecWait "$INSTDIR\WeaselDeployer.exe /deploy"
  deploy_done:

  ; don't redirect on 64 bit system for auto run setting
  ${If} ${IsNativeARM64}
    SetRegView 64
  ${ElseIf} ${IsNativeAMD64}
    SetRegView 64
  ${Endif}
  ; Write autorun key
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Run" "SpelllessServer" "$INSTDIR\WeaselServer.exe"
  ; Start WeaselServer
  Exec "$INSTDIR\WeaselServer.exe"

  ; option CheckForUpdates
  IfSilent DisableAutoCheckUpdate
  MessageBox MB_YESNO|MB_ICONINFORMATION "$(AUTOCHKUPDATE)" IDYES EnableAutoCheckUpdate
  DisableAutoCheckUpdate:
  WriteRegStr HKCU "Software\Rime\Spellless\Updates" "CheckForUpdates" "0"
  GoTo end
  EnableAutoCheckUpdate:
  WriteRegStr HKCU "Software\Rime\Spellless\Updates" "CheckForUpdates" "1"
  end:

  ; Prompt reboot
  StrCmp $0 "Upgrade" 0 +2
  SetRebootFlag true

SectionEnd

; Optional section (can be disabled by the user)
Section "Start Menu Shortcuts"
  SetShellVarContext all
  CreateDirectory "$SMPROGRAMS\$(DISPLAYNAME)"
  CreateShortCut "$SMPROGRAMS\$(DISPLAYNAME)\$(LNKFORMANUAL).lnk" "$INSTDIR\README.txt"
  CreateShortCut "$SMPROGRAMS\$(DISPLAYNAME)\$(LNKFORSETTING).lnk" "$INSTDIR\WeaselDeployer.exe" "" "$SYSDIR\shell32.dll" 21
  CreateShortCut "$SMPROGRAMS\$(DISPLAYNAME)\$(LNKFORDICT).lnk" "$INSTDIR\WeaselDeployer.exe" "/dict" "$SYSDIR\shell32.dll" 6
  CreateShortCut "$SMPROGRAMS\$(DISPLAYNAME)\$(LNKFORSYNC).lnk" "$INSTDIR\WeaselDeployer.exe" "/sync" "$SYSDIR\shell32.dll" 26
  CreateShortCut "$SMPROGRAMS\$(DISPLAYNAME)\$(LNKFORDEPLOY).lnk" "$INSTDIR\WeaselDeployer.exe" "/deploy" "$SYSDIR\shell32.dll" 144
  CreateShortCut "$SMPROGRAMS\$(DISPLAYNAME)\$(LNKFORSERVER).lnk" "$INSTDIR\WeaselServer.exe" "" "$INSTDIR\WeaselServer.exe" 0
  CreateShortCut "$SMPROGRAMS\$(DISPLAYNAME)\$(LNKFORUSERFOLDER).lnk" "$INSTDIR\WeaselServer.exe" "/userdir" "$SYSDIR\shell32.dll" 126
  CreateShortCut "$SMPROGRAMS\$(DISPLAYNAME)\$(LNKFORAPPFOLDER).lnk" "$INSTDIR\WeaselServer.exe" "/weaseldir" "$SYSDIR\shell32.dll" 19
  CreateShortCut "$SMPROGRAMS\$(DISPLAYNAME)\$(LNKFORUPDATER).lnk" "$INSTDIR\WeaselServer.exe" "/update" "$SYSDIR\shell32.dll" 13
  CreateShortCut "$SMPROGRAMS\$(DISPLAYNAME)\$(LNKFORSETUP).lnk" "$INSTDIR\WeaselSetup.exe" "" "$SYSDIR\shell32.dll" 162
  CreateShortCut "$SMPROGRAMS\$(DISPLAYNAME)\$(LNKFORUNINSTALL).lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" 0

SectionEnd

;--------------------------------

; Uninstaller

Section "Uninstall"

  ExecWait '"$INSTDIR\WeaselServer.exe" /quit'

  ExecWait '"$INSTDIR\WeaselSetup.exe" /u'

  ; Remove registry keys
  ; This product's key only.  Deleting SOFTWARE\Rime outright would take
  ; a stock Weasel's InstallDir with it, and the two are meant to coexist.
  DeleteRegKey HKLM SOFTWARE\Rime\Spellless
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Spellless"
  ; don't redirect on 64 bit system for auto run setting
  ${If} ${IsNativeARM64}
    SetRegView 64
  ${ElseIf} ${IsNativeAMD64}
    SetRegView 64
  ${Endif}
  DeleteRegValue HKLM "Software\Microsoft\Windows\CurrentVersion\Run" "SpelllessServer"

  ; Remove files and uninstaller
  SetOutPath $TEMP
  Delete  "$INSTDIR\data\spellless\*.*"
  Delete  "$INSTDIR\data\lua\spellless\*.*"
  Delete  "$INSTDIR\data\lua\*.*"
  Delete  "$INSTDIR\data\opencc\*.*"
  Delete  "$INSTDIR\data\preview\*.*"
  Delete  "$INSTDIR\data\*.*"
  Delete  "$INSTDIR\*.*"
  RMDir  "$INSTDIR\data\spellless"
  RMDir  "$INSTDIR\data\lua\spellless"
  RMDir  "$INSTDIR\data\lua"
  RMDir  "$INSTDIR\data\opencc"
  RMDir  "$INSTDIR\data\preview"
  RMDir  "$INSTDIR\data"
  RMDir  "$INSTDIR"
  SetShellVarContext all
  Delete  "$SMPROGRAMS\$(DISPLAYNAME)\*.*"
  RMDir  "$SMPROGRAMS\$(DISPLAYNAME)"

  ; Prompt reboot
  SetRebootFlag true

SectionEnd
