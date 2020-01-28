unit NewOrder;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, wwdblook, wwdbdatetimepicker, Mask, wwdbedit,
  Wwdotdot, Wwdbcomb, Wwdbspin, Buttons, Db, IBCustomDataSet, fcLabel, Math,
  DBCtrls, wwcheckbox;

type
  TfrmNewOrder = class(TForm)
    dsOrder: TDataSource;
    ibdsOrder: TIBDataSet;
    ibdsOrderID: TIntegerField;
    ibdsOrderCOMP_ID: TIntegerField;
    ibdsOrderTARIFF_ID: TIntegerField;
    ibdsOrderTIME_START: TDateTimeField;
    ibdsOrderTIME_STOP: TDateTimeField;
    ibdsOrderCOMMENTS: TIBStringField;
    ibdsOrderNUMBER: TStringField;
    ibdsOrderPRICE: TFloatField;
    ibdsOrderPRICE_TOTAL: TFloatField;
    ibdsOrderINTERFACE: TSmallintField;
    ibdsTariffs: TIBDataSet;
    ibdsTariffsNAME: TIBStringField;
    ibdsTariffsPRICE: TFloatField;
    ibdsTariffsID: TIntegerField;
    ibdsTariffsI_SPEED: TIntegerField;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    sbApply: TSpeedButton;
    sbCancel: TSpeedButton;
    Label10: TLabel;
    Label8: TLabel;
    dbeNumber: TwwDBEdit;
    wwDBLookupCombo2: TwwDBLookupCombo;
    wwDBDateTimePicker1: TwwDBDateTimePicker;
    wwDBEdit1: TwwDBEdit;
    tpDuration: TwwDBDateTimePicker;
    wwDBDateTimePicker2: TwwDBDateTimePicker;
    wwDBEdit3: TwwDBEdit;
    DBCheckBox1: TDBCheckBox;
    procedure sbApplyClick(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
    procedure ibdsOrderTIME_STARTChange(Sender: TField);
    procedure ibdsOrderTARIFF_IDChange(Sender: TField);
    procedure ibdsOrderCalcFields(DataSet: TDataSet);
    procedure tpDurationChange(Sender: TObject);
    procedure wwDBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure wwDBEdit3Exit(Sender: TObject);
    procedure wwDBDateTimePicker2Exit(Sender: TObject);
    procedure wwDBEdit3Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    MinTimeStop : TDateTime;
    CompsNumber : Integer ;
  end;

var
  frmNewOrder: TfrmNewOrder;

implementation

uses Main;
var OldAmount : Double;
    AmountInput : Boolean=False;

{$R *.DFM}

procedure TfrmNewOrder.sbApplyClick(Sender: TObject);
 var SendStr, SendStrCur, IP_Comps, COMMENTS, SendStartTimeStr : String;
     k, TARIFF_ID, COMP_ID, INTERFACETYPE: Integer;
     TIME_START, TIME_STOP : TDateTime;
     PRICE : Double;
begin
 If (frmNewOrder.ActiveControl=wwDBEdit3) then
  wwDBEdit3Exit(wwDBEdit3);                               
 ibdsOrder.Post;
 try
  IP_Comps := frmMain.ibdsFreeCompsIP_ADDRESS.AsString+';';
  SendStartTimeStr := 'Nord';
  frmMain.nmmsgSendMsg.Host := frmMain.ibdsFreeCompsIP_ADDRESS.Value;
  try
   frmMain.nmmsgSendMsg.PostIt(SendStartTimeStr);
  except
   try
    frmMain.nmmsgSendMsg.PostIt(SendStartTimeStr);
   except
   end;
  end;
  INTERFACETYPE:= ibdsOrderINTERFACE.AsInteger;
  If (CompsNumber>1) then
   Begin
    COMP_ID := ibdsOrderCOMP_ID.AsInteger;
    TARIFF_ID := ibdsOrderTARIFF_ID.AsInteger;
    TIME_START := ibdsOrderTIME_START.AsDateTime;
    TIME_STOP := ibdsOrderTIME_STOP.AsDateTime;
    PRICE := ibdsOrderPRICE.AsFloat;
    COMMENTS := ibdsOrderCOMMENTS.AsString;
    For k := 0 to Pred(frmMain.wwdbgFreeComps.SelectedList.Count) do
     Begin
      frmMain.ibdsFreeComps.GotoBookmark(frmMain.wwdbgFreeComps.SelectedList.Items[k]);
      If (COMP_ID<>frmMain.ibdsFreeCompsID.AsInteger) then
       Begin
        IP_Comps := IP_Comps+frmMain.ibdsFreeCompsIP_ADDRESS.AsString+';';
        ibdsOrder.Append;
        frmMain.ibsGen_ID.SQL.Clear;
        frmMain.ibsGen_ID.SQL.Add('select gen_id(GEN_ORDERS_ID,1) from rdb$database');
        frmMain.ibsGen_ID.ExecQuery;
        ibdsOrderID.Value := frmMain.ibsGen_ID.FieldByName('Gen_ID').AsInteger;
        frmMain.ibsGen_ID.Close;
        ibdsOrderCOMP_ID.Value := frmMain.ibdsFreeCompsID.AsInteger;
        ibdsOrderTARIFF_ID.AsInteger := TARIFF_ID;
        ibdsOrderTIME_STOP.AsDateTime := TIME_STOP;
        ibdsOrderTIME_START.AsDateTime := TIME_START;
        ibdsOrderPRICE.AsFloat := PRICE;
        ibdsOrderCOMMENTS.AsString := COMMENTS;
        ibdsOrderINTERFACE.Value := INTERFACETYPE;
        frmMain.nmmsgSendMsg.Host := frmMain.ibdsFreeCompsIP_ADDRESS.Value;
        try
         frmMain.nmmsgSendMsg.PostIt(SendStartTimeStr)
        except
         try
          frmMain.nmmsgSendMsg.PostIt(SendStartTimeStr)
         except
         end
        end
       End
     End;
    ibdsOrder.Post
   End;
  ibdsOrder.ApplyUpdates;
  SendStr := '';
  If (ibdsTariffsI_SPEED.Value>0) then
   SendStr := ' '+ibdsTariffsI_SPEED.AsString+' '+IntToStr(Trunc(86400*(ibdsOrderTIME_STOP.Value-ibdsOrderTIME_START.Value)));
  frmMain.trMain.Commit;
  frmMain.trMain.StartTransaction;
  If (frmMain.psMain.Host<>'') and (SendStr<>'') then
   Begin
    For k := 1 to CompsNumber do
     Begin
      SendStrCur := 'OPEN '+Copy(IP_Comps,1,Pred(Pos(';',IP_Comps)))+SendStr;
      IP_Comps := Copy(IP_Comps,Succ(Pos(';',IP_Comps)),Length(IP_Comps)-Pos(';',IP_Comps));
      try
       frmMain.psMain.Connect;
       If (frmMain.psMain.Transaction(SendStrCur)='OK'#10) then
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
        If (frmMain.psMain.Transaction(SendStrCur)='OK'#10) then
         MessageDlg('OK',mtInformation,[mbOK],0)
        else
         MessageDlg('Невозможно установить связь с сервером интернета. Проверьте настройки',mtError,[mbOK],0);
        frmMain.psMain.Disconnect;
       except
        MessageDlg('Невозможно установить связь с сервером интернета. Проверьте настройки',mtError,[mbOK],0)
       end
      end
     End
   End;
  ModalResult := mrOK
 except
  frmMain.trMain.RollbackRetaining;
  MessageDlg('Ошибка сохранения. Проверьте введенные данные.', mtError, [mbOK],0)
 end;
 ibdsOrder.Active := False;
end;

procedure TfrmNewOrder.sbCancelClick(Sender: TObject);
begin
 ModalResult := mrCancel
end;

procedure TfrmNewOrder.ibdsOrderTIME_STARTChange(Sender: TField);
begin
 If (ibdsOrderTIME_STOP.Value<MinTimeStop) then
  Begin
   MessageDlg('Неверное время окончания сеанса!',mtError,[mbOK],0);
   sbApply.Enabled := False
  End
 else
  sbApply.Enabled := True;
 If (NOT(ibdsOrderTIME_STOP.IsNull)) and (NOT(ibdsOrderTIME_START.IsNull)) then
  tpDuration.Time := (Round(86400*ibdsOrderTIME_STOP.Value)-Round(86400*ibdsOrderTIME_START.Value))/86400;
  If NOT (AmountInput) then
   ibdsOrderPRICE.Value := Trunc(ibdsTariffsPRICE.Value*Round(1440*(ibdsOrderTIME_STOP.AsFloat-ibdsOrderTIME_START.AsFloat))/60*CurrencyDecimals)/CurrencyDecimals
  else
   ibdsOrderPRICE.Value := OldAmount;
end;

procedure TfrmNewOrder.ibdsOrderTARIFF_IDChange(Sender: TField);
begin
 ibdsOrderPRICE.Value := Trunc(ibdsTariffsPRICE.Value*Round(1440*(ibdsOrderTIME_STOP.AsFloat-ibdsOrderTIME_START.AsFloat))/60*CurrencyDecimals)/CurrencyDecimals
end;

procedure TfrmNewOrder.ibdsOrderCalcFields(DataSet: TDataSet);
begin
 ibdsOrderPRICE_TOTAL.Value := ibdsOrderPRICE.AsFloat*CompsNumber
end;

procedure TfrmNewOrder.tpDurationChange(Sender: TObject);
begin
 If (ibdsOrder.State in [dsInsert,dsEdit]) and NOT(ibdsOrderTARIFF_ID.IsNull) then
   ibdsOrderTIME_STOP.Value := ibdsOrderTIME_START.Value+Trunc(ibdsOrderTIME_STOP.Value-ibdsOrderTIME_START.Value)+Frac(tpDuration.Time);
end;

procedure TfrmNewOrder.wwDBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
 If (Key=#13) then
   wwDBEdit3Exit(wwDBEdit3);
 If Not (Key in ['0'..'9',DecimalSeparator,#8,#13]) then
  Key := #0;
end;

procedure TfrmNewOrder.wwDBEdit3Exit(Sender: TObject);
var HourCount : Double;
    Y, M, D, H, N, S, mS : Word;
    FormatAmount : String;
begin
 FormatAmount := wwDBEdit3.Text;
 While (Pos(' ',FormatAmount)<>0) do
  Delete(FormatAmount, Pos(' ',FormatAmount), 1);
 AmountInput := (OldAmount<>StrToFloat(FormatAmount));
 OldAmount := StrToFloat(FormatAmount);
 If (AmountInput) and (ibdsOrder.State in [dsInsert,dsEdit]) and NOT(ibdsOrderTARIFF_ID.IsNull)  then
  Begin
   HourCount := StrToFloat(FormatAmount)/(ibdsTariffsPRICE.Value*CompsNumber);
   DecodeTime(ibdsOrderTIME_START.Value, H, N, S, mS);
   DecodeDate(ibdsOrderTIME_START.Value, Y, M, D);
   H := H+Trunc(HourCount) mod 24;
   S := S+Trunc(3600*Frac(HourCount));
   While (S>59) do
    Begin
     N := N+1;
     S := S-60;
    End;
   While (N>59) do
    Begin
     H := H+1;
     N := N-60;
    End;
   While (H>23) do
    Begin
     D := D+1;
     H := H-24;
    End;
   Y := Y+Trunc(Trunc(HourCount)/8760);
   M := M+Trunc((Trunc(HourCount) mod 8760)/744);
   D := D+Trunc((Trunc(HourCount) mod 744)/24);
   While (D>31) do
    Begin
     M := M+1;
     D := D-31;
    End;
   While (M>12) do
    Begin
     Y := Y+1;
     M := M-12;
    End;
   ibdsOrderTIME_STOP.Value := EncodeDate( Y, M, D)+EncodeTime( H, N, S, mS)
  End;
 AmountInput := False;
end;

procedure TfrmNewOrder.wwDBDateTimePicker2Exit(Sender: TObject);
begin
 tpDurationChange(tpDuration);
end;

procedure TfrmNewOrder.wwDBEdit3Enter(Sender: TObject);
begin
 OldAmount := ibdsOrderPRICE_TOTAL.Value;
end;

end.
