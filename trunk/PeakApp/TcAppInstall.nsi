; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "Stoke Laser Cutting Control System"
!define PRODUCT_VERSION "1.0"
!define PRODUCT_PUBLISHER "Stoke Robot System Co.,Ltd"
!define PRODUCT_WEB_SITE "http://www.stokerobot.com"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\TcApplication.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

!define TEMP1 $R0 ;Temp variable
; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "TcApplication\Icons\stokerobot.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Language Selection Dialog Settings
!define MUI_LANGDLL_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "NSIS:Language"

!define MUI_LANGDLL_ALWAYSSHOW
!define MUI_WELCOMEFINISHPAGE_BITMAP "TcApplication\Icons\stoke2.bmp"
; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!define MUI_LICENSEPAGE_CHECKBOX
!insertmacro MUI_PAGE_LICENSE "$(MUILicense)"
Page custom SetCustom ValidateCustom ": Testing InstallOptions" ;Custom page. InstallOptions gets called in SetCustom.
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\TcApplication.exe"
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "SimpChinese"

!insertmacro MUI_RESERVEFILE_LANGDLL
ReserveFile "${NSISDIR}\Plugins\InstallOptions.dll"
ReserveFile "\userinfo.ini"

; License Language
LicenseLangString MUILicense 1033 "TcApplication\License\1033\license.txt"
LicenseLangString MUILicense 2052 "TcApplication\License\2052\license.txt"
LangString installtwincat 1033 "TwinCAT not found, please install TwinCAT firstly!"
LangString installtwincat 2052 "请先安装TwinCAT!"
LangString removed 1033 "removed from your computer."
LangString removed 2052 "已成功地从你的计算机移除。"
LangString uninstallmsg 1033 "Are you reall want to remove"
LangString uninstallmsg 2052 "你确实要完全移除"
LangString alreadyinstall 1033 "Stoke Laser Cutting Control System has been installed on this computer!"
LangString alreadyinstall 2052 "斯托克激光切割控制系统已经安装在本机！"


; MUI end ------
var productname
Name "$productname ${PRODUCT_VERSION}"
OutFile "Stoke Laser Cutting Control System Setup.exe"
InstallDir "$PROGRAMFILES\Stoke Robot"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show
SetCompress off
BrandingText "Stoke Robot Software"

VIProductVersion "1.0.0.0"
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "Stoke Laser Cutting Control System"
;VIAddVersionKey /LANG=${LANG_ENGLISH} "Comments" "A test comment"
VIAddVersionKey /LANG=${LANG_ENGLISH} "CompanyName" "Nanjing Stoke robot sstem co.,Ltd"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "Nanjing Stoke robot sstem co.,Ltd"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "Stoke Laser Cutting Control System"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "1.0"

VIAddVersionKey /LANG=2052 "ProductName" "斯托克激光切割控制系统"
;VIAddVersionKey /LANG=2052 "Comments" "测试"
VIAddVersionKey /LANG=2052 "CompanyName" "南京斯托克机器人系统有限公司"
VIAddVersionKey /LANG=2052 "LegalCopyright" "南京斯托克机器人系统有限公司"
VIAddVersionKey /LANG=2052 "FileDescription" "斯托克激光切割控制系统"
VIAddVersionKey /LANG=2052 "FileVersion" "1.0"


Function .onInit
  InitPluginsDir
  File "\userinfo.ini"
  ClearErrors
  EnumRegKey $0 HKLM "SOFTWARE\Beckhoff\TwinCAT" 0
  IfErrors 0 keyexist
  # key does not exist
  MessageBox MB_OK "$(installtwincat)"
  Abort ; causes installer to quit.
  keyexist:
  ClearErrors
  EnumRegKey $0 HKLM "${PRODUCT_DIR_REGKEY}" 0
  IfErrors 0 keyexist1
  # key does not exist
  !insertmacro MUI_LANGDLL_DISPLAY
  Strcmp $LANGUAGE "1033" 0 +3
  StrCpy $productname "Stoke Laser Cutting Control System"
  Goto +2
  StrCpy $productname "斯托克激光切割控制系统"
  Goto +4
  keyexist1:
  MessageBox MB_OK $(alreadyinstall)
  Abort ; causes installer to quit.
