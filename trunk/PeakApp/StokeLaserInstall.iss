; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{5581AA48-8CD1-4C17-B2EA-882C7089B206}
AppName={cm:MyAppName}
AppVersion=1.0
;AppVerName=Stoke Laser Cutting Control System 1.0
AppPublisher={cm:MyPublisher}
AppPublisherURL=http://www.stokerobot.com
AppSupportURL=http://www.stokerobot.com
AppUpdatesURL=http://www.stokerobot.com
DefaultDirName={pf}\Stoke Robot
DefaultGroupName=Stoke Robot
DisableProgramGroupPage=yes
OutputBaseFilename=Stoke Laser Cutting Control System Setup
SetupIconFile=H:\TcHmiPro\TcApplication\Icons\stokerobot.ico
Compression=none
SolidCompression=no
VersionInfoVersion=1.0
UserInfoPage=yes
VersionInfoCompany=Nanjing Stoke Robot System Co.,Ltd.
VersionInfoProductName=Stoke Laser Cutting Control System 1.0
VersionInfoDescription=Stoke Laser Cutting Control System
VersionInfoCopyright=Nanjing Stoke Robot System Co.,Ltd.

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"; LicenseFile: "H:\TcHmiPro\TcApplication\License\1033\license.txt"
Name: "chinese"; MessagesFile: "compiler:Languages\Chinese.isl"; LicenseFile: "H:\TcHmiPro\TcApplication\License\2052\license.txt"

[CustomMessages]
english.MyAppName=Stoke Laser Cutting Control System 1.0
chinese.MyAppName=斯托克激光切割控制系统1.0
english.MyPublisher=Nanjing Stoke Robot System Co.,Ltd.
chinese.MyPublisher=南京斯托克机器人系统有限公司
english.InstallTWINCAT=Please install TwinCAT firstly!
chinese.InstallTWINCAT=请先安装TwinCAT!   

[Code]
var
  UserPage: TInputQueryWizardPage;

function InitializeSetup(): Boolean;
begin
  Result :=RegValueExists(HKEY_LOCAL_MACHINE, 'SOFTWARE\Beckhoff\TwinCAT', 'InstallationPath');
  if Result = False then
    MsgBox(ExpandConstant('{cm:InstallTWINCAT}'), mbInformation, MB_OK);
end;

function CheckSerial(Serial: String): Boolean;
begin
  if(Serial = '1234') then
  Result := True
  else
  Result := False;
end;

