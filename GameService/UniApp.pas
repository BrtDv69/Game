unit UniApp;

interface

uses SysUtils, Classes, SvcMgr;
                                        
type
  ENotService = class(Exception);
  TUniApplication = class(TServiceApplication)
  private
    FEventLogger: TEventLogger;
    procedure OnExceptionHandler(Sender: TObject; E: Exception);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Run; override;
    procedure ContinueRun;
  end;

function Application: TUniApplication;

implementation

uses
  Windows, Messages, WinSvc, Forms;

type
  TServiceTableEntryArray = array of TServiceTableEntry;

  TServiceStartThread = class(TThread)
  private
    FServiceStartTable: TServiceTableEntryArray;
  protected
    procedure DoTerminate; override;
    procedure Execute; override;
  public
    constructor Create(Services: TServiceTableEntryArray);
  end;

constructor TServiceStartThread.Create(Services: TServiceTableEntryArray);
begin
  FreeOnTerminate := False;
  ReturnValue := 0;
  FServiceStartTable := Services;
  inherited Create(False);
end;

var
  FContinueHandlingMessages: boolean = true;

const
  UM_BREAKWAIT = WM_USER+5;
  
procedure TServiceStartThread.DoTerminate;
begin
 inherited DoTerminate;
 // Application run as application on NT or application run on the Win 9x
 If (ReturnValue = ERROR_FAILED_SERVICE_CONTROLLER_) or
     (ReturnValue = ERROR_CALL_NOT_IMPLEMENTED) then
  Begin
   // for break Application.ProcessMessages loop
   FContinueHandlingMessages := false;
   // Send a fake message to Application, for a breaking WaitMessage-loop
   PostMessage(Forms.Application.Handle, UM_BREAKWAIT, 0, 0);
  End
 else
  PostMessage(Forms.Application.Handle, WM_QUIT, 0, 0);
end;

procedure TServiceStartThread.Execute;
begin
 If (StartServiceCtrlDispatcher(FServiceStartTable[0])) then
  ReturnValue := 0
 else
  ReturnValue := GetLastError
end;

procedure DoneServiceApplication;
begin
 With Forms.Application do
  Begin
   If (Handle<>0) then
    ShowOwnedPopups(Handle, False);
   ShowHint := False;
   Destroying;
   DestroyComponents
  End;
 With Application do
  Begin
   Destroying;
   DestroyComponents
  End
end;

{ TUniApplication }
constructor TUniApplication.Create(AOwner: TComponent);
begin
 FEventLogger := TEventLogger.Create(ExtractFileName(ParamStr(0)));
 inherited Create(AOwner)
end;

destructor TUniApplication.Destroy;
begin
 inherited Destroy;
 FEventLogger.Free
end;

procedure TUniApplication.OnExceptionHandler(Sender: TObject;
  E: Exception);
begin
 DoHandleException(E)
end;

procedure ServiceMain(Argc: DWord; Argv: PLPSTR); stdcall;
begin
 TUniApplication(Application).DispatchServiceMain(Argc, Argv)
end;

procedure TUniApplication.Run;
  function FindSwitch(const Switch: string): Boolean;
   Begin
    Result := FindCmdLineSwitch(Switch, ['-','\','/'], True)
   End;
var ServiceStartTable : TServiceTableEntryArray;
    ServiceCount, i, J : Integer;
    StartThread : TServiceStartThread;
begin
 AddExitProc(DoneServiceApplication);
 If (FindSwitch('INSTALL')) then
  RegisterServices(True, FindSwitch('SILENT'))
 else
  If (FindSwitch('UNINSTALL')) then
   RegisterServices(False, FindSwitch('SILENT'))
  else
   Begin
    Forms.Application.OnException := OnExceptionHandler;
    ServiceCount := 0;
    For i := 0 to Pred(ComponentCount) do
     If (Components[i] is TService) then
      Inc(ServiceCount);
    SetLength(ServiceStartTable, Succ(ServiceCount));
    FillChar(ServiceStartTable[0], SizeOf(TServiceTableEntry)*Succ(ServiceCount), 0);
    J := 0;
    For i := 0 to Pred(ComponentCount) do
     If (Components[i] is TService) then
      Begin
       ServiceStartTable[J].lpServiceName := PChar(Components[i].Name);
       ServiceStartTable[J].lpServiceProc := @ServiceMain;
       Inc(J)
      End;
    StartThread := TServiceStartThread.Create(ServiceStartTable);
    try
     While Not (Forms.Application.Terminated) and (FContinueHandlingMessages) do
      Forms.Application.HandleMessage;
     // Application start as standalone application?
     If ((StartThread.ReturnValue = ERROR_FAILED_SERVICE_CONTROLLER_) or
         (StartThread.ReturnValue = ERROR_CALL_NOT_IMPLEMENTED)) and
        Not (Forms.Application.Terminated) then
      raise ENotService.Create('Not as service')
     else
      If (StartThread.ReturnValue<>0) then
       FEventLogger.LogMessage(SysErrorMessage(GetLastError));
    finally
     StartThread.Free
    end
  end
end;

// For continue run application after fail start as service
procedure TUniApplication.ContinueRun;
begin
  while not Forms.Application.Terminated do
    Forms.Application.HandleMessage;
  Forms.Application.Terminate;
end;

procedure InitApplication;
begin
  SvcMgr.Application.Free;
  SvcMgr.Application := TUniApplication.Create(nil);
end;

function Application: TUniApplication;
begin
  Result := TUniApplication(SvcMgr.Application);
end;

initialization
  InitApplication;
end.
