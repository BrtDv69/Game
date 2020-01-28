unit Transfer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, Mask, wwdbedit, Wwdbspin, IBSQL, Math,
  wwdbdatetimepicker;

type
  TfrmTransfer = class(TForm)
    Panel1: TPanel;
    Label5: TLabel;
    sbApply: TSpeedButton;
    sbCancel: TSpeedButton;
    ibsChange: TIBSQL;
    tpDuration: TwwDBDateTimePicker;
    procedure sbCancelClick(Sender: TObject);
    procedure sbApplyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   MaxTime : TTime; 
  end;

var
  frmTransfer: TfrmTransfer;

implementation

uses Main;

{$R *.DFM}

procedure TfrmTransfer.sbCancelClick(Sender: TObject);
begin
 ModalResult := mrCancel
end;

procedure TfrmTransfer.sbApplyClick(Sender: TObject);
 var Hour, Min, Sec: Word;
     SendStr : String;
     Delta : Double;
begin
 If (tpDuration.Time>MaxTime) then
  Begin
   MessageDlg('Время переброса больше оставшегося оплаченного времени!',mtError,[mbOK],0);
   tpDuration.Time := MaxTime;
   Exit
  End;
 try
  frmMain.ibsGen_ID.SQL.Clear;
  frmMain.ibsGen_ID.SQL.Add('select gen_id(GEN_ORDERS_ID,1) from rdb$database');
  frmMain.ibsGen_ID.ExecQuery;
  ibsChange.SQL.Clear;
  ibsChange.SQL.Add('update ORDERS set TIME_STOP = :TIME_STOP, PRICE = PRICE-:PRICE where ID = :OLD_ID');
  ibsChange.GenerateParamNames := True;
  ibsChange.ParamByName('OLD_ID').AsInteger := frmMain.ibdsWorksID.AsInteger;
  Delta := Floor(frmMain.ibdsWorksPRICE.Value*(tpDuration.Time/((Round(1440*frmMain.ibdsWorksTIME_STOP.AsFloat)-Round(1440*frmMain.ibdsWorksTIME_START.AsFloat))/60))*100)/100;
  ibsChange.ParamByName('TIME_STOP').AsDateTime := (Round(1440*frmMain.ibdsWorksTIME_STOP.AsFloat)+Round(1440*Frac(tpDuration.Time)))/1440;
  ibsChange.ParamByName('PRICE').AsDouble := Delta;
  SendStr := 'CHANGE '+frmMain.ibdsWorksIP_ADDRESS.AsString+' '+IntToStr(Trunc(86400*Abs(ibsChange.ParamByName('TIME_STOP').Value-now)));
  ibsChange.ExecQuery;
  If (frmMain.psMain.Host<>'') and (frmMain.ibdsWorksI_SPEED.Value>0) then
   Begin
    try
     frmMain.psMain.Connect;
     If (frmMain.psMain.Transaction(SendStr)='OK'#10) then
      MessageDlg('OK',mtInformation,[mbOK],0)
     else
      MessageDlg('Невозможно установить связь с сервером интернета.',mtError,[mbOK],0);
     frmMain.psMain.Disconnect
    except
     frmMain.psMain.Disconnect;
     tc := GetTickCount;
     While (Abs(GetTickCount-tc)<2000) do
     Application.ProcessMessages;
     try
      frmMain.psMain.Connect;
      While NOT (Connected) do ;
      If (frmMain.psMain.Transaction(SendStr)='OK'#10) then
       MessageDlg('OK',mtInformation,[mbOK],0)
      else
       MessageDlg('Невозможно установить связь с сервером интернета. Проверьте настройки',mtError,[mbOK],0);
      frmMain.psMain.Disconnect;
     except
      MessageDlg('Невозможно установить связь с сервером интернета. Проверьте настройки',mtError,[mbOK],0)
     end
    end
   End;
  ibsChange.SQL.Clear;
  ibsChange.SQL.Add('insert into ORDERS');
  ibsChange.SQL.Add('(ID, COMP_ID, TARIFF_ID, TIME_START, TIME_STOP, PRICE)');
  ibsChange.SQL.Add('values');
  ibsChange.SQL.Add('(:ID, :COMP_ID, :TARIFF_ID, :TIME_START, :TIME_STOP, :PRICE)');
  ibsChange.GenerateParamNames := True;
  ibsChange.ParamByName('ID').AsInteger := frmMain.ibsGen_ID.FieldByName('Gen_ID').AsInteger;
  frmMain.ibsGen_ID.Close;
  ibsChange.ParamByName('COMP_ID').AsInteger := frmMain.ibdsFreeCompsID.AsInteger;
  ibsChange.ParamByName('TARIFF_ID').AsInteger := frmMain.ibdsWorksTARIFF_ID.AsInteger;
  DecodeTime(Now,Hour,Min,Sec,Sec);
  ibsChange.ParamByName('TIME_START').AsDateTime := Date+EncodeTime(Hour,Min+1,0,0);
  ibsChange.ParamByName('TIME_STOP').AsDateTime := Date+EncodeTime(Hour,Min+1,0,0)+Frac(tpDuration.Time);
  ibsChange.ParamByName('PRICE').AsDouble := Delta;
  SendStr := ' '+frmMain.ibdsFreeCompsIP_ADDRESS.AsString+' '+frmMain.ibdsWorksI_SPEED.AsString+' '+IntToStr(Trunc(86400*(ibsChange.ParamByName('TIME_STOP').Value-ibsChange.ParamByName('TIME_START').Value)));
  ibsChange.ExecQuery;
  If (frmMain.psMain.Host<>'') and (frmMain.ibdsWorksI_SPEED.Value>0) then
   Begin
    try
     frmMain.psMain.Connect;
     If (frmMain.psMain.Transaction(SendStr)='OK'#10) then
      MessageDlg('OK',mtInformation,[mbOK],0)
     else
      MessageDlg('Невозможно установить связь с сервером интернета.',mtError,[mbOK],0);
     frmMain.psMain.Disconnect
    except
     frmMain.psMain.Disconnect;
     tc := GetTickCount;
     While (Abs(GetTickCount-tc)<2000) do
     Application.ProcessMessages;
     try
      frmMain.psMain.Connect;
      While NOT (Connected) do ;
      If (frmMain.psMain.Transaction(SendStr)='OK'#10) then
       MessageDlg('OK',mtInformation,[mbOK],0)
      else
       MessageDlg('Невозможно установить связь с сервером интернета. Проверьте настройки',mtError,[mbOK],0);
      frmMain.psMain.Disconnect;
     except
      MessageDlg('Невозможно установить связь с сервером интернета. Проверьте настройки',mtError,[mbOK],0)
     end
    end
   End;
  frmMain.trMain.Commit;
  frmMain.trMain.StartTransaction;
  frmMain.DataSetsOpen;
  ModalResult := mrOK
 except
  frmMain.trMain.RollbackRetaining;
  frmMain.ibsGen_ID.Close;
  MessageDlg('Ошибка сохранения. Проверьте введенные данные.', mtError, [mbOK],0)
 end
end;

end.
