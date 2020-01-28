unit Main;

interface

uses
  SvcMgr, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, fcLabel, StdCtrls, IBSQL, IBDatabase, Db, HyperStr, Registry,
  Menus, Psock, NMMSG, TimerLst, FileCtrl, Misc, WinSock, ComCtrls, MMSystem,
  fcText, IniFiles, fcButton, fcImgBtn;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    lblTime: TfcLabel;
    Image: TImage;
    lbWizard: TfcLabel;
    ibdMain: TIBDatabase;
    trMain: TIBTransaction;
    ibsRemain: TIBSQL;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    RxTimerList1: TRxTimerList;
    tmClock: TRxTimerEvent;
    tmRemain: TRxTimerEvent;
    tmMessager: TRxTimerEvent;
    NMMSGServ1: TNMMSGServ;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tmClockTimer(Sender: TObject);
    procedure tmRemainTimer(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fcShapeBtn1MouseEnter(Sender: TObject);
    procedure fcShapeBtn1MouseLeave(Sender: TObject);
    procedure tmMessagerTimer(Sender: TObject);
    procedure ButtonClick(Sender: TObject);
    procedure RewriteINI;
    procedure InterfaceConstructor;
    procedure DoPrepareRemainSQL;
    procedure DoibsRemainExecute;
    procedure SetFormParam;
    procedure NMMSGServ1MSG(Sender: TComponent; const sFrom, sMsg: String);
    procedure UIInitialize(var Message: TMessage); message UI_INITIALIZE;
  private
    { Private declarations }
    LibHandle : THandle;
    FFromService: boolean;
    function GetTimeRemain: TDateTime;
    procedure ShutDown(Reboot : Boolean);
  public
    { Public declarations }
    procedure Initialize(FromService: Boolean);
  end;

  TWizGameService = class(TService)
  protected
    procedure Start(Sender: TService; var Started: Boolean);
    procedure Stop(Sender: TService; var Stopped: Boolean);
  public
    function GetServiceController: TServiceController; override;
    constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); override;
  end;

var
  frmMain: TfrmMain;
  WizGameService: TWizGameService;

implementation

uses ResStrs;

{$R *.DFM}

var IsFormCreateNormally : Boolean;
    TimeRemain : TDateTime;
    CompNumber : String[10] = '1';
    TmpPanel : TPanel;
    Button : TfcImageBtn;
    InterfaceType : Integer=1;
    ProgCount : Integer=0;
    LocalCompID : Integer;
    ProgsINI : TIniFile;
    PathStrings : TStringList;
    WaitMode : Boolean=False;
    MessageStr : String[30];
    Alert : Boolean;

procedure Lock; stdcall; external 'Block.dll' name 'Lock';
procedure UnLock; stdcall; external 'Block.dll' name 'UnLock';
function CRC(Path : String):LongInt; stdcall; external 'Block.dll' name 'CRC';

{ TRSFService }
constructor TWizGameService.CreateNew(AOwner: TComponent; Dummy: Integer);
begin
 inherited CreateNew(AOwner, Dummy);
 AllowPause := False;
 Interactive := True;
 DisplayName := SServiceDisplayName;
 WaitHint := 10000;
 Name := SServiceName;
 OnStart := Start;
 OnStop := Stop
end;

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
 WizGameService.Controller(CtrlCode)
end;

function TWizGameService.GetServiceController: TServiceController;
begin
 Result := ServiceController
end;

procedure TWizGameService.Start(Sender: TService; var Started: Boolean);
begin
 IsFormCreateNormally := False;
 frmMain.FFromService := True;
 SendMessage(frmMain.Handle, UI_INITIALIZE, 1, 0);
 If (IsFormCreateNormally) then
  Started := True
 else
  Started := False
end;

procedure TWizGameService.Stop(Sender: TService; var Stopped: Boolean);
begin
 PostMessage(frmMain.Handle, SERVICE_SHUTDOWN, 0, 0);
 PostMessage(frmMain.Handle, WM_QUIT, 0, 0)
end;

procedure TfrmMain.UIInitialize(var Message: TMessage);
begin
 try
  Initialize(Message.WParam<>0);
 except
  on E: Exception do
   If FFromService then
    WizGameService.LogMessage(E.Message, EVENTLOG_ERROR_TYPE, 0, 0)
   else
    raise;
 end
end;

procedure TfrmMain.Initialize(FromService: Boolean);
var NT351: Boolean;
    Msg: String;
begin
 FFromService := FromService;
 NT351 := (Win32MajorVersion<=3) and (Win32Platform=VER_PLATFORM_WIN32_NT);
 If (NT351) then
  If Not (FromService) then
   raise Exception.Create(SServiceOnly);
 If (Length(Msg)>0) then
  Exit;
 If (FromService) then
  Msg := 'Service'
 else
  Msg := 'Application';
 IsFormCreateNormally := true
end;

function TfrmMain.GetTimeRemain: TDateTime;
begin
 DoibsRemainExecute;
 If (ibsRemain.FieldByName('TimeRemain').IsNull) then
  Result := 0
 else
  Result := ibsRemain.FieldByName('TimeRemain').Value;
 InterfaceType := ibsRemain.FieldByName('InterfaceType').AsInteger;
 LocalCompID := ibsRemain.FieldByName('LocalCompID').AsInteger;
 If (ibsRemain.FieldByName('Locked').AsInteger=1) then
  Lock;
 ibsRemain.Close;
 ibsRemain.FieldByName('TimeRemain').Clear
end;

procedure TfrmMain.FormCreate(Sender: TObject);
 var  Reg: TRegistry;
      hMenuHandle: HMENU;
      tc : Cardinal;
      WSAData : TWSAData;
      SockAddrIn : TSockAddrIn;
      Host : PHostEnt;
begin
 hMenuHandle := GetSystemMenu(Handle, FALSE);
 If (hMenuHandle <> 0) then
  Begin
   DeleteMenu(hMenuHandle, SC_CLOSE, MF_BYCOMMAND);
   DeleteMenu(hMenuHandle, SC_MINIMIZE, MF_BYCOMMAND);
   DeleteMenu(hMenuHandle, SC_MAXIMIZE, MF_BYCOMMAND)
  End;
 DoPrepareRemainSQL;
 ibdMain.DatabaseName := '';
 Reg := TRegistry.Create;
 Reg.RootKey := HKEY_LOCAL_MACHINE;
 If (Reg.KeyExists('\Software\WizardSoft\Wizard iGame')) then
  Begin
   Reg.OpenKeyReadOnly('\Software\WizardSoft\Wizard iGame');
   If (Reg.ValueExists('Path')) then
    ibdMain.DatabaseName := Reg.ReadString('Path')
  End;
 Reg.Free;
 try
  ibdMain.Open;
  trMain.StartTransaction;
  TimeRemain := GetTimeRemain;
 except
  tc := GetTickCount;
  While (Abs(GetTickCount-tc)<10000) do
   Application.ProcessMessages;
  try
   If NOT (ibdMain.Connected) then
    ibdMain.Open;
   If NOT (trMain.InTransaction) then
    trMain.StartTransaction;
   TimeRemain := GetTimeRemain;
  except
   ibdMain.ForceClose;
   ShutDown(False)
  end
 end;
 If (TimeRemain>0) then
  Begin
   Panel1.Visible := True;
   If (TimeRemain>1) then
    lblTime.Caption := '>суток'
   else
    lblTime.Caption := FormatDateTime('hh:nn',TimeRemain);
   If (InterfaceType=1) then
    Panel1.Color := clBtnFace
   else
    Panel1.Color := clSilver;
   If (TimeRemain<EncodeTime(0,5,0,0)) then
    If (TimeRemain<EncodeTime(0,1,0,0)) then
     Panel1.Color := clRed
    else
     Panel1.Color := clYellow;
  end
 else
  Begin
   ibsRemain.SQL.Clear;
   ibsRemain.SQL.Add('select ON_ORDERLESS from SET_UP');
   DoibsRemainExecute;
   If (ibsRemain.FieldByName('ON_ORDERLESS').AsInteger=0) then
    Begin
     ibdMain.ForceClose;
     ShutDown(False)
    End
   else
    Begin
     frmMain.FormStyle:=fsStayOnTop;
     ShowWindow(FindWindow('Shell_TrayWnd',Nil),SW_HIDE);
     EnableWindow(FindWindowEx(FindWindow('Shell_TrayWnd',Nil),0,'Button',Nil),False);
     frmMain.Width := Screen.Width;
     frmMain.Height := Screen.Height;
     Panel1.Left := Screen.Width-Panel1.Width-3;
     Panel1.Top := 2;
     PopupMenu.AutoPopup:=False;
     Panel1.BevelOuter:=bvNone;
     If (FileExists(ExtractFilePath(Application.ExeName)+'Icon\BkImage.BMP')) then
      Image.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Icon\BkImage.BMP');
     WaitMode:=True;
     Lock
    End;
  End;
 ibsRemain.Close;
 ibsRemain.SQL.Clear;
 ibsRemain.SQL.Add('update COMPS set IP_ADDRESS=:IP where NETWORK_NAME=:GetComp');
 If (WSAStartup($101, WSAData) = 0) then
  Begin
   Host := GetHostByName(PChar(GetComputer));
   If (Host<>nil) then
    Begin
     SockAddrIn.sin_addr.S_addr:= longint(plongint(Host^.h_addr_list^)^);
     ibsRemain.ParamByName('IP').AsString:=inet_ntoa(SockAddrIn.sin_addr);
     NMMSGServ1.Host:=inet_ntoa(SockAddrIn.sin_addr);
    End;
   WSACleanUp
  End;
 ibsRemain.ParamByName('GetComp').Value:=GetComputer;
 DoibsRemainExecute;
 ibsRemain.Close;
 DoPrepareRemainSQL;
 lbWizard.Top:=Screen.Height-lbWizard.Height-5;
 lbWizard.Left:=10;
 If NOT (WaitMode) then
  Begin
   ForceDirectories(ExtractFilePath(Application.ExeName)+'Icon');
   InterfaceConstructor
  End;
 trMain.Commit
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
 ShowWindow(Application.Handle,sw_Hide)
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 If (InterfaceType=0) then
  Begin
   ShowWindow(FindWindow('Shell_TrayWnd',Nil),SW_HIDE);
   EnableWindow(FindWindowEx(FindWindow('Shell_TrayWnd',Nil),0,'Button',Nil),False)
  End;
 If (ssAlt in Shift) and (Key = vk_F4) then
  Key := 0
