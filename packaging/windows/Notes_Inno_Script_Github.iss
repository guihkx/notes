#define Version GetEnv("APP_VERSION")

[Code]
function GetDefaultInstallDir(Param: string): string;
var
  Version: TWindowsVersion;
begin
  GetWindowsVersionEx(Version);
  if IsWin64() then
    Result := ExpandConstant('{autopf64}')
  else
    Result := ExpandConstant('{autopf32}')
end;

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{44576435-E098-4581-A6D7-FD7FADC5B063}
AppName=Notes
AppVersion={#Version}
AppPublisher=Awesomeness
AppPublisherURL=https://www.get-notes.com/
AppSupportURL=https://www.get-notes.com/
AppUpdatesURL=https://www.get-notes.com/
UninstallDisplayIcon={app}\Notes.exe
DefaultDirName={code:GetDefaultInstallDir}\Notes
DefaultGroupName=Notes
UninstallDisplayName=Notes
OutputBaseFilename=NotesSetup_{#Version}
Compression=lzma
SolidCompression=yes
; For some reason, Inno Setup can't seem to calculate the required disk space correctly.
; Let's use an approximate value to represent the size of the app: 70 MB.
ExtraDiskSpaceRequired=73400320

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
; Qt 6 build (64-bit)
; Minimum supported OS:
; - Windows 10 21H2 (1809 or later)
; Source: https://doc.qt.io/qt-6/supported-platforms.html#windows
Source: "{#SourcePath}\Notes64_Qt6\Notes.exe"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt6\libcrypto-1_1-x64.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt6\libssl-1_1-x64.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt6\msvcp140.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt6\msvcp140_1.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt6\msvcp140_2.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt6\msvcr100.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt6\vcruntime140.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt6\vcruntime140_1.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt6\d3dcompiler_47.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt6\opengl32sw.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt6\Qt6Core.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt6\Qt6Gui.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt6\Qt6Network.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt6\Qt6Sql.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt6\Qt6Svg.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt6\Qt6Widgets.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt6\iconengines\*"; DestDir: "{app}\iconengines"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsWin64; MinVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt6\imageformats\*"; DestDir: "{app}\imageformats"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsWin64; MinVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt6\networkinformation\*"; DestDir: "{app}\imageformats"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsWin64; MinVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt6\platforms\*"; DestDir: "{app}\platforms"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsWin64; MinVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt6\sqldrivers\*"; DestDir: "{app}\sqldrivers"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsWin64; MinVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt6\styles\*"; DestDir: "{app}\translations"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsWin64; MinVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt6\tls\*"; DestDir: "{app}\translations"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsWin64; MinVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt6\translations\*"; DestDir: "{app}\translations"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsWin64; MinVersion: 10.0.17763
; Qt 5 build (64-bit)
; Minimum supported OS:
; - Windows 7 (x86_64)
; Source: https://doc.qt.io/qt-5/supported-platforms.html#windows
Source: "{#SourcePath}\Notes64_Qt5\Notes.exe"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt5\libcrypto-1_1-x64.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt5\libssl-1_1-x64.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt5\msvcp140.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt5\msvcp140_1.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt5\msvcr100.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt5\vcruntime140.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt5\vcruntime140_1.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt5\d3dcompiler_47.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt5\libEGL.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt5\libGLESV2.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt5\opengl32sw.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt5\Qt5Core.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt5\Qt5Gui.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt5\Qt5Network.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt5\Qt5Sql.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt5\Qt5Svg.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt5\Qt5Widgets.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt5\bearer\*"; DestDir: "{app}\bearer"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt5\iconengines\*"; DestDir: "{app}\iconengines"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt5\imageformats\*"; DestDir: "{app}\imageformats"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt5\platforms\*"; DestDir: "{app}\platforms"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt5\sqldrivers\*"; DestDir: "{app}\sqldrivers"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt5\styles\*"; DestDir: "{app}\translations"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes64_Qt5\translations\*"; DestDir: "{app}\translations"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
; Qt 5 build (32-bit)
; Minimum supported OS:
; - Windows 7 (x86 and x86_64)
; Source: https://doc.qt.io/qt-5/supported-platforms.html#windows
Source: "{#SourcePath}\Notes32_Qt5\Notes.exe"; DestDir: "{app}"; Flags: ignoreversion; Check: not IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes32_Qt5\libcrypto-1_1.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: not IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes32_Qt5\libssl-1_1.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: not IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes32_Qt5\msvcp140.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: not IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes32_Qt5\msvcp140_1.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: not IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes32_Qt5\msvcr100.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: not IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes32_Qt5\vcruntime140.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: not IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes32_Qt5\d3dcompiler_47.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: not IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes32_Qt5\libEGL.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: not IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes32_Qt5\libGLESV2.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: not IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes32_Qt5\opengl32sw.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: not IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes32_Qt5\Qt5Core.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: not IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes32_Qt5\Qt5Gui.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: not IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes32_Qt5\Qt5Network.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: not IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes32_Qt5\Qt5Sql.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: not IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes32_Qt5\Qt5Svg.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: not IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes32_Qt5\Qt5Widgets.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: not IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes32_Qt5\bearer\*"; DestDir: "{app}\bearer"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: not IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes32_Qt5\iconengines\*"; DestDir: "{app}\iconengines"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: not IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes32_Qt5\imageformats\*"; DestDir: "{app}\imageformats"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: not IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes32_Qt5\platforms\*"; DestDir: "{app}\platforms"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: not IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes32_Qt5\sqldrivers\*"; DestDir: "{app}\sqldrivers"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: not IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes32_Qt5\styles\*"; DestDir: "{app}\translations"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: not IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763
Source: "{#SourcePath}\Notes32_Qt5\translations\*"; DestDir: "{app}\translations"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: not IsWin64; MinVersion: 6.1; OnlyBelowVersion: 10.0.17763

[Icons]
Name: "{group}\Notes"; Filename: "{app}\Notes.exe"
Name: "{group}\{cm:UninstallProgram,Notes}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\Notes"; Filename: "{app}\Notes.exe"; Tasks: desktopicon 

[Run]
Filename: "{app}\Notes.exe"; Description: "{cm:LaunchProgram,Notes}"; Flags: nowait postinstall skipifsilent