FunctionEnd

Function SetCustom

  ;Display the InstallOptions dialog

  Push ${TEMP1}

    InstallOptions::dialog /NOUNLOAD "\userinfo.ini"
    Pop ${TEMP1}
    InstallOptions::show
  Pop ${TEMP1}

FunctionEnd

Function ValidateCustom

FileOpen $1 $EXEDIR\${TEMP1}.ini w
FileClose $1

  done:
FunctionEnd

Section "MainSection" SEC01
  SetOutPath "$INSTDIR\PLC\External Variables"
  SetOverwrite try
  File "TcApplication\bin\Release\PLC\External Variables\TwinCAT_CNC_OneChannel_with_ExternalVars.tsm"
  File "TcApplication\bin\Release\PLC\External Variables\TwinCAT_CNC_PLC_with_ExternalVars.pro"
  SetOutPath "$INSTDIR\PLC"
  File "TcApplication\bin\Release\PLC\TwinCAT_CNC_OneChannel.tsm"
  File "TcApplication\bin\Release\PLC\TwinCAT_CNC_PLC.pro"
  
  SetOutPath "$INSTDIR\Bitmap"
  File "TcApplication\bin\Release\Bitmap\active.ico"
  File "TcApplication\bin\Release\Bitmap\AllRef.ico"
  File "TcApplication\bin\Release\Bitmap\AXHand.ico"
  File "TcApplication\bin\Release\Bitmap\Backup.ico"
  File "TcApplication\bin\Release\Bitmap\BDE.bmp"
  File "TcApplication\bin\Release\Bitmap\BeckhoffMain.jpg"
  File "TcApplication\bin\Release\Bitmap\Eilgang.ico"
  File "TcApplication\bin\Release\Bitmap\Help.ico"
  File "TcApplication\bin\Release\Bitmap\Key_M.ico"
  File "TcApplication\bin\Release\Bitmap\Key_MM.ico"
  File "TcApplication\bin\Release\Bitmap\Key_P.ico"
  File "TcApplication\bin\Release\Bitmap\Key_PP.ico"
  File "TcApplication\bin\Release\Bitmap\Load.ico"
  File "TcApplication\bin\Release\Bitmap\PCAw.ico"
  File "TcApplication\bin\Release\Bitmap\Save.ico"
  File "TcApplication\bin\Release\Bitmap\TwinCAT_CNC.ico"
  File "TcApplication\bin\Release\Bitmap\User.ico"
  File "TcApplication\bin\Release\Bitmap\User02.ico"
  File "TcApplication\bin\Release\Bitmap\User09.ico"
  
  SetOutPath "$INSTDIR\Bitmap\Flags"
  File "TcApplication\bin\Release\Bitmap\Flags\arabien.gif"
  File "TcApplication\bin\Release\Bitmap\Flags\bw.GIF"
  File "TcApplication\bin\Release\Bitmap\Flags\bw1.gif"
  File "TcApplication\bin\Release\Bitmap\Flags\bw2.GIF"
  File "TcApplication\bin\Release\Bitmap\Flags\china.gif"
  File "TcApplication\bin\Release\Bitmap\Flags\daenemark.gif"
  File "TcApplication\bin\Release\Bitmap\Flags\deutsch.gif"
  File "TcApplication\bin\Release\Bitmap\Flags\england.gif"
  File "TcApplication\bin\Release\Bitmap\Flags\finnland.gif"
  File "TcApplication\bin\Release\Bitmap\Flags\frankreich.gif"
  File "TcApplication\bin\Release\Bitmap\Flags\Free1.GIF"
  File "TcApplication\bin\Release\Bitmap\Flags\Free2.GIF"
  File "TcApplication\bin\Release\Bitmap\Flags\Free3.GIF"
  File "TcApplication\bin\Release\Bitmap\Flags\griechenland.gif"
  File "TcApplication\bin\Release\Bitmap\Flags\italien.gif"
  File "TcApplication\bin\Release\Bitmap\Flags\japan.gif"
  File "TcApplication\bin\Release\Bitmap\Flags\niederlande.gif"
  File "TcApplication\bin\Release\Bitmap\Flags\norwegen.gif"
  File "TcApplication\bin\Release\Bitmap\Flags\portugal.gif"
  File "TcApplication\bin\Release\Bitmap\Flags\russland.gif"
  File "TcApplication\bin\Release\Bitmap\Flags\schweden.gif"
  File "TcApplication\bin\Release\Bitmap\Flags\spanien.gif"
  File "TcApplication\bin\Release\Bitmap\Flags\tschechien.gif"
  File "TcApplication\bin\Release\Bitmap\Flags\tuerkei.gif"
  File "TcApplication\bin\Release\Bitmap\Flags\ungarn.gif"
  
  SetOutPath "$INSTDIR\Bitmap\State"
  File "TcApplication\bin\Release\Bitmap\State\Backward.ico"
  File "TcApplication\bin\Release\Bitmap\State\Backward2.ico"
  File "TcApplication\bin\Release\Bitmap\State\BlkIgn.ico"
  File "TcApplication\bin\Release\Bitmap\State\BlkIgn2.ico"
  File "TcApplication\bin\Release\Bitmap\State\ChReset.ico"
  File "TcApplication\bin\Release\Bitmap\State\ChStart.ico"
  File "TcApplication\bin\Release\Bitmap\State\ChStop.ico"
  File "TcApplication\bin\Release\Bitmap\State\Enable.ico"
  File "TcApplication\bin\Release\Bitmap\State\Enable2.ico"
  File "TcApplication\bin\Release\Bitmap\State\M01Stop.ico"
  File "TcApplication\bin\Release\Bitmap\State\M01Stop2.ico"
  File "TcApplication\bin\Release\Bitmap\State\M_AUTO.bmp"
  File "TcApplication\bin\Release\Bitmap\State\M_Manual.bmp"
  File "TcApplication\bin\Release\Bitmap\State\M_MDI.bmp"
  File "TcApplication\bin\Release\Bitmap\State\M_NOT_READY.bmp"
  File "TcApplication\bin\Release\Bitmap\State\M_READY.bmp"
  File "TcApplication\bin\Release\Bitmap\State\M_RPF.bmp"
  File "TcApplication\bin\Release\Bitmap\State\Single.ico"
  File "TcApplication\bin\Release\Bitmap\State\Single2.ico"
  
  SetOutPath "$INSTDIR\Auftrag"
  File "TcApplication\bin\Release\Auftrag\aa.dat"
  File "TcApplication\bin\Release\Auftrag\abc.dat"
  File "TcApplication\bin\Release\Auftrag\bb.dat"
  File "TcApplication\bin\Release\Auftrag\Da.dat"
  File "TcApplication\bin\Release\Auftrag\Datei.dat"
  File "TcApplication\bin\Release\Auftrag\Datei1.dat"
  File "TcApplication\bin\Release\Auftrag\Datei12.dat"
  File "TcApplication\bin\Release\Auftrag\Datei12asd.dat"
  File "TcApplication\bin\Release\Auftrag\Datei2.dat"
  File "TcApplication\bin\Release\Auftrag\Datei3.dat"
  File "TcApplication\bin\Release\Auftrag\Datei4.dat"
  File "TcApplication\bin\Release\Auftrag\RecipeConfig.xml"
  
  SetOutPath "$INSTDIR\Customer"
  File "TcApplication\bin\Release\Customer\Logo.bmp"
  File "TcApplication\bin\Release\Customer\Machine.JPG"
  File "TcApplication\bin\Release\Customer\MView.ini"
  File "TcApplication\bin\Release\Customer\beckhoff_240x96_l.bmp"
  File "TcApplication\bin\Release\Customer\beckhoff_240x96_s.bmp"

  
  SetOutPath "$INSTDIR\MParam"
  File "TcApplication\bin\Release\MParam\ListData1.dat"
  File "TcApplication\bin\Release\MParam\ListData2.dat"
  File "TcApplication\bin\Release\MParam\ListData3.dat"
  File "TcApplication\bin\Release\MParam\ListDataBool.dat"
  File "TcApplication\bin\Release\MParam\ListDataInt.dat"
  File "TcApplication\bin\Release\MParam\ListDataStrings.dat"
  File "TcApplication\bin\Release\MParam\ListDataTimer.dat"
  File "TcApplication\bin\Release\MParam\NullPunkte.dat"
  
  SetOutPath "$INSTDIR\System"
  File "TcApplication\bin\Release\System\Backup.bat"
  File "TcApplication\bin\Release\System\Batch.bat"
  File "TcApplication\bin\Release\System\CycleTimes.ini"
  File "TcApplication\bin\Release\System\CycleTimes1.var"
  File "TcApplication\bin\Release\System\Host.bat"
  File "TcApplication\bin\Release\System\Language.dat"
  File "TcApplication\bin\Release\System\log.xml"
  File "TcApplication\bin\Release\System\Manual.dat"
  File "TcApplication\bin\Release\System\MaschParam.ini"
  File "TcApplication\bin\Release\System\PLCStatus.ini"
  File "TcApplication\bin\Release\System\PLCStatus1.var"
  File "TcApplication\bin\Release\System\PLCStatus2.var"
  File "TcApplication\bin\Release\System\PLCStatus3.var"
  File "TcApplication\bin\Release\System\Remote.bat"
  File "TcApplication\bin\Release\System\String.dat"
  File "TcApplication\bin\Release\System\tccnc_axis.xml"
  File "TcApplication\bin\Release\System\tccnc_channel.xml"
  File "TcApplication\bin\Release\System\Texte.mdb"
  
  SetOutPath "$INSTDIR\TcMenu"
  File "TcApplication\bin\Release\TcMenu\TcMenu.xml"
  SetOverwrite ifnewer
  
  SetOutPath "$INSTDIR"
  File "TcApplication\bin\Release\TwinCAT.Ads.dll"
  File "TcApplication\bin\Release\TcHmiPlugIn.dll"
  File "TcApplication\bin\Release\TcAppUser.usr"
  File "TcApplication\bin\Release\tcAppPlcManual.dll"
  File "TcApplication\bin\Release\TcApplication.exe"
  CreateDirectory "$SMPROGRAMS\Stoke Robot"
  CreateShortCut "$SMPROGRAMS\Stoke Robot\Stoke Laser Cutting Control System.lnk" "$INSTDIR\TcApplication.exe"
  CreateShortCut "$DESKTOP\Stoke Laser Cutting Control System.lnk" "$INSTDIR\TcApplication.exe"
  File "TcApplication\bin\Release\TcAppIoDiagnostic.dll"
  File "TcApplication\bin\Release\log4net.dll"
  File "TcApplication\bin\Release\Interop.TCSYSTEMLib.dll"
  File "TcApplication\bin\Release\Interop.TcEventLogProxyLib.dll"
  File "TcApplication\bin\Release\Interop.TCEVENTLOGGERLib.dll"
  File "TcApplication\bin\Release\Beckhoff.Forms.xml"
  File "TcApplication\bin\Release\Beckhoff.Forms.Nc.xml"
  File "TcApplication\bin\Release\Beckhoff.Forms.Nc.dll"
  File "TcApplication\bin\Release\Beckhoff.Forms.dll"
  File "TcApplication\bin\Release\Beckhoff.EventLogger.xml"
  File "TcApplication\bin\Release\Beckhoff.EventLogger.dll"
  File "TcApplication\bin\Release\Beckhoff.DesignerFrame.dll"
  File "TcApplication\bin\Release\Beckhoff.App.xml"
  File "TcApplication\bin\Release\Beckhoff.App.TcMenu.xml"
  File "TcApplication\bin\Release\Beckhoff.App.TcMenu.dll"
  File "TcApplication\bin\Release\Beckhoff.App.dll"
  File "TcApplication\bin\Release\TwinCAT.Ads.xml"