end;

procedure TfrmMain.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 If ((Button=mbLeft)and(InterfaceType=1)) then
  Begin
   ReleaseCapture;
   Perform(WM_SYSCOMMAND,SC_MOVE+2,0)
  End
end;

procedure TfrmMain.tmClockTimer(Sender: TObject);
var tc : Cardinal;
//    h, TaskWindow : hWnd;
    Hour, Min, Sec, MSec: Word;
    On_Orderless : Integer;
begin
 TimeRemain := TimeRemain-EncodeTime(0,0,Trunc(tmClock.Interval/1000),0);
 If (TimeRemain>0) then
  Begin
   If (WaitMode) then
    Begin
     WaitMode := False;
     frmMain.FormStyle:=fsNormal;
     Panel1.Visible := True;
     tmRemain.Interval:=60000;
     UnLock;
     try
      trMain.StartTransaction;
     except
      tc := GetTickCount;
      While (Abs(GetTickCount-tc)<10000) do
       Application.ProcessMessages;
      try
       If NOT (trMain.InTransaction) then
        trMain.StartTransaction;
      except
       ibdMain.ForceClose;
       ShutDown(False)
      end
     end;
     InterfaceConstructor;
     trMain.Commit;
    End;
   If ((TimeRemain<EncodeTime(0,5,0,0))and(TimeRemain>EncodeTime(0,4,47,0))) then
    If (FileExists(ExtractFilePath(Application.ExeName)+'Wav\warning.wav')) then
     Begin
      sndPlaySound(PChar(ExtractFilePath(Application.ExeName)+'Wav\warning.wav'), SND_SYNC);
      sndPlaySound(PChar(ExtractFilePath(Application.ExeName)+'Wav\warning.wav'), SND_SYNC);
     End;
   If ((TimeRemain<EncodeTime(0,3,0,0))and(TimeRemain>EncodeTime(0,1,47,0))) then
    If (FileExists(ExtractFilePath(Application.ExeName)+'Wav\warning.wav')) then
     Begin
      sndPlaySound(PChar(ExtractFilePath(Application.ExeName)+'Wav\warning.wav'), SND_SYNC);
      sndPlaySound(PChar(ExtractFilePath(Application.ExeName)+'Wav\warning.wav'), SND_SYNC);
     End;
     If (TimeRemain<EncodeTime(0,0,8,0)) then
      Begin
       If NOT (Alert) then
        Begin
         Alert:=True;
         If (FileExists(ExtractFilePath(Application.ExeName)+'Wav\warning.wav')) then
          sndPlaySound(PChar(ExtractFilePath(Application.ExeName)+'Wav\warning.wav'), SND_LOOP+SND_ASYNC);
        End
      End
     else
      If (Alert) then
       PlaySound(nil, 0, 0);
     If (TimeRemain>1) then
      lblTime.Caption := '>суток'
     else
      If (TimeRemain>EncodeTime(0,1,0,0)) then
       Begin
        DecodeTime(TimeRemain,Hour,Min,Sec,MSec);
        If (Sec<30) then
         lblTime.Caption := FormatDateTime('hh:nn',TimeRemain)
        else
         lblTime.Caption := FormatDateTime('hh:nn',TimeRemain+EncodeTime(0,1,0,0));
        Alert:=False;
       End
      else
       Begin
        lblTime.Caption := FormatDateTime('nn:ss',TimeRemain);
        tmClock.Interval := 2000
       End;
   If (InterfaceType=1) then
    Panel1.Color := clBtnFace
   else
    Panel1.Color := clSilver;
   If (TimeRemain<EncodeTime(0,5,0,0)) then
    If (TimeRemain<EncodeTime(0,1,0,0)) then
     Panel1.Color := clRed
    else
     Panel1.Color := clYellow;
  end
 else
  Begin
   If NOT (WaitMode) then
    Begin
     WaitMode:=True;
  {   TaskWindow := FindWindow('Shell_TrayWnd', nil);
     h := FindWindowEx(TaskWindow , 0, 'Button', nil);
     ShowWindow(h, 0);
     Windows.SetParent(h, 0);
     ShowWindow(TaskWindow, SW_HIDE);
     EnableWindow(TaskWindow, False);}
     ShowWindow(FindWindow('Shell_TrayWnd',Nil), SW_HIDE);
     EnableWindow(FindWindowEx(FindWindow('Shell_TrayWnd',Nil),0,'Button',Nil),False);
     If (InterfaceType=1) then
      Panel1.Color := clBtnFace
     else
      Panel1.Color := clSilver;
     Panel1.Visible := False;
     PlaySound(nil, 0, 0);
     frmMain.FormStyle:=fsStayOnTop;
     SetFormParam;
     Panel1.BevelOuter:=bvNone;
     Panel1.Parent:=frmMain;
     Image.Parent:=frmMain;
     lbWizard.Parent:=frmMain;
     PopupMenu.AutoPopup:=False;
     If (InterfaceType=0) then
      Begin
       TmpPanel.Free;
       ProgsINI.Free;
       PathStrings.Free;
      End;
     If (FileExists(ExtractFilePath(Application.ExeName)+'Icon\BkImage.BMP')) then
      Image.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Icon\BkImage.BMP');
     tmRemain.Enabled:=False;
     try
      trMain.StartTransaction;
     except
      tc := GetTickCount;
      While (Abs(GetTickCount-tc)<10000) do
       Application.ProcessMessages;
      try
      If NOT (trMain.InTransaction) then
       trMain.StartTransaction;
      except
       ibdMain.ForceClose;
       ShutDown(False)
      end
    end;
   ibsRemain.Close;
   ibsRemain.SQL.Clear;
   ibsRemain.SQL.Add('select ON_ORDERLESS from SET_UP');
   DoibsRemainExecute;
   On_Orderless := ibsRemain.FieldByName('ON_ORDERLESS').AsInteger;
   ibsRemain.Close;
   DoPrepareRemainSQL;
   try
    trMain.Commit
   except
    trMain.Rollback
   end;
   Case On_Orderless of
    0: Begin
        ibdMain.ForceClose;
        ShutDown(False)
       End;
    1: Begin
        ibdMain.ForceClose;
        ShutDown(True)
       End;
    2: Lock
   End
  End
 End
end;

procedure TfrmMain.tmRemainTimer(Sender: TObject);
 var tc : Cardinal;
begin
 If NOT(trMain.InTransaction) then
  Begin
   try
    trMain.StartTransaction;
    TimeRemain := GetTimeRemain;
   except
    tc := GetTickCount;
    While (Abs(GetTickCount-tc)<10000) do
     Application.ProcessMessages;
    try
     If NOT (trMain.InTransaction) then
      trMain.StartTransaction;
     TimeRemain := GetTimeRemain;
    except
     ibdMain.ForceClose;
     ShutDown(False)
    end
   end;
   trMain.Commit
  End
end;

procedure TfrmMain.N1Click(Sender: TObject);
begin
 N1.Checked := Not N1.Checked;
 If (N1.Checked) then
  frmMain.FormStyle := fsStayOnTop
 else
  frmMain.FormStyle := fsNormal
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ibdMain.ForceClose;
 ShutDown(False);
 Action := caFree
end;

procedure TfrmMain.ButtonClick(Sender: TObject);
var StartupInfo : TStartupInfo;
    ProcessInfo : TProcessInformation;
    FileName, WorkingDir : String;
begin
 If (Pos('.exe',PathStrings.Strings[(Sender as TComponent).Tag])>0) then
  FileName := Copy(PathStrings.Strings[(Sender as TComponent).Tag],1,Pos('.exe',PathStrings.Strings[(Sender as TComponent).Tag])+3)
 else
  If (Pos('.bat',PathStrings.Strings[(Sender as TComponent).Tag])>0) then
   Begin
// В 98 почему то неработает - возможно отключены короткие имена
//    PathStrings.Strings[(Sender as TComponent).Tag] := ExtractShortPathName(Copy(PathStrings.Strings[(Sender as TComponent).Tag],1,Pos('.bat',PathStrings.Strings[(Sender as TComponent).Tag])+3))+Copy(PathStrings.Strings[(Sender as TComponent).Tag],Pos('.bat',PathStrings.Strings[(Sender as TComponent).Tag])+4,Length(PathStrings.Strings[(Sender as TComponent).Tag])-Pos('.bat',PathStrings.Strings[(Sender as TComponent).Tag])-3);
    FileName := Copy(PathStrings.Strings[(Sender as TComponent).Tag],1,Pos('.bat',PathStrings.Strings[(Sender as TComponent).Tag])+3)
   End
 else
  If (Pos('.com',PathStrings.Strings[(Sender as TComponent).Tag])>0) then
   FileName := Copy(PathStrings.Strings[(Sender as TComponent).Tag],1,Pos('.com',PathStrings.Strings[(Sender as TComponent).Tag])+3);
 WorkingDir := ExtractFilePath(FileName);
 If (FileExists(FileName)) then
  Begin
   If ((NOT Alert) and (FileExists(ExtractFilePath(Application.ExeName)+'Wav\PathOK.WAV'))) then
    sndPlaySound(PChar(ExtractFilePath(Application.ExeName)+'Wav\PathOK.WAV'), SND_ASYNC);
   FillChar(StartupInfo,Sizeof(StartupInfo),#0);
   StartupInfo.cb := Sizeof(StartupInfo);
   StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
   StartupInfo.wShowWindow := 1;
   CreateProcess(nil, PChar(PathStrings.Strings[(Sender as TComponent).Tag]), nil, nil, false, CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS,
                 nil, PChar(WorkingDir), StartupInfo, ProcessInfo)
  End
 else
  Begin
   If ((NOT Alert) and (FileExists(ExtractFilePath(Application.ExeName)+'Wav\PathBAD.WAV'))) then
    sndPlaySound(PChar(ExtractFilePath(Application.ExeName)+'Wav\PathBAD.WAV'), SND_ASYNC);
   MessageDlg('Указан неверный путь к программе. Обратитесь к администратору зала.',mtError,[mbOK],0)
  End;
end;

procedure TfrmMain.RewriteINI;
var Index : Integer;
    SearchRec : TSearchRec;
begin
 Index := FindFirst(ExtractFilePath(Application.ExeName)+'Icon\*.*', faAnyFile, SearchRec);
 While Index = 0 do
  Begin
   If (SearchRec.Name<>'BkImage.bmp') then
    DeleteFile(ExtractFilePath(Application.ExeName)+'Icon\'+SearchRec.Name);
   Index := FindNext(SearchRec);
  End;
 FindClose(SearchRec);
 DeleteFile(ExtractFilePath(Application.ExeName)+'Progs.Ini');
 ProgsINI:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'Progs.INI');
 ibsRemain.SQL.Clear;
 ibsRemain.SQL.Add('select C.HASHSUM from COMPS C where  C.ID='+IntToStr(LocalCompID));
 DoibsRemainExecute;
 ProgsINI.WriteInteger('HashSum','HashSum',ibsRemain.FieldByName('HASHSUM').AsInteger);
 ibsRemain.Close;
 ibsRemain.SQL.Clear;
 ibsRemain.SQL.Add('select P.NAME, P.PATH, P.ICON, P.HASH');
 ibsRemain.SQL.Add('from PROGRAMMS P, PROG_COMPS PC where (P.ID_PROG=PC.ID_PROG) and (PC.ID='+IntToStr(LocalCompID)+')');
 DoibsRemainExecute;
 While NOT (ibsRemain.Eof) do
  Begin
   ProgsINI.WriteString(IntToStr(ibsRemain.RecordCount),'Path',ibsRemain.FieldByName('PATH').AsString);
   ProgsINI.WriteString(IntToStr(ibsRemain.RecordCount),'Name',ibsRemain.FieldByName('NAME').AsString);
   ProgsINI.WriteInteger(IntToStr(ibsRemain.RecordCount),'Hash', ibsRemain.FieldByName('HASH').AsInteger);
   ibsRemain.FieldByName('Icon').SaveToFile(ExtractFilePath(Application.ExeName)+'Icon\'+ibsRemain.FieldByName('NAME').AsString+'.bmp');
   ibsRemain.Next;
  End;
 ibsRemain.Close;
end;

procedure TfrmMain.NMMSGServ1MSG(Sender: TComponent; const sFrom,
  sMsg: String);
begin
 If (sMsg<>'') then
  Begin
   MessageStr:=sMsg;
   tmMessager.Enabled:=True;
  End;
end;

procedure TfrmMain.InterfaceConstructor;
var DecHi, IncWi: Integer;
    NameStr, PathStr : String;
    HashInt, i : Integer;
    h, TaskWindow : hWnd;
    Button1 : TfcImageBtn;
begin
 If (LibHandle=0) then
  LibHandle:=LoadLibrary('Block.dll');
 If (InterfaceType=0) then
  Begin
{} PathStrings := TStringList.Create();
{} PathStrings.Add('');
{   TaskWindow:=FindWindow('Shell_TrayWnd', nil);
   h := FindWindowEx(TaskWindow , 0, 'Button', nil);
   ShowWindow(h, 0);
   Windows.SetParent(h, 0);
   ShowWindow(TaskWindow, SW_HIDE);
   EnableWindow(TaskWindow, False);}
   ShowWindow(FindWindow('Shell_TrayWnd',Nil), SW_HIDE);
   EnableWindow(FindWindowEx(FindWindow('Shell_TrayWnd',Nil),0,'Button',Nil),False);
   ibsRemain.SQL.Clear;
   ibsRemain.SQL.Add('select C.HASHSUM, count(C.HASHSUM) ProgCount from COMPS C, PROG_COMPS PC where (PC.ID='+IntToStr(LocalCompID)+') and (C.ID=PC.ID) group by C.HASHSUM');
   DoibsRemainExecute;
   ProgCount:=ibsRemain.FieldByName('ProgCount').Value;
   ProgsINI:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'Progs.INI');
   If (ibsRemain.FieldByName('HASHSUM').AsInteger<>ProgsINI.ReadInteger('HashSum','HashSum',0)) then
    Begin
     ibsRemain.Close;
     RewriteINI
    End
   else
    Begin
     ibsRemain.Close;
     i := 1;
     While ProgsINI.SectionExists(IntToStr(i)) do
      Begin
       If (FileExists(ExtractFilePath(Application.ExeName)+'Icon\'+ProgsINI.ReadString(IntToStr(i),'Name','')+'.bmp')) then
        Begin
         NameStr := ProgsINI.ReadString(IntToStr(i),'Name','');
         PathStr := ProgsINI.ReadString(IntToStr(i),'Path','');
         HashInt := Hash(IntToStr(Hash(NameStr+PathStr))+IntToStr(CRC(ExtractFilePath(Application.ExeName)+'Icon\'+ProgsINI.ReadString(IntToStr(i),'Name','')+'.bmp')));
         If (ProgsINI.ReadInteger(IntToStr(i),'Hash', HashInt)<>HashInt) then
          Break
        End
       else
        Break;
       Inc(i)
      End;
     If (i<>ProgCount+1) then
      RewriteINI
    End;
   ibsRemain.SQL.Clear;
   ibsRemain.SQL.Add('select S.HASH_IMAGE Hash_Image');
   ibsRemain.SQL.Add('from SET_UP S');
   ibsRemain.ExecQuery;
   If (((FileExists(ExtractFilePath(Application.ExeName)+'Icon\BkImage.bmp')) and
       (ibsRemain.FieldByName('Hash_Image').AsInteger<>CRC(ExtractFilePath(Application.ExeName)+'Icon\BkImage.bmp'))) or
       (NOT (FileExists(ExtractFilePath(Application.ExeName)+'Icon\BkImage.bmp')) and
       (ibsRemain.FieldByName('Hash_Image').AsInteger<>0))) then
    Begin
     ibsRemain.Close;
     ibsRemain.SQL.Clear;
     ibsRemain.SQL.Add('select S.IMAGE Image');
     ibsRemain.SQL.Add('from SET_UP S');
     ibsRemain.ExecQuery;
     If NOT (ibsRemain.FieldByName('Image').IsNull) then
      ibsRemain.FieldByName('Image').SaveToFile(ExtractFilePath(Application.ExeName)+'Icon\BkImage.bmp')
     Else
      If (FileExists(ExtractFilePath(Application.ExeName)+'Icon\BkImage.bmp')) then
       DeleteFile(ExtractFilePath(Application.ExeName)+'Icon\BkImage.bmp')
    End;
   ibsRemain.Close;
   SetFormParam;
   TmpPanel:=TPanel.Create(Self);
   TmpPanel.Parent:=Self;
   TmpPanel.BevelOuter:=bvNone;
   TmpPanel.SetBounds(0, 0, Screen.Width, Screen.Height);
   Panel1.Parent:=TmpPanel;
   Image.Parent:=TmpPanel;
   lbWizard.Parent:=TmpPanel;
   If (FileExists(ExtractFilePath(Application.ExeName)+'Icon\BkImage.BMP')) then
    Image.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Icon\BkImage.BMP');
   Panel1.BevelOuter:=bvNone;
   Panel1.Color:=clSilver;
   PopupMenu.AutoPopup:=False;
   DecHi:=0;
   IncWi:=0;
   For i:=1 to ProgCount do
    Begin
     If ((Screen.Width=800)and((i mod 10)=1)) or ((Screen.Width>1000)and((i mod 13)=1)) and
         (FileExists(ExtractFilePath(Application.ExeName)+'Skin\Long.bmp')) then
      Begin
       Button1:=TfcImageBtn.Create(Self);
       Button1.Parent:=TmpPanel;
       Button1.SetBounds(10+IncWi, 2, 180, 40);
       Button1.Image.LoadFromFile(ExtractFilePath(Application.ExeName)+'Skin\Long.bmp');
       Button1.SizeToDefault;
       Button1.ShadeStyle:=fbsRaised;
      End;
     Button:=TfcImageBtn.Create(Self);
     Button.Parent:=TmpPanel;
     Button.Caption := ProgsINI.ReadString(IntToStr(i),'Name','');
     PathStrings.Add('');
     PathStrings.Strings[i] := ProgsINI.ReadString(IntToStr(i),'Path','');
     Button.SetBounds(10+IncWi, i*50-DecHi, 180, 40);
     If (Screen.Width=800)and((i mod 10)=0) then
      Begin
       DecHi:=DecHi+500;
       IncWi:=IncWi+200
      End;
     If (Screen.Width>1000)and((i mod 13)=0) then
      Begin
       DecHi:=DecHi+650;
       IncWi:=IncWi+200
      End;
     If (FileExists(ExtractFilePath(Application.ExeName)+'Skin\SteelBtn.bmp')) then
      Begin
       Button.Image.LoadFromFile(ExtractFilePath(Application.ExeName)+'Skin\SteelBtn.bmp');
       Button.SizeToDefault;
       Button.Offsets.GlyphY:=5;
       Button.Offsets.TextY:=5;
       Button.ShadeStyle:=fbsRaised;
      End;
     Button.Tag:=i;
     Button.Cursor:=crHandPoint;
     Button.Margin:=4;
     Button.Font.Style := [fsBold];
     Button.Font.Size := 12;
     Button.Font.Name := 'Courier';
     Button.Font.Color := clBlack;
     Button.TextOptions.Style := fclsLowered;
     Button.TextOptions.Alignment := taLeftJustify;
     Button.TextOptions.WordWrap := True;
     If (FileExists(ExtractFilePath(Application.ExeName)+'Icon\'+ProgsINI.ReadString(IntToStr(i),'Name','')+'.bmp')) then
      Button.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'Icon\'+ProgsINI.ReadString(IntToStr(i),'Name','')+'.bmp');
     Button.OnClick:=ButtonClick;
     Button.OnMouseEnter:=fcShapeBtn1MouseEnter;
     Button.OnMouseLeave:=fcShapeBtn1MouseLeave
    End
  End;
 If (InterfaceType=1) then
  Begin
   Panel1.Color := clBtnFace;
{   h := FindWindowEx(GetDesktopWindow, 0, 'Button', nil);
   TaskWindow := FindWindow('Shell_TrayWnd', nil);
   Windows.SetParent(h, TaskWindow);
   ShowWindow(h, 1);
   ShowWindow(TaskWindow, SW_SHOWNORMAL);
   EnableWindow(TaskWindow,true);}
   ShowWindow(FindWindow('Shell_TrayWnd',Nil), SW_SHOWNORMAL);
   EnableWindow(FindWindowEx(FindWindow('Shell_TrayWnd',Nil),0,'Button',Nil),True);
   frmMain.Align:=alNone;
   PopupMenu.AutoPopup:=True;
   frmMain.Width := 39;
   frmMain.Height := 20;
   frmMain.Left := Screen.Width-frmMain.Width-3;
   frmMain.Top := 2;
   Panel1.BevelOuter:=bvLowered;
   frmMain.Panel1.Left := 0;
   frmMain.Panel1.Top := 0
  End;
 DoPrepareRemainSQL;
 If (LibHandle<>0) then
  Begin
   FreeLibrary(LibHandle);
   LibHandle:=0
  End;
end;

procedure TfrmMain.fcShapeBtn1MouseEnter(Sender: TObject);
begin
 If ((NOT Alert) and (FileExists(ExtractFilePath(Application.ExeName)+'Wav\ButtonIN.WAV'))) then
  sndPlaySound(PChar(ExtractFilePath(Application.ExeName)+'Wav\ButtonIN.WAV'), SND_ASYNC);
 (Sender as TfcImageBtn).Font.Color:=clBlue;
end;

procedure TfrmMain.fcShapeBtn1MouseLeave(Sender: TObject);
begin
 (Sender as TfcImageBtn).Font.Color:=clBlack;
end;

procedure TfrmMain.tmMessagerTimer(Sender: TObject);
begin
 tmMessager.Enabled:=False;
 If (LibHandle=0) then
  LibHandle:=LoadLibrary('Block.dll');
 If (MessageStr='Lock') then
  Lock
 else
  If (MessageStr='UnLock') then
   UnLock
  else
   If (MessageStr='ShutDown') then
    Begin
     ibdMain.ForceClose;
     ShutDown(False)
    End
   else
    If (MessageStr='Reset') then
     Begin
      ibdMain.ForceClose;
      ShutDown(True)
     End
    else
     If (MessageStr='Nord') then
      Begin
       tmRemain.Enabled := True;
       tmRemainTimer(tmRemain);
       tmClockTimer(tmClock);
      End
     else
      If (MessageStr='ReCalcNow') then
       Begin
        tmRemainTimer(tmRemain);
        tmRemain.Enabled:=True;
        tmClockTimer(tmClock);
       End;
 If (LibHandle<>0) then
  Begin
   FreeLibrary(LibHandle);
   LibHandle:=0
  End;
 tmRemain.Enabled:=True;
end;

procedure TfrmMain.DoPrepareRemainSQL;
begin
 ibsRemain.SQL.Clear;
 ibsRemain.SQL.Add('select O.TIME_STOP-current_timestamp TimeRemain,');
 ibsRemain.SQL.Add('O.COMP_ID LocalCompID, O.LOCKED Locked, O.INTERFACE InterfaceType');
 ibsRemain.SQL.Add('from ORDERS O, COMPS C');
 ibsRemain.SQL.Add('where (O.TIME_START<=current_timestamp+0.001) and (O.TIME_STOP>=current_timestamp) and');
 ibsRemain.SQL.Add('(O.COMP_ID=C.ID) and (C.VALID=1) and (C.NETWORK_NAME='''+GetComputer+''')');
end;

procedure TfrmMain.DoibsRemainExecute;
var tc : Cardinal;
begin
 try
  ibsRemain.ExecQuery;
 except
  tc := GetTickCount;
  While (Abs(GetTickCount-tc)<10000) do
   Application.ProcessMessages;
  try
   ibsRemain.ExecQuery
  except
   ibdMain.ForceClose;
   ShutDown(False)
  end
 end;
end;

procedure TfrmMain.SetFormParam;
begin
 frmMain.Width := Screen.Width;
 frmMain.Height := Screen.Height;
 frmMain.Left := 0;
 frmMain.Top := 0;
 frmMain.Panel1.Left := Screen.Width-Panel1.Width-3;
 frmMain.Panel1.Top := 2;
 lbWizard.Top:=Screen.Height-lbWizard.Height-5;
 lbWizard.Left:=10;
end;

procedure TfrmMain.ShutDown(Reboot : Boolean);
 var ph : THandle;
     tp,prevst : TTokenPrivileges;
     rl : DWORD;
begin
 If (Win32Platform=VER_PLATFORM_WIN32_NT) then
  Begin
   OpenProcessToken(GetCurrentProcess,TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY,ph);
   LookupPrivilegeValue(Nil,'SeShutdownPrivilege',tp.Privileges[0].Luid);
   tp.PrivilegeCount := 1;
   tp.Privileges[0].Attributes := 2;
   AdjustTokenPrivileges(ph,FALSE,tp,SizeOf(prevst),prevst,rl)
  End;
 If (Reboot) then
  ExitWindowsEx(EWX_FORCE+EWX_REBOOT,0)
 else
  ExitWindowsEx(EWX_FORCE+EWX_SHUTDOWN+EWX_POWEROFF,0)
end;

end.