function GetDate(Param: String) : String;
begin
    Result := GetDateTimeString('ddddd', #0, #0);
end;

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "H:\TcHmiPro\TcApplication\bin\Release\TcApplication.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "H:\TcHmiPro\TcApplication\bin\Release\Auftrag\*"; DestDir: "{app}\Auftrag"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "H:\TcHmiPro\TcApplication\bin\Release\Bitmap\*"; DestDir: "{app}\Bitmap"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "H:\TcHmiPro\TcApplication\bin\Release\Customer\*"; DestDir: "{app}\Customer"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "H:\TcHmiPro\TcApplication\bin\Release\MParam\*"; DestDir: "{app}\MParam"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "H:\TcHmiPro\TcApplication\bin\Release\PLC\*"; DestDir: "{app}\PLC"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "H:\TcHmiPro\TcApplication\bin\Release\PlugIns\*"; DestDir: "{app}\PlugIn"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "H:\TcHmiPro\TcApplication\bin\Release\System\*"; DestDir: "{app}\System"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "H:\TcHmiPro\TcApplication\bin\Release\TcMenu\*"; DestDir: "{app}\TcMenu"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "H:\TcHmiPro\TcApplication\bin\Release\Beckhoff.App.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "H:\TcHmiPro\TcApplication\bin\Release\Beckhoff.App.TcMenu.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "H:\TcHmiPro\TcApplication\bin\Release\Beckhoff.App.TcMenu.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "H:\TcHmiPro\TcApplication\bin\Release\Beckhoff.App.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "H:\TcHmiPro\TcApplication\bin\Release\Beckhoff.DesignerFrame.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "H:\TcHmiPro\TcApplication\bin\Release\Beckhoff.EventLogger.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "H:\TcHmiPro\TcApplication\bin\Release\Beckhoff.EventLogger.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "H:\TcHmiPro\TcApplication\bin\Release\Beckhoff.Forms.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "H:\TcHmiPro\TcApplication\bin\Release\Beckhoff.Forms.Nc.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "H:\TcHmiPro\TcApplication\bin\Release\Beckhoff.Forms.Nc.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "H:\TcHmiPro\TcApplication\bin\Release\Beckhoff.Forms.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "H:\TcHmiPro\TcApplication\bin\Release\Interop.TCEVENTLOGGERLib.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "H:\TcHmiPro\TcApplication\bin\Release\Interop.TcEventLogProxyLib.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "H:\TcHmiPro\TcApplication\bin\Release\Interop.TCSYSTEMLib.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "H:\TcHmiPro\TcApplication\bin\Release\log4net.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "H:\TcHmiPro\TcApplication\bin\Release\Program.log"; DestDir: "{app}"; Flags: ignoreversion
Source: "H:\TcHmiPro\TcApplication\bin\Release\TcAppIoDiagnostic.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "H:\TcHmiPro\TcApplication\bin\Release\TcApplication.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "H:\TcHmiPro\TcApplication\bin\Release\tcAppPlcManual.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "H:\TcHmiPro\TcApplication\bin\Release\TcAppUser.usr"; DestDir: "{app}"; Flags: ignoreversion
Source: "H:\TcHmiPro\TcApplication\bin\Release\TcHmiPlugIn.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "H:\TcHmiPro\TcApplication\bin\Release\TwinCAT.Ads.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "H:\TcHmiPro\TcApplication\bin\Release\TwinCAT.Ads.xml"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\Stoke Laser Cutting Control System"; Filename: "{app}\TcApplication.exe"
Name: "{commondesktop}\Stoke Laser Cutting Control System"; Filename: "{app}\TcApplication.exe"; Tasks: desktopicon
Name: "{group}\Uninstall"; Filename: "{app}\unins000.exe" ; IconFilename: "H:\TcHmiPro\TcApplication\Icons\modern-uninstall.ico"

[Run]
Filename: "{app}\TcApplication.exe"; Description: "{cm:LaunchProgram,Stoke Laser Cutting Control System}"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: filesandordirs; Name: "{app}\Bitmap\"
Type: filesandordirs; Name: "{app}\Customer\"
Type: filesandordirs; Name: "{app}\System\"

[Registry]
Root: HKLM; Subkey: "Software\Stoke Robot"; Flags: uninsdeletekeyifempty
Root: HKLM; Subkey: "Software\Stoke Robot\Stoke Laser Cutting Control System"; 
Root: HKLM; Subkey: "Software\Stoke Robot\Stoke Laser Cutting Control System\Settings"; ValueType: string; ValueName: "Path"; ValueData: "{app}" ;   Flags: uninsdeletekey
Root: HKLM; Subkey: "Software\Stoke Robot\Stoke Laser Cutting Control System\Settings"; ValueType: string; ValueName: "Version"; ValueData: "1.0" ;    Flags: uninsdeletekey
Root: HKLM; Subkey: "Software\Stoke Robot\Stoke Laser Cutting Control System\UserInfo"; ValueType: string; ValueName: "Name"; ValueData: "{userinfoname}"
Root: HKLM; Subkey: "Software\Stoke Robot\Stoke Laser Cutting Control System\UserInfo"; ValueType: string; ValueName: "Company"; ValueData: "{userinfoorg}"
Root: HKLM; Subkey: "Software\Stoke Robot\Stoke Laser Cutting Control System\UserInfo"; ValueType: string; ValueName: "SerialNumber"; ValueData: "{userinfoserial}" ;Flags: uninsdeletekey
Root: HKLM; Subkey: "Software\Stoke Robot\Stoke Laser Cutting Control System\UserInfo"; ValueType: string; ValueName: "InstallDate"; ValueData:"{code:GetDate|test}" 
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\SLCCS\TcApplication.exe"; ValueType: string; ValueName: "Date"; ValueData: "{code:GetDate|test}"
