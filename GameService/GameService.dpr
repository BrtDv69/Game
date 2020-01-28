program GameService;

uses
  UniApp in 'UniApp.pas',
  Windows,
  SysUtils,
  Classes,
  WinSvc,
  Controls,
  Forms,
  Main in 'Main.pas' {frmMain},
  Misc in 'Misc.pas',
  ResStrs in 'ResStrs.pas';

{$R *.RES}
type
 TRegisterServiceProcess = function(dwProcessID, dwType: Integer): Integer;

var Handle : Integer;
    RegisterServiceProcess : TRegisterServiceProcess;
    
function Installing: Boolean;
begin
 Result := FindCmdLineSwitch('INSTALL',['-','\','/'], True) or
           FindCmdLineSwitch('UNINSTALL',['-','\','/'], True)
end;

function IsInstalled: Boolean;
 var Mgr, Svc: Integer;
begin
 Result := false;
 Mgr := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
 If (Mgr<>0) then
  Begin
   Svc := OpenService(Mgr, PChar(SServiceName), SERVICE_ALL_ACCESS);
   Result := (Svc<>0);
   If Result then
    CloseServiceHandle(Svc);
   CloseServiceHandle(Mgr)
  End
end;

begin
 If Not (Installing) then
  Begin
   CreateMutex(nil, True, PChar(SMutexName));
   If (GetLastError=ERROR_ALREADY_EXISTS) then
    Begin
     ErrorDlg(SAlreadyRunning);
     Halt
    End
  End;
 UniApp.Application.Initialize;
 If (Win32Platform<>VER_PLATFORM_WIN32_NT) then
  Begin
   Handle := LoadLibrary('KERNEL32.DLL');
   If (Handle<>0) then
    Begin
     @RegisterServiceProcess := GetProcAddress(Handle, 'RegisterServiceProcess');
     If (@RegisterServiceProcess<>nil) then
      RegisterServiceProcess(0, 1);
     FreeLibrary(Handle)
    End
  End;
 UniApp.Application.Title := 'Wizard iGame Client';
 WizGameService := TWizGameService.CreateNew(UniApp.Application, 0);
 If Not (Installing) then
  Begin
   UniApp.Application.CreateForm(TfrmMain, frmMain);
   frmMain.Show;
   try
    UniApp.Application.Run;
   except
    on E: ENotService do
     try
      frmMain.Initialize(false);
      UniApp.Application.ContinueRun
     except
      on E: Exception do ErrorDlg(E.Message);
     end
   end
  End
 else
  UniApp.Application.Run
end.