SectionEnd

Section -AdditionalIcons
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\Stoke Robot\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\Stoke Robot\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\TcApplication.exe"
  Strcmp $LANGUAGE "1033" 0 +3
  StrCpy $productname "Stoke Laser Cutting Control System"
  Goto +2
  StrCpy $productname "斯托克激光切割控制系统"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\TcApplication.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  Strcmp $LANGUAGE "1033" 0 +3
  StrCpy $productname "Stoke Laser Cutting Control System"
  Goto +2
  StrCpy $productname "斯托克激光切割控制系统"
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) $(removed)"
FunctionEnd

Function un.onInit
!insertmacro MUI_UNGETLANGUAGE
  Strcmp $LANGUAGE "1033" 0 +3
  StrCpy $productname "Stoke Laser Cutting Control System"
  Goto +2
  StrCpy $productname "斯托克激光切割控制系统"
  ;!define MUI_UNCONFIRMPAGE_TEXT_TOP "$(^Name)"
  ;MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "$(uninstallmsg) $(^Name)？" IDYES +2
  ;Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\TwinCAT.Ads.xml"
  Delete "$INSTDIR\Beckhoff.App.dll"
  Delete "$INSTDIR\Beckhoff.App.TcMenu.dll"
  Delete "$INSTDIR\Beckhoff.App.TcMenu.xml"
  Delete "$INSTDIR\Beckhoff.App.xml"
  Delete "$INSTDIR\Beckhoff.DesignerFrame.dll"
  Delete "$INSTDIR\Beckhoff.EventLogger.dll"
  Delete "$INSTDIR\Beckhoff.EventLogger.xml"
  Delete "$INSTDIR\Beckhoff.Forms.dll"
  Delete "$INSTDIR\Beckhoff.Forms.Nc.dll"
  Delete "$INSTDIR\Beckhoff.Forms.Nc.xml"
  Delete "$INSTDIR\Beckhoff.Forms.xml"
  Delete "$INSTDIR\Interop.TCEVENTLOGGERLib.dll"
  Delete "$INSTDIR\Interop.TcEventLogProxyLib.dll"
  Delete "$INSTDIR\Interop.TCSYSTEMLib.dll"
  Delete "$INSTDIR\log4net.dll"
  Delete "$INSTDIR\TcAppIoDiagnostic.dll"
  Delete "$INSTDIR\TcApplication.exe"
  Delete "$INSTDIR\tcAppPlcManual.dll"
  Delete "$INSTDIR\TcAppUser.usr"
  Delete "$INSTDIR\TcHmiPlugIn.dll"
  Delete "$INSTDIR\TwinCAT.Ads.dll"
  Delete "$INSTDIR\TwinCAT.Ads.xml"
  
  Delete "$INSTDIR\TcMenu\TcMenu.xml"
    
  Delete "$INSTDIR\System\Texte.mdb"
  Delete "$INSTDIR\System\tccnc_channel.xml"
  Delete "$INSTDIR\System\tccnc_axis.xml"
  Delete "$INSTDIR\System\String.dat"
  Delete "$INSTDIR\System\Remote.bat"
  Delete "$INSTDIR\System\PLCStatus3.var"
  Delete "$INSTDIR\System\PLCStatus2.var"
  Delete "$INSTDIR\System\PLCStatus1.var"
  Delete "$INSTDIR\System\PLCStatus.ini"
  Delete "$INSTDIR\System\MaschParam.ini"
  Delete "$INSTDIR\System\Manual.dat"
  Delete "$INSTDIR\System\log.xml"
  Delete "$INSTDIR\System\Language.dat"
  Delete "$INSTDIR\System\Host.bat"
  Delete "$INSTDIR\System\CycleTimes1.var"
  Delete "$INSTDIR\System\CycleTimes.ini"
  Delete "$INSTDIR\System\Batch.bat"
  Delete "$INSTDIR\System\Backup.bat"
  Delete "$INSTDIR\System\*.*"
  
  Delete "$INSTDIR\MParam\NullPunkte.dat"
  Delete "$INSTDIR\MParam\ListDataTimer.dat"
  Delete "$INSTDIR\MParam\ListDataStrings.dat"
  Delete "$INSTDIR\MParam\ListDataInt.dat"
  Delete "$INSTDIR\MParam\ListDataBool.dat"
  Delete "$INSTDIR\MParam\ListData3.dat"
  Delete "$INSTDIR\MParam\ListData2.dat"
  Delete "$INSTDIR\MParam\ListData1.dat"
  Delete "$INSTDIR\MParam\*.*"
  
  Delete "$INSTDIR\Customer\MView.ini"
  Delete "$INSTDIR\Customer\Machine.JPG"
  Delete "$INSTDIR\Customer\Logo.bmp"
  Delete "$INSTDIR\Customer\beckhoff_240x96_s.bmp"
  Delete "$INSTDIR\Customer\beckhoff_240x96_l.bmp"
  Delete "$INSTDIR\Customer\*.*"
  
  Delete "$INSTDIR\Auftrag\RecipeConfig.xml"
  Delete "$INSTDIR\Auftrag\Datei4.dat"
  Delete "$INSTDIR\Auftrag\Datei3.dat"
  Delete "$INSTDIR\Auftrag\Datei2.dat"
  Delete "$INSTDIR\Auftrag\Datei12asd.dat"
  Delete "$INSTDIR\Auftrag\Datei12.dat"
  Delete "$INSTDIR\Auftrag\Datei1.dat"
  Delete "$INSTDIR\Auftrag\Datei.dat"
  Delete "$INSTDIR\Auftrag\Da.dat"
  Delete "$INSTDIR\Auftrag\bb.dat"
  Delete "$INSTDIR\Auftrag\abc.dat"
  Delete "$INSTDIR\Auftrag\aa.dat"
  Delete "$INSTDIR\Auftrag\*.*"
  
  Delete "$INSTDIR\Bitmap\User09.ico"
  Delete "$INSTDIR\Bitmap\User02.ico"
  Delete "$INSTDIR\Bitmap\User.ico"
  Delete "$INSTDIR\Bitmap\TwinCAT_CNC.ico"
  Delete "$INSTDIR\Bitmap\Save.ico"
  Delete "$INSTDIR\Bitmap\PCAw.ico"
  Delete "$INSTDIR\Bitmap\Load.ico"
  Delete "$INSTDIR\Bitmap\Key_PP.ico"
  Delete "$INSTDIR\Bitmap\Key_P.ico"
  Delete "$INSTDIR\Bitmap\Key_MM.ico"
  Delete "$INSTDIR\Bitmap\Key_M.ico"
  Delete "$INSTDIR\Bitmap\Help.ico"
  Delete "$INSTDIR\Bitmap\Eilgang.ico"
  Delete "$INSTDIR\Bitmap\BeckhoffMain.jpg"
  Delete "$INSTDIR\Bitmap\BDE.bmp"
  Delete "$INSTDIR\Bitmap\Backup.ico"
  Delete "$INSTDIR\Bitmap\AXHand.ico"
  Delete "$INSTDIR\Bitmap\AllRef.ico"
  Delete "$INSTDIR\Bitmap\active.ico"
  
  Delete "$INSTDIR\Bitmap\State\Single2.ico"
  Delete "$INSTDIR\Bitmap\State\Single.ico"
  Delete "$INSTDIR\Bitmap\State\M_RPF.bmp"
  Delete "$INSTDIR\Bitmap\State\M_READY.bmp"
  Delete "$INSTDIR\Bitmap\State\M_NOT_READY.bmp"
  Delete "$INSTDIR\Bitmap\State\M_MDI.bmp"
  Delete "$INSTDIR\Bitmap\State\M_Manual.bmp"
  Delete "$INSTDIR\Bitmap\State\M_AUTO.bmp"
  Delete "$INSTDIR\Bitmap\State\M01Stop2.ico"
  Delete "$INSTDIR\Bitmap\State\M01Stop.ico"
  Delete "$INSTDIR\Bitmap\State\Enable2.ico"
  Delete "$INSTDIR\Bitmap\State\Enable.ico"
  Delete "$INSTDIR\Bitmap\State\ChStop.ico"
  Delete "$INSTDIR\Bitmap\State\ChStart.ico"
  Delete "$INSTDIR\Bitmap\State\ChReset.ico"
  Delete "$INSTDIR\Bitmap\State\BlkIgn2.ico"
  Delete "$INSTDIR\Bitmap\State\BlkIgn.ico"
  Delete "$INSTDIR\Bitmap\State\Backward2.ico"
  Delete "$INSTDIR\Bitmap\State\Backward.ico"
  Delete "$INSTDIR\Bitmap\State\Thumb.db"
  Delete "$INSTDIR\Bitmap\State\*.*"
  
  Delete "$INSTDIR\Bitmap\Flags\ungarn.gif"
  Delete "$INSTDIR\Bitmap\Flags\tuerkei.gif"
  Delete "$INSTDIR\Bitmap\Flags\tschechien.gif"
  Delete "$INSTDIR\Bitmap\Flags\spanien.gif"
  Delete "$INSTDIR\Bitmap\Flags\schweden.gif"
  Delete "$INSTDIR\Bitmap\Flags\russland.gif"
  Delete "$INSTDIR\Bitmap\Flags\portugal.gif"
  Delete "$INSTDIR\Bitmap\Flags\norwegen.gif"
  Delete "$INSTDIR\Bitmap\Flags\niederlande.gif"
  Delete "$INSTDIR\Bitmap\Flags\japan.gif"
  Delete "$INSTDIR\Bitmap\Flags\italien.gif"
  Delete "$INSTDIR\Bitmap\Flags\griechenland.gif"
  Delete "$INSTDIR\Bitmap\Flags\Free3.GIF"
  Delete "$INSTDIR\Bitmap\Flags\Free2.GIF"
  Delete "$INSTDIR\Bitmap\Flags\Free1.GIF"
  Delete "$INSTDIR\Bitmap\Flags\frankreich.gif"
  Delete "$INSTDIR\Bitmap\Flags\finnland.gif"
  Delete "$INSTDIR\Bitmap\Flags\england.gif"
  Delete "$INSTDIR\Bitmap\Flags\deutsch.gif"
  Delete "$INSTDIR\Bitmap\Flags\daenemark.gif"
  Delete "$INSTDIR\Bitmap\Flags\china.gif"
  Delete "$INSTDIR\Bitmap\Flags\bw2.GIF"
  Delete "$INSTDIR\Bitmap\Flags\bw1.gif"
  Delete "$INSTDIR\Bitmap\Flags\bw.GIF"
  Delete "$INSTDIR\Bitmap\Flags\arabien.gif"
  Delete "$INSTDIR\Bitmap\Flags\*.*"
  Delete "$INSTDIR\Bitmap\*.*"
  
  Delete "$INSTDIR\PLC\TwinCAT_CNC_PLC.pro"
  Delete "$INSTDIR\PLC\TwinCAT_CNC_OneChannel.tsm"
  Delete "$INSTDIR\PLC\External Variables\TwinCAT_CNC_PLC_with_ExternalVars.pro"
  Delete "$INSTDIR\PLC\External Variables\TwinCAT_CNC_OneChannel_with_ExternalVars.tsm"
  Delete "$INSTDIR\PLC\*.*"

  Delete "$SMPROGRAMS\Stoke Robot\Uninstall.lnk"
  Delete "$SMPROGRAMS\Stoke Robot\Website.lnk"
  Delete "$DESKTOP\Stoke Laser Cutting Control System.lnk"
  Delete "$SMPROGRAMS\Stoke Robot\Stoke Laser Cutting Control System.lnk"
  
  RMDir "$SMPROGRAMS\Stoke Robot"
  RMDir "$INSTDIR\Bitmap\State"
  RMDir "$INSTDIR\Bitmap\Flags"
  RMDir "$INSTDIR\Bitmap"
  RMDir "$INSTDIR\Auftrag"
  RMDir "$INSTDIR\Customer"
  RMDir "$INSTDIR\MParam"
  RMDir "$INSTDIR\PLC\External Variables"
  RMDir "$INSTDIR\PLC"
  RMDir "$INSTDIR\System"
  RMDir "$INSTDIR\TcMenu"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd
