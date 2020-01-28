unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, fcLabel,
  StdCtrls, wwcheckbox, ImgList, fcText, Registry, FileCtrl, Buttons, ExtCtrls,
  Mask, wwdbedit, Dialogs, WinSvc, IBServices, IniFiles;

type
 TObjProcedure = procedure of object;

type
  TfrmMain = class(TForm)
    Image1: TImage;
    Panel: TPanel;
    Panel0: TPanel;
    sbPrior: TSpeedButton;
    sbClose: TSpeedButton;
    sbNext: TSpeedButton;
    Panel1: TPanel;
    fcLabel1: TfcLabel;
    Panel2: TPanel;
    cbAdmin: TwwCheckBox;
    cbAnalytic: TwwCheckBox;
    cbClient: TwwCheckBox;
    Panel3: TPanel;
    fcLabel2: TfcLabel;
    fcLabel3: TfcLabel;
    ImageList1: TImageList;
    cbInstall: TwwCheckBox;
    cbReInstall: TwwCheckBox;
    cbDelete: TwwCheckBox;
    ImageList2: TImageList;
    Panel6: TPanel;
    lblProgress: TfcLabel;
    lblMessage: TfcLabel;
    Panel4: TPanel;
    lblAdmin: TfcLabel;
    fcLabel6: TfcLabel;
    lblAnalytic: TfcLabel;
    lblAdminPath: TfcLabel;
    lblAnalyticPath: TfcLabel;
    lblClient: TfcLabel;
    cbService: TwwCheckBox;
    cbShell: TwwCheckBox;
    lblIP: TfcLabel;
    lblPath: TfcLabel;
    edIP: TwwDBEdit;
    edPath: TwwDBEdit;
    Panel5: TPanel;
    fcLabel7: TfcLabel;
    lblIPAnalytic: TfcLabel;
    lblPathToBaseAnalytic: TfcLabel;
    cbLocal: TwwCheckBox;
    cbRemout: TwwCheckBox;
    edIPAnalytic: TwwDBEdit;
    edPathToBaseAnalytic: TwwDBEdit;
    ibss: TIBSecurityService;
    procedure FormCreate(Sender: TObject);
    procedure sbCloseClick(Sender: TObject);
    procedure sbNextClick(Sender: TObject);
    procedure sbPriorClick(Sender: TObject);
    procedure cbInstallClick(Sender: TObject);
    procedure cbAdminClick(Sender: TObject);
    procedure lblAdminPathMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lblAdminPathMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lblAdminPathClick(Sender: TObject);
    procedure cbServiceClick(Sender: TObject);
    procedure cbLocalClick(Sender: TObject);
  private
    { Private declarations }
    procedure PanelShow(Tag : Integer);
    function CheckInstalled : Boolean;
    procedure Install(DeleteOld : Boolean);
    procedure Delete;
    function WorkingKeyDriver(Install : Boolean) : LongWord;
    function GetProgramFilesDir : String;
    function GetSystemDir : String;
    function GetWindowsDir : String;
    procedure InstallIB(ReInstall : Boolean);
    function ServiceStart(aMachine, aServiceName : string ) : Boolean;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses PswdChange;

{$R *.DFM}
{$L C:\GUARDANT\API\STEALTH\LIB\NVSK32WD.OBJ}

procedure nskSetMode(dwFlags:longint; bProg:byte; dwID:longint;
                      wSN:word; bVer:byte;
                      wMask, wType:word ); stdcall; external;
function nskCRC( pData:pointer;
                 dwLng,dwPrevCRC:longint ):longint; stdcall; external;
function nskCodeInit( dwPrivateRD:longint; wCnvType:word;
                      bAddr:byte; pKey:pointer ):integer; stdcall; external;
function nskEnCode( wCnvType:word; pKeyBuf,pData:pointer;
                    dwLng:longint ):integer; stdcall; external;
function nskDeCode( wCnvType:word; pKeyBuf,pData:pointer;
                    dwLng:longint ):integer; stdcall; external;
function nskRead( dwPrivateRD:longint; bAddr,bLng:byte;
                  pData:pointer ):integer; stdcall; external;

const MsgStr : array[1..4] of String = ('Невозможно начать установку драйверов.','Ошибка в процессе установки.','Недостаточно прав у пользователя.','Драйвер занят другим приложением.');

var AdminPswd : String = '';
    CodePass  : array[0..32-1] of Byte;
    PrivRD    : Longint = 1262958463;

procedure TfrmMain.PanelShow(Tag : Integer);
 var k : Integer;
begin
 For k := 0 to Pred(ComponentCount) do
  If (Components[k] is TPanel) and (Components[k].Tag>0) then
   If (Components[k].Tag=Tag) then
    Begin
     (Components[k] as TPanel).Align := alClient;
     (Components[k] as TPanel).Show
    End
   else
    Begin
     (Components[k] as TPanel).Hide;
     (Components[k] as TPanel).Align := alNone
    End
end;

function TfrmMain.CheckInstalled : Boolean;
 var  Reg: TRegistry;
begin
 Result := False;
 Reg := TRegistry.Create;
 Reg.RootKey := HKEY_LOCAL_MACHINE;
 If (Reg.KeyExists('\Software\WizardSoft\Wizard iGame')) then
  Begin
   Reg.OpenKeyReadOnly('\Software\WizardSoft\Wizard iGame');
   Result := (Reg.ValueExists('Path'))
  End;
 Reg.Free
end;

procedure TfrmMain.Install(DeleteOld : Boolean);
 var Result, k : Integer;
     Reg : TRegistry;
     NotGood  : Integer;
     Pswd, UName, UPass : String;
     AddOrModify : TObjProcedure;
     zAppName : array[0..512] of char;
     zCurDir : array[0..255] of char;
     StartupInfo : TStartupInfo;
     ProcessInfo : TProcessInformation;
     SysIni : TIniFile;
begin
 lblProgress.Caption := 'Запись настроек в реестр.';
 Application.ProcessMessages;
 Reg := TRegistry.Create;
 Reg.RootKey := HKEY_LOCAL_MACHINE;
 Reg.OpenKey('\Software\WizardSoft\Wizard iGame',True);
 If (cbAdmin.Checked) then
  Begin
   Reg.WriteString('Path','localhost:'+lblAdminPath.Caption+'\Data\GBASE.GDB');
   Reg.WriteString('PathAdmin','localhost:'+lblAdminPath.Caption+'\Data\GBASE.GDB');
   Reg.WriteString('PathAnalytic','localhost:'+lblAdminPath.Caption+'\Data\GBASE.GDB');
   Reg.WriteString('PathClient','localhost:'+lblAdminPath.Caption+'\Data\GBASE.GDB')
  End
 else
  If (cbAnalytic.Checked) then
   If (edIPAnalytic.Enabled) then
    Begin
     Reg.WriteString('Path',edIPAnalytic.Text+':'+edPathToBaseAnalytic.Text+'\Data\GBASE.GDB');
     Reg.WriteString('PathAnalytic',edIPAnalytic.Text+':'+edPathToBaseAnalytic.Text+'\Data\GBASE.GDB');
    End
   else
    If ((GetSystemMetrics(SM_NETWORK) and 1)<>0) then
     Begin
      Reg.WriteString('Path','localhost:'+lblAnalyticPath.Caption+'\Data\GBASE.GDB');
      Reg.WriteString('PathAnalytic','localhost:'+lblAnalyticPath.Caption+'\Data\GBASE.GDB');
     End
    else
     Begin
      Reg.WriteString('Path',lblAnalyticPath.Caption+'\Data\GBASE.GDB');
      Reg.WriteString('PathAnalytic',lblAnalyticPath.Caption+'\Data\GBASE.GDB');
     End;
 If (cbClient.Checked) and NOT(cbAdmin.Checked) then
  Begin
   Reg.WriteString('Path',edIP.Text+':'+edPath.Text+'\Data\GBASE.GDB');
   Reg.WriteString('PathClient',edIP.Text+':'+edPath.Text+'\Data\GBASE.GDB')
  End;
 Reg.Free;
 If (cbAdmin.Checked) or (cbAnalytic.Checked) then
  Begin
   lblProgress.Caption := 'Установка сервера баз данных.';
   Application.ProcessMessages;
   InstallIB(DeleteOld);
  End;
 If (cbAdmin.Checked) or (cbAnalytic.Checked) then
  Begin
   lblProgress.Caption := 'Установка драйвера ключа.';
   Application.ProcessMessages;
   Result := WorkingKeyDriver(True);
   If (Result<>0) then
    Begin
     MessageDlg('Ошибка установки драйвера ключа!'#13#10+MsgStr[Result-1],mtError,[mbOK],0);
     Halt
    End
  End;
 If (cbAdmin.Checked) then
  Begin
   lblProgress.Caption := 'Установка программы администратора. Копирование файлов.';
   Application.ProcessMessages;
   ForceDirectories(lblAdminPath.Caption+'\Data');
   CopyFile(PChar(ExtractFilePath(Application.ExeName)+'GameAdmin.exe'),PChar(lblAdminPath.Caption+'\GameAdmin.exe'),False);
   CopyFile(PChar(ExtractFilePath(Application.ExeName)+'gds32.dll'),PChar(GetSystemDir+'\gds32.dll'),False);
   CopyFile(PChar(ExtractFilePath(Application.ExeName)+'NOVEX32.DLL'),PChar(lblAdminPath.Caption+'\NOVEX32.DLL'),False);
   CopyFile(PChar(ExtractFilePath(Application.ExeName)+'GBASE.GDB'),PChar(lblAdminPath.Caption+'\Data\GBASE.GDB'),Not DeleteOld);
   lblProgress.Caption := 'Установка программы администратора. Создание пользователя.';
   Application.ProcessMessages;
   If (AdminPswd='') then
    InputQuery('Введите пароль','Пароль администратора:',AdminPswd);
   If (AdminPswd<>'') then
    Begin
     ibss.Params.Clear;
     ibss.Params.Add('user_name=SYSDBA');
     ibss.Params.Add('password='+AdminPswd);
     try
      ibss.Active := True
     except
      MessageDlg('Невозможно установить связь с сервером. Сервер не запущен либо неверный пароль.',mtError,[mbOK],0);
      Exit
     end;
     CodePass[0] := 171; CodePass[1] := 163; CodePass[2] := 74; CodePass[3] := 211;
     CodePass[4] := 168; CodePass[5] := 146; CodePass[6] := 89; CodePass[7] := 45;
     CodePass[8] := 234; CodePass[9] := 254; CodePass[10] := 117; CodePass[11] := 219;
     CodePass[12] := 66; CodePass[13] := 138; CodePass[14] := 47; CodePass[15] := 158;
     CodePass[16] := 81; CodePass[17] := 42; CodePass[18] := 10; CodePass[19] := 54;
     CodePass[20] := 181; CodePass[21] := 105; CodePass[22] := 22; CodePass[23] := 243;
     CodePass[24] := 46; CodePass[25] := 218; CodePass[26] := 80; CodePass[27] := 127;
     CodePass[28] := 183; CodePass[29] := 161; CodePass[30] := 31; CodePass[31] := 14;
     nskDeCode(0,@CodePass,@PrivRD,4);
     nskSetMode(25,1,0,0,1,1,0);
     NotGood := nskCRC(@PrivRD,4,-1)-1417686703;
     Pswd := '@J:B%8^4#rg$;aQn4u5)_)({}[wgor!&';
     NotGood := nskCodeInit(PrivRD,0,1,@Pswd[1]);
     UName := '1234';
     NotGood := nskRead(PrivRD,110,4,@UName[1]);
     NotGood := nskDeCode(0,@Pswd[1],@UName[1],4);
     UPass := '0123456789';
     NotGood := nskRead(PrivRD,114,10,@UPass[1]);
     NotGood := nskDeCode(0,@Pswd[1],@UPass[1],10);
     ibss.DisplayUser(UName);
     If (ibss.UserInfoCount<1) then
      AddOrModify := ibss.AddUser
     else
      AddOrModify := ibss.ModifyUser;
     try
      k := Trunc(256/NotGood);
      ibss.Active := False
     except
      ibss.UserName := UName;
      ibss.Password := UPass;
      AddOrModify;
      ibss.Active := False
     end;
     UName := '1234';
     NotGood := nskRead(PrivRD,138,4,@UName[1]);
     NotGood := nskDeCode(0,@Pswd[1],@UName[1],4);
     UPass := '0123456789';
     NotGood := nskRead(PrivRD,142,10,@UPass[1]);
     NotGood := nskDeCode(0,@Pswd[1],@UPass[1],10);
     ibss.Active := True;
     ibss.DisplayUser(UName);
     If (ibss.UserInfoCount<1) then
      AddOrModify := ibss.AddUser
     else
      AddOrModify := ibss.ModifyUser;
     try
      k := Trunc(256/NotGood);
      ibss.Active := False
     except
      ibss.UserName := UName;
      ibss.Password := UPass;
      AddOrModify;
      ibss.Active := False
     end;
     UName := '123456';
     NotGood := nskRead(PrivRD,152,6,@UName[1]);
     NotGood := nskDeCode(0,@Pswd[1],@UName[1],6);
     UPass := '012345678901';
     NotGood := nskRead(PrivRD,158,12,@UPass[1]);
     NotGood := nskDeCode(0,@Pswd[1],@UPass[1],12);
     ibss.Active := True;
     ibss.DisplayUser(UName);
     If (ibss.UserInfoCount<1) then
      AddOrModify := ibss.AddUser
     else
      AddOrModify := ibss.ModifyUser;
     try
      k := Trunc(256/NotGood);
      ibss.Active := False
     except
      ibss.UserName := UName;
      ibss.Password := UPass;
      AddOrModify
     end;
     NotGood := nskEnCode(0,@CodePass,@PrivRD,4);
     Pswd := '@J:B%8^4#rg$;aQn4u5)_)({}[wgor!&';
     ibss.Active := False
    End
  End;
 If (cbAnalytic.Checked) then
  Begin
   lblProgress.Caption := 'Установка программы анализа. Копирование файлов.';
   Application.ProcessMessages;
   CopyFile(PChar(ExtractFilePath(Application.ExeName)+'GameAnalytic.exe'),PChar(lblAnalyticPath.Caption+'\GameAnalytic.exe'),False);
   CopyFile(PChar(ExtractFilePath(Application.ExeName)+'gds32.dll'),PChar(GetSystemDir+'\gds32.dll'),False);
   CopyFile(PChar(ExtractFilePath(Application.ExeName)+'NOVEX32.DLL'),PChar(lblAnalyticPath.Caption+'\NOVEX32.DLL'),False);
   CopyFile(PChar(ExtractFilePath(Application.ExeName)+'Default.frf'),PChar(lblAnalyticPath.Caption+'\Default.frf'),False);
   lblProgress.Caption := 'Установка программы анализа. Создание пользователя.';
   Application.ProcessMessages;
   If (AdminPswd='') then
    InputQuery('Введите пароль','Пароль администратора:',AdminPswd);
   If (AdminPswd<>'') then
    Begin
     ibss.Params.Clear;
     ibss.Params.Add('user_name=SYSDBA');
     ibss.Params.Add('password='+AdminPswd);
     try
      ibss.Active := True
     except
      MessageDlg('Невозможно установить связь с сервером. Сервер не запущен либо неверный пароль.',mtError,[mbOK],0);
      Exit
     end;
     CodePass[0] := 171; CodePass[1] := 163; CodePass[2] := 74; CodePass[3] := 211;
     CodePass[4] := 168; CodePass[5] := 146; CodePass[6] := 89; CodePass[7] := 45;
     CodePass[8] := 234; CodePass[9] := 254; CodePass[10] := 117; CodePass[11] := 219;
     CodePass[12] := 66; CodePass[13] := 138; CodePass[14] := 47; CodePass[15] := 158;
     CodePass[16] := 81; CodePass[17] := 42; CodePass[18] := 10; CodePass[19] := 54;
     CodePass[20] := 181; CodePass[21] := 105; CodePass[22] := 22; CodePass[23] := 243;
     CodePass[24] := 46; CodePass[25] := 218; CodePass[26] := 80; CodePass[27] := 127;
     CodePass[28] := 183; CodePass[29] := 161; CodePass[30] := 31; CodePass[31] := 14;
     nskDeCode(0,@CodePass,@PrivRD,4);
     nskSetMode(25,1,0,0,1,2,0);
     NotGood := nskCRC(@PrivRD,4,-1)-1417686703;
     Pswd := '@J:B%8^4#rg$;aQn4u5)_)({}[wgor!&';
     NotGood := nskCodeInit(PrivRD,0,1,@Pswd[1]);
     UName := '1234';
     NotGood := nskRead(PrivRD,110,4,@UName[1]);
     NotGood := nskDeCode(0,@Pswd[1],@UName[1],4);
     UPass := '0123456789';
     NotGood := nskRead(PrivRD,114,10,@UPass[1]);
     NotGood := nskDeCode(0,@Pswd[1],@UPass[1],10);
     ibss.DisplayUser(UName);
     If (ibss.UserInfoCount<1) then
      AddOrModify := ibss.AddUser
     else
      AddOrModify := ibss.ModifyUser;
     try
      k := Trunc(256/NotGood);
      ibss.Active := False
     except
      ibss.UserName := UName;
      ibss.Password := UPass;
      AddOrModify;
      ibss.Active := False
     end;
     UName := '1234';
     NotGood := nskRead(PrivRD,124,4,@UName[1]);
     NotGood := nskDeCode(0,@Pswd[1],@UName[1],4);
     UPass := '0123456789';
     NotGood := nskRead(PrivRD,128,10,@UPass[1]);
     NotGood := nskDeCode(0,@Pswd[1],@UPass[1],10);
     ibss.Active := True;
     ibss.DisplayUser(UName);
     If (ibss.UserInfoCount<1) then
      AddOrModify := ibss.AddUser
     else
      AddOrModify := ibss.ModifyUser;
     try
      k := Trunc(256/NotGood);
      ibss.Active := False
     except
      ibss.UserName := UName;
      ibss.Password := UPass;
      AddOrModify;
      ibss.Active := False
     end;
     NotGood := nskEnCode(0,@CodePass,@PrivRD,4);
     Pswd := '@J:B%8^4#rg$;aQn4u5)_)({}[wgor!&'
    End
  End;
 If (cbClient.Checked) then
  Begin
   lblProgress.Caption := 'Установка программы клиента. Копирование файлов.';
   Application.ProcessMessages;
   ForceDirectories(GetSystemDir+'\Wav');
   ForceDirectories(GetSystemDir+'\Skin');
   CopyFile(PChar(ExtractFilePath(Application.ExeName)+'GameService.exe'),PChar(GetSystemDir+'\GameService.exe'),False);
   CopyFile(PChar(ExtractFilePath(Application.ExeName)+'gds32.dll'),PChar(GetSystemDir+'\gds32.dll'),False);
   CopyFile(PChar(ExtractFilePath(Application.ExeName)+'Block.dll'),PChar(GetSystemDir+'\Block.dll'),False);
   CopyFile(PChar(ExtractFilePath(Application.ExeName)+'\Wav\ButtonIN.wav'),PChar(GetSystemDir+'\Wav\ButtonIN.wav'),False);
   CopyFile(PChar(ExtractFilePath(Application.ExeName)+'\Wav\PathBAD.wav'),PChar(GetSystemDir+'\Wav\PathBAD.wav'),False);
   CopyFile(PChar(ExtractFilePath(Application.ExeName)+'\Wav\PathOK.wav'),PChar(GetSystemDir+'\Wav\PathOK.wav'),False);
   CopyFile(PChar(ExtractFilePath(Application.ExeName)+'\Wav\warning.wav'),PChar(GetSystemDir+'\Wav\warning.wav'),False);
   CopyFile(PChar(ExtractFilePath(Application.ExeName)+'\Skin\Long.bmp'),PChar(GetSystemDir+'\Skin\Long.bmp'),False);
   CopyFile(PChar(ExtractFilePath(Application.ExeName)+'\Skin\SteelBtn.bmp'),PChar(GetSystemDir+'\Skin\SteelBtn.bmp'),False);
   If (cbService.Checked) then
    If (Win32Platform=VER_PLATFORM_WIN32_NT) then
     Begin
      StrPCopy(zAppName,GetSystemDir+'\GameService.exe -install');
      StrPCopy(zCurDir,GetSystemDir);
      FillChar(StartupInfo,Sizeof(StartupInfo),#0);
      StartupInfo.cb := Sizeof(StartupInfo);
      StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
      StartupInfo.wShowWindow := 0;
      CreateProcess(nil,
                    zAppName,                      { указатель командной строки }
                    nil,                           { указатель на процесс атрибутов безопасности }
                    nil,                           { указатель на поток атрибутов безопасности }
                    False,                         { флаг родительского обработчика }
                    CREATE_NEW_CONSOLE or          { флаг создания }
                    NORMAL_PRIORITY_CLASS,
                    nil,                           { указатель на новую среду процесса }
                    zCurDir,                       { указатель на имя текущей директории }
                    StartupInfo,                   { указатель на STARTUPINFO }
                    ProcessInfo)                   { указатель на PROCESS_INF }
     End
    else
     Begin
      Reg := TRegistry.Create;
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      Reg.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices',True);
      Reg.WriteString('GameService',GetSystemDir+'\GameService.exe');
      Reg.Free
     End;
   If (cbShell.Checked) then
    Begin
     SysIni := TIniFile.Create(GetWindowsDir+'\System.ini');
     SysIni.WriteString('boot', 'shell', ';'+SysIni.ReadString('boot', 'shell', 'Explorer.exe'));
     SysIni.WriteString('boot', 'shell', GetSystemDir+'\GameService.exe');
     SysIni.UpdateFile;
     SysIni.Free
    End
  End;
 lblMessage.Caption := '';
 lblProgress.Caption := 'Установка завершена.';
 sbClose.Caption := 'Закрыть';
 sbClose.Enabled := True;
 If (Win32Platform<>VER_PLATFORM_WIN32_NT) then
  If ((cbAdmin.Checked) or (cbAnalytic.Checked)) then
   If (MessageDlg('Установка успешно завершена.'#13#10'Необходимо перегрузить компьютер.'#13#10'Сделать это сейчас?',mtConfirmation,[mbOK,mbCancel],0)=mrCancel) then
    ExitWindowsEx(EWX_FORCE+EWX_REBOOT,0)
end;

procedure TfrmMain.Delete;
 var Reg : TRegistry;
     zAppName : array[0..512] of char;
     zCurDir : array[0..255] of char;
     StartupInfo : TStartupInfo;
     ProcessInfo : TProcessInformation;
     SysIni : TIniFile;
begin
 If (cbAdmin.Checked) or (cbAnalytic.Checked) then
  WorkingKeyDriver(False);
 Reg := TRegistry.Create;
 Reg.RootKey := HKEY_LOCAL_MACHINE;
 If (Reg.KeyExists('\Software\WizardSoft\Wizard iGame\PathClient')) then
  If (Win32Platform=VER_PLATFORM_WIN32_NT) then
   Begin
    StrPCopy(zAppName,GetSystemDir+'\GameService.exe -uninstall');
    StrPCopy(zCurDir,GetSystemDir);
    FillChar(StartupInfo,Sizeof(StartupInfo),#0);
    StartupInfo.cb := Sizeof(StartupInfo);
    StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
    StartupInfo.wShowWindow := 0;
    CreateProcess(nil,
                  zAppName,                      { указатель командной строки }
                  nil,                           { указатель на процесс атрибутов безопасности }
                  nil,                           { указатель на поток атрибутов безопасности }
                  False,                         { флаг родительского обработчика }
                  CREATE_NEW_CONSOLE or          { флаг создания }
                  NORMAL_PRIORITY_CLASS,
                  nil,                           { указатель на новую среду процесса }
                  zCurDir,                       { указатель на имя текущей директории }
                  StartupInfo,                   { указатель на STARTUPINFO }
                  ProcessInfo)                   { указатель на PROCESS_INF }
   End
  else
   Begin
    SysIni := TIniFile.Create(GetWindowsDir+'\System.ini');
    SysIni.WriteString('boot', 'shell', 'Explorer.exe');
    SysIni.UpdateFile;
    SysIni.Free
   End;
 Reg.DeleteKey('\Software\WizardSoft\Wizard iGame\Path');
 Reg.DeleteKey('\Software\WizardSoft\Wizard iGame\PathAdmin');
 Reg.DeleteKey('\Software\WizardSoft\Wizard iGame\PathAnalytic');
 Reg.DeleteKey('\Software\WizardSoft\Wizard iGame\PathClient');
 Reg.DeleteKey('\Software\WizardSoft\Wizard iGame');
 Reg.Free;
 lblMessage.Caption := '';
 lblProgress.Caption := 'Удаление завершено.';
 sbClose.Caption := 'Закрыть';
 sbClose.Enabled := True;
 If (Win32Platform<>VER_PLATFORM_WIN32_NT) and ((cbAdmin.Checked) or (cbAnalytic.Checked)) then
  If (MessageDlg('Удаление успешно завершено.'#13#10'Необходимо перегрузить компьютер.'#13#10'Сделать это сейчас?',mtConfirmation,[mbOK,mbCancel],0)=mrCancel) then
   ExitWindowsEx(EWX_FORCE+EWX_REBOOT,0)
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
 PanelShow(1)
end;

procedure TfrmMain.sbCloseClick(Sender: TObject);
begin
 Close
end;

procedure TfrmMain.sbNextClick(Sender: TObject);
begin
 If (sbNext.Tag=3) and (cbDelete.Checked) then
  Begin
   sbPrior.Tag := 6;
   sbNext.Tag := 6
  End
 else
  Begin
   sbPrior.Tag := Succ(sbPrior.Tag);
   sbNext.Tag := Succ(sbNext.Tag)
  End;
 sbPrior.Enabled := True;
 If (sbNext.Tag=3) then
  If (CheckInstalled) then
   Begin
    cbReInstall.Enabled := True;
    cbDelete.Enabled := True
   End
  else
   Begin
    cbReInstall.Enabled := False;
    cbDelete.Enabled := False
   End;
 If (sbNext.Tag=4) then
  Begin
   lblAdmin.Enabled := cbAdmin.Checked;
   lblAdminPath.Enabled := cbAdmin.Checked;
   lblAnalytic.Enabled := cbAnalytic.Checked;
   lblAnalyticPath.Enabled := cbAnalytic.Checked;
   lblClient.Enabled := cbClient.Checked;
   cbService.Enabled := cbClient.Checked;
   cbShell.Enabled := cbClient.Checked;
   lblIP.Enabled := cbClient.Checked and Not cbAdmin.Checked and Not cbAnalytic.Checked;
   edIP.Enabled := lblIP.Enabled;
   lblPath.Enabled := lblIP.Enabled;
   edPath.Enabled := lblIP.Enabled;
   If (edPath.Enabled) then
    edPath.Text := 'C:\Program Files\WizardSoft\Wizard iGame';
   cbShell.Enabled := cbShell.Enabled and (Win32Platform<>VER_PLATFORM_WIN32_NT)
  End;
 If (sbNext.Tag=5) then
  Begin
   cbRemout.Caption := 'Использовать базу данных'#13#10'Wizard iGame Admin';
   edPathToBaseAnalytic.Text := 'C:\Program Files\WizardSoft\Wizard iGame'
  End;
 PanelShow(sbNext.Tag);
 If (Panel6.Visible) then
  Begin
   sbPrior.Enabled := False;
   sbNext.Enabled := False;
   sbClose.Enabled := False;
   Application.ProcessMessages;
   If (cbInstall.Checked) then
    Install(True);
   If (cbReInstall.Checked) then
    Install(False);
   If (cbDelete.Checked) then
    Delete
  End;
 If (Panel5.Visible) then
  If (cbAdmin.Checked) or Not(cbAnalytic.Checked) then
   sbNext.Click
end;

procedure TfrmMain.sbPriorClick(Sender: TObject);
begin
 sbPrior.Tag := Pred(sbPrior.Tag);
 sbNext.Tag := Pred(sbNext.Tag);
 sbPrior.Enabled := (sbPrior.Tag>0);
 PanelShow(sbNext.Tag)
end;

procedure TfrmMain.cbInstallClick(Sender: TObject);
begin
 If ((Sender as TwwCheckBox).Checked) then
  Begin
   If ((Sender as TwwCheckBox)<>cbInstall) and
      (cbInstall.Checked=(Sender as TwwCheckBox).Checked) then
    cbInstall.Checked := Not(Sender as TwwCheckBox).Checked;
   If ((Sender as TwwCheckBox)<>cbReInstall) and
      (cbReInstall.Checked=(Sender as TwwCheckBox).Checked) then
    cbReInstall.Checked := Not(Sender as TwwCheckBox).Checked;
   If ((Sender as TwwCheckBox)<>cbDelete) and
      (cbDelete.Checked=(Sender as TwwCheckBox).Checked) then
    cbDelete.Checked := Not(Sender as TwwCheckBox).Checked
  End
 else
  If Not ((cbInstall.Checked) or (cbReInstall.Checked) or (cbDelete.Checked)) then
   (Sender as TwwCheckBox).Checked := True
end;

procedure TfrmMain.cbAdminClick(Sender: TObject);
begin
 If NOT ((Sender as TwwCheckBox).Checked or
         (cbAdmin.Checked) or (cbAnalytic.Checked) or (cbClient.Checked)) then
   (Sender as TwwCheckBox).Checked := True
end;

procedure TfrmMain.lblAdminPathMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 (Sender as TfcLabel).TextOptions.Style := fclsLowered
end;

procedure TfrmMain.lblAdminPathMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 (Sender as TfcLabel).TextOptions.Style := fclsRaised
end;

procedure TfrmMain.lblAdminPathClick(Sender: TObject);
 var Folder : String;
begin
 If (DirectoryExists((Sender as TfcLabel).Caption)) then
  Folder := (Sender as TfcLabel).Caption
 else
  Folder := GetProgramFilesDir;
 If (SelectDirectory(Folder,[sdAllowCreate, sdPerformCreate],1000)) then
  Begin
   If (Folder[Length(Folder)]='\') then
    Folder := Copy(Folder,1,Pred(Length(Folder)));
   (Sender as TfcLabel).Caption := Folder
  End
end;

procedure TfrmMain.cbServiceClick(Sender: TObject);
begin
 If ((Sender as TwwCheckBox).Checked) then
  Begin
   If ((Sender as TwwCheckBox)<>cbService) and
      (cbService.Checked=(Sender as TwwCheckBox).Checked) then
    cbService.Checked := Not(Sender as TwwCheckBox).Checked;
   If ((Sender as TwwCheckBox)<>cbShell) and
      (cbShell.Checked=(Sender as TwwCheckBox).Checked) then
    cbShell.Checked := Not(Sender as TwwCheckBox).Checked;
  End
 else
  If Not ((cbService.Checked) or (cbShell.Checked)) then
   (Sender as TwwCheckBox).Checked := True
end;

procedure TfrmMain.cbLocalClick(Sender: TObject);
begin
 If ((Sender as TwwCheckBox).Checked) then
  Begin
   If ((Sender as TwwCheckBox)<>cbLocal) and
      (cbLocal.Checked=(Sender as TwwCheckBox).Checked) then
    cbLocal.Checked := Not(Sender as TwwCheckBox).Checked;
   If ((Sender as TwwCheckBox)<>cbRemout) and
      (cbRemout.Checked=(Sender as TwwCheckBox).Checked) then
    cbRemout.Checked := Not(Sender as TwwCheckBox).Checked;
  End
 else
  If Not ((cbRemout.Checked) or (cbLocal.Checked)) then
   (Sender as TwwCheckBox).Checked := True;
 lblIPAnalytic.Enabled := cbRemout.Checked;
 edIPAnalytic.Enabled := cbRemout.Checked;
 lblPathToBaseAnalytic.Enabled := cbRemout.Checked;
 edPathToBaseAnalytic.Enabled := cbRemout.Checked
end;

function TfrmMain.WorkingKeyDriver(Install : Boolean) : LongWord;
var zAppName : array[0..512] of char;
    zCurDir : array[0..255] of char;
    WorkDir : String;
    StartupInfo : TStartupInfo;
    ProcessInfo : TProcessInformation;
begin
 If (Install) then
  Begin
   StrPCopy(zAppName,ExtractFileDir(Application.ExeName)+'\DRIVERS\INSTDRV.EXE /Q /NORB');
   lblProgress.Caption := 'Устанавливается драйвер ключа...'
  End
 else
  Begin
   StrPCopy(zAppName,ExtractFileDir(Application.ExeName)+'\DRIVERS\INSTDRV.EXE /Q /U /NORB');
   lblProgress.Caption := 'Удаляется драйвер ключа...'
  End;
 Application.ProcessMessages;
 GetDir(0,WorkDir);
 StrPCopy(zCurDir,WorkDir);
 FillChar(StartupInfo,Sizeof(StartupInfo),#0);
 StartupInfo.cb := Sizeof(StartupInfo);
 StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
 StartupInfo.wShowWindow := 0;
 If Not(CreateProcess(nil,
                       zAppName,                      { указатель командной строки }
                       nil,                           { указатель на процесс атрибутов безопасности }
                       nil,                           { указатель на поток атрибутов безопасности }
                       False,                         { флаг родительского обработчика }
                       CREATE_NEW_CONSOLE or          { флаг создания }
                       NORMAL_PRIORITY_CLASS,
                       nil,                           { указатель на новую среду процесса }
                       zCurDir,                       { указатель на имя текущей директории }
                       StartupInfo,                   { указатель на STARTUPINFO }
                       ProcessInfo)) then             { указатель на PROCESS_INF }
  Result := 2
 else
  Begin
   WaitforSingleObject(ProcessInfo.hProcess,15000);
   GetExitCodeProcess(ProcessInfo.hProcess,Result)
  End
end;

function TfrmMain.GetProgramFilesDir : String;
 var Reg : TRegistry;
begin
 Reg := TRegistry.Create;
 Reg.RootKey := HKEY_LOCAL_MACHINE;
 Reg.OpenKeyReadOnly('\SOFTWARE\Microsoft\Windows\CurrentVersion');
 Result := Reg.ReadString('ProgramFilesDir');
 Reg.Free
end;

function TfrmMain.GetSystemDir : String;
{$IFDEF WIN32}
var
  Buffer: array[0..1023] of Char;
begin
  SetString(Result, Buffer, GetSystemDirectory(Buffer, SizeOf(Buffer)));
{$ELSE}
begin
  Result[0] := Char(GetSystemDirectory(@Result[1], 254));
{$ENDIF}
end;

function TfrmMain.GetWindowsDir : String;
{$IFDEF WIN32}
var
  Buffer: array[0..1023] of Char;
begin
  SetString(Result, Buffer, GetWindowsDirectory(Buffer, SizeOf(Buffer)));
{$ELSE}
begin
  Result[0] := Char(GetWindowsDirectory(@Result[1], 254));
{$ENDIF}
end;

procedure TfrmMain.InstallIB(ReInstall : Boolean);
 var ResultBool : LongBool;
     Reg : TRegistry;
     Handle : THandle;
     zAppName : array[0..512] of char;
     zCurDir : array[0..255] of char;
     StartupInfo : TStartupInfo;
     ProcessInfo : TProcessInformation;
     k : Cardinal;
     S : String;
begin
 lblProgress.Caption := 'Установка сервера баз данных.';
 Application.ProcessMessages;
 Handle := FindWindow(nil,'InterBase Guardian')+FindWindow(nil,'InterBase Server');
 If (Handle<>0) then
  Begin
   Handle := FindWindow(nil,'InterBase Guardian');
   If (Handle<>0) then
    PostMessage(Handle, WM_QUIT, 0, 0);
   Handle := FindWindow(nil,'InterBase Server');
   If (Handle<>0) then
    PostMessage(Handle, WM_QUIT, 0, 0);
   k := GetTickCount;
   While (GetTickCount-k<10000) do
    Application.ProcessMessages 
  End;
 lblProgress.Caption := 'Установка сервера баз данных. Создание папок.';
 Application.ProcessMessages;
 ForceDirectories(GetProgramFilesDir+'\Firebird\bin');
 ForceDirectories(GetProgramFilesDir+'\Firebird\intl');
 lblProgress.Caption := 'Установка сервера баз данных. Копирование файлов.';
 Application.ProcessMessages;
 ResultBool := CopyFile(PChar(ExtractFilePath(Application.ExeName)+'ibserver.exe'),PChar(GetProgramFilesDir+'\Firebird\bin\ibserver.exe'),False);
 ResultBool := ResultBool and CopyFile(PChar(ExtractFilePath(Application.ExeName)+'ibguard.exe'),PChar(GetProgramFilesDir+'\Firebird\bin\ibguard.exe'),False);
 ResultBool := ResultBool and CopyFile(PChar(ExtractFilePath(Application.ExeName)+'gdsintl.dll'),PChar(GetProgramFilesDir+'\Firebird\intl\gdsintl.dll'),False);
 ResultBool := ResultBool and CopyFile(PChar(ExtractFilePath(Application.ExeName)+'interbase.msg'),PChar(GetProgramFilesDir+'\Firebird\interbase.msg'),False);
 If (ReInstall) then
  CopyFile(PChar(ExtractFilePath(Application.ExeName)+'isc4.gdb'),PChar(GetProgramFilesDir+'\Firebird\isc4.gdb'),False)
 else
  CopyFile(PChar(ExtractFilePath(Application.ExeName)+'isc4.gdb'),PChar(GetProgramFilesDir+'\Firebird\isc4.gdb'),True);
 If (ResultBool=False) then
  Begin
   MessageDlg('Ошибка копирования файлов сервера!',mtError,[mbOK],0);
   Halt
  End;
 lblProgress.Caption := 'Установка сервера баз данных. Создание ключей реестра.';
 Application.ProcessMessages;
 Reg := TRegistry.Create;
 Reg.RootKey := HKEY_LOCAL_MACHINE;
 Reg.OpenKey('\Software\Borland\InterBase\CurrentVersion',True);
 Reg.WriteString('RootDirectory',GetProgramFilesDir+'\Firebird\');
 Reg.WriteString('Version','WI-V6.2.863 Firebird 1.0');
 Reg.WriteString('ServerDirectory',GetProgramFilesDir+'\Firebird\bin\');
 Reg.WriteString('GuardianOptions','1');
 If (Win32Platform=VER_PLATFORM_WIN32_NT) then
  Begin
 //as service
   lblProgress.Caption := 'Установка сервера баз данных. Установка сервисов.';
   Application.ProcessMessages;
   Reg.OpenKey('\SYSTEM\CurrentControlSet\Services\InterBaseGuardian',True);
   Reg.WriteInteger('Type',272);
   Reg.WriteInteger('Start',2);
   Reg.WriteInteger('ErrorControl',1);
   Reg.WriteString('ImagePath',GetProgramFilesDir+'\Firebird\bin\ibguard -s');
   Reg.WriteString('DisplayName','Firebird Guardian Service');
   Reg.WriteString('ObjectName','LocalSystem');
   Reg.OpenKey('\SYSTEM\CurrentControlSet\Services\InterBaseServer',True);
   Reg.WriteInteger('Type',272);
   Reg.WriteInteger('Start',3);
   Reg.WriteInteger('ErrorControl',1);
   Reg.WriteString('ImagePath',GetProgramFilesDir+'\Firebird\bin\ibserver -s');
   Reg.WriteString('DisplayName','Firebird Server Service');
   Reg.WriteString('ObjectName','LocalSystem')
  End
 else
  Begin
 //as application
   Reg.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Run',True);
   Reg.WriteString('InterBaseGuardian',GetProgramFilesDir+'\Firebird\bin\ibguard.exe -a')
  End;
 Reg.CloseKey;
 Reg.Free;
 lblProgress.Caption := 'Установка сервера баз данных. Запуск сервера.';
 Application.ProcessMessages;
// надо заставить винды перечитывать сервисы, тада моно будет раскоментировать
{ If (Win32Platform=VER_PLATFORM_WIN32_NT) then
  ServiceStart('','InterBaseGuardian') then
 else
  Begin}
   StrPCopy(zAppName,GetProgramFilesDir+'\Firebird\bin\ibguard.exe -a');
   StrPCopy(zCurDir,GetProgramFilesDir+'\Firebird\bin');
   FillChar(StartupInfo,Sizeof(StartupInfo),#0);
   StartupInfo.cb := Sizeof(StartupInfo);
   StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
   StartupInfo.wShowWindow := 1;
   CreateProcess(nil,
                 zAppName,                      { указатель командной строки }
                 nil,                           { указатель на процесс атрибутов безопасности }
                 nil,                           { указатель на поток атрибутов безопасности }
                 False,                         { флаг родительского обработчика }
                 CREATE_NEW_CONSOLE or          { флаг создания }
                 NORMAL_PRIORITY_CLASS,
                 nil,                           { указатель на новую среду процесса }
                 zCurDir,                       { указатель на имя текущей директории }
                 StartupInfo,                   { указатель на STARTUPINFO }
                 ProcessInfo)                   { указатель на PROCESS_INF }
{  End};
 If (ReInstall) then
  Begin
   lblProgress.Caption := 'Установка сервера баз данных. Смена пароля администратора.';
   Application.ProcessMessages;
   frmPswdChange := TfrmPswdChange.Create(frmMain);
   frmPswdChange.ShowModal;
   If (frmPswdChange.ModalResult=mrOK) then
    Begin
     ibss.Params.Clear;
     ibss.Params.Add('user_name=SYSDBA');
     ibss.Params.Add('password=masterkey');
     try
      ibss.Active := True;
      ibss.DisplayUser('SYSDBA');
      ibss.UserName := 'SYSDBA';
      ibss.Password := frmPswdChange.dbeNewPassword.Text;
      ibss.ModifyUser;
      ibss.Active := False;
      AdminPswd := frmPswdChange.dbeNewPassword.Text;
     except
      MessageDlg('Ошибка изменения пароля администратора!',mtError,[mbOK],0);
      Halt
     end
    End;
   frmPswdChange.Free
  End;
 lblProgress.Caption := 'Установка сервера баз данных. Установка сервера завершена.';
 Application.ProcessMessages
end;

function TfrmMain.ServiceStart(aMachine, aServiceName : string ) : Boolean;
// aMachine это UNC путь, либо локальный компьютер если пусто
var
  h_manager,h_svc : SC_Handle;
  svc_status : TServiceStatus;
  Temp : PChar;
  dwCheckPoint : DWord;
begin
  svc_status.dwCurrentState := 1;
  h_manager := OpenSCManager(PChar(aMachine), Nil, SC_MANAGER_CONNECT);
  If (h_manager>0) then
   Begin
    h_svc := OpenService(h_manager, PChar(aServiceName), SERVICE_START or SERVICE_QUERY_STATUS);
    If (h_svc>0) then
     Begin
      Temp := nil;
      If (StartService(h_svc,0,temp)) then
       If (QueryServiceStatus(h_svc,svc_status)) then
        While (SERVICE_RUNNING<>svc_status.dwCurrentState) do
         Begin
          dwCheckPoint := svc_status.dwCheckPoint;
          Sleep(svc_status.dwWaitHint);
          If Not (QueryServiceStatus(h_svc,svc_status)) then
           Break;
          If (svc_status.dwCheckPoint<dwCheckPoint) then
             // QueryServiceStatus не увеличивает dwCheckPoint
           Break
         End;
      CloseServiceHandle(h_svc);
     End;
    CloseServiceHandle(h_manager);
   End;
  Result := (SERVICE_RUNNING=svc_status.dwCurrentState)
end;

end.
