unit AddRemove;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbedit, StdCtrls, Mask, Wwdbspin, Buttons, ExtCtrls, wwdbdatetimepicker,
  fcLabel, Db, IBCustomDataSet, Math;

type
  TfrmAddRemove = class(TForm)
    dsOrder: TDataSource;
    ibdsOrder: TIBDataSet;
    ibdsOrderID: TIntegerField;
    ibdsOrderPRICE: TFloatField;
    ibdsOrderTIME_START: TDateTimeField;
    ibdsOrderTIME_STOP: TDateTimeField;
    ibdsOrderORDER_PRICE: TFloatField;
    ibdsOrderI_SPEED: TIntegerField;
    ibdsOrderPriceDelta: TFloatField;
    Panel1: TPanel;
    Label5: TLabel;
    sbApply: TSpeedButton;
    sbCancel: TSpeedButton;
    Label10: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    wwDBDateTimePicker2: TwwDBDateTimePicker;
    wwdbeAmount: TwwDBEdit;
    tpDuration: TwwDBDateTimePicker;
    procedure sbCancelClick(Sender: TObject);
    procedure sbApplyClick(Sender: TObject);
    procedure tpDurationChange(Sender: TObject);
    procedure ibdsOrderTIME_STOPChange(Sender: TField);
    procedure wwdbeAmountExit(Sender: TObject);
    procedure wwdbeAmountKeyPress(Sender: TObject; var Key: Char);
    procedure wwDBDateTimePicker2Exit(Sender: TObject);
    procedure wwdbeAmountEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    MinTimeStop : TDateTime;
    TimeStop : TDateTime;
  end;

var
  frmAddRemove: TfrmAddRemove;

implementation

uses Main;
var OldAmount : Double;
    AmountInput : Boolean=False;

{$R *.DFM}

procedure TfrmAddRemove.sbCancelClick(Sender: TObject);
begin
 ModalResult := mrCancel
end;

procedure TfrmAddRemove.sbApplyClick(Sender: TObject);
 var SendStr : String;
begin
 If (frmAddRemove.ActiveControl=wwdbeAmount) then
  wwdbeAmountExit(wwdbeAmount);
 try
  ibdsOrder.DisableControls;
  ibdsOrderORDER_PRICE.Value := Trunc(ibdsOrderPRICE.Value*Round(1440*(ibdsOrderTIME_STOP.AsFloat-ibdsOrderTIME_START.AsFloat))/60*CurrencyDecimals)/CurrencyDecimals;
  ibdsOrder.ApplyUpdates;
  SendStr := '';
  If (ibdsOrderI_SPEED.Value>0) then
   If (Trunc(86400*(ibdsOrderTIME_STOP.Value-now))>0) then
    SendStr := 'CHANGE '+frmMain.ibdsWorksIP_ADDRESS.AsString+' '+IntToStr(Trunc(86400*(ibdsOrderTIME_STOP.Value-now)))
   else
    SendStr := 'CHANGE '+frmMain.ibdsWorksIP_ADDRESS.AsString+' 0';
  frmMain.trMain.CommitRetaining;
  frmMain.trMain.Commit;
  frmMain.trMain.StartTransaction;
//  frmMain.DataSetsOpen;
  If (frmMain.psMain.Host<>'') and (SendStr<>'') then
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
  ModalResult := mrOK
 except
  frmMain.trMain.RollbackRetaining;
  MessageDlg('Ошибка сохранения. Проверьте введенные данные.', mtError, [mbOK],0)
 end;
 ModalResult := mrOK
end;

procedure TfrmAddRemove.tpDurationChange(Sender: TObject);
begin
 If (ibdsOrder.State in [dsInsert,dsEdit]) then
  If (frmAddRemove.Caption='Добавление времени') then
   ibdsOrderTIME_STOP.Value := TimeStop+Trunc(ibdsOrderTIME_STOP.Value-ibdsOrderTIME_START.Value)+Frac(tpDuration.Time)
  else
   If ((Round(86400*TimeStop)-Round(86400*Frac(tpDuration.Time)))/86400<MinTimeStop) then
    ibdsOrderTIME_STOP.Value := MinTimeStop
   else
    ibdsOrderTIME_STOP.Value := (Round(86400*TimeStop)-Round(86400*Frac(tpDuration.Time)))/86400

end;

procedure TfrmAddRemove.ibdsOrderTIME_STOPChange(Sender: TField);
begin
 If (NOT(ibdsOrderTIME_STOP.IsNull)) and (NOT(ibdsOrderTIME_START.IsNull)) then
  If (frmAddRemove.Caption='Добавление времени') then
   Begin
    tpDuration.Time := (Round(86400*ibdsOrderTIME_STOP.AsFloat)-Round(86400*TimeStop))/86400;
    If NOT (AmountInput) then
     ibdsOrderPriceDelta.Value := Trunc(ibdsOrderPRICE.Value*Round(1440*(ibdsOrderTIME_STOP.AsFloat-ibdsOrderTIME_START.AsFloat))/60*CurrencyDecimals)/CurrencyDecimals-ibdsOrderORDER_PRICE.Value
    Else
     ibdsOrderPriceDelta.Value := OldAmount
   End
  else
   Begin
    tpDuration.Time := (Round(1440*TimeStop)-Round(1440*ibdsOrderTIME_STOP.AsFloat))/1440;
    ibdsOrderPriceDelta.Value := ibdsOrderORDER_PRICE.Value-Trunc(ibdsOrderPRICE.Value*Round(1440*(ibdsOrderTIME_STOP.AsFloat-ibdsOrderTIME_START.AsFloat))/60*CurrencyDecimals)/CurrencyDecimals
   End;
end;

procedure TfrmAddRemove.wwdbeAmountExit(Sender: TObject);
var HourCount : Double;
    Y, M, D, H, N, S, mS : Word;
    FormatAmount : String;
begin
 If (frmAddRemove.Caption='Добавление времени') and (ibdsOrder.State in [dsInsert,dsEdit]) then
  try
   FormatAmount := wwdbeAmount.Text;
   While (Pos(' ',FormatAmount)<>0) do
    Delete(FormatAmount, Pos(' ',FormatAmount), 1);
   AmountInput := (OldAmount<>StrToFloat(FormatAmount));
   If (AmountInput) then
    Begin
     OldAmount := StrToFloat(FormatAmount);
     HourCount := StrToFloat(wwdbeAmount.Text)/ibdsOrderPRICE.Value;
     DecodeDate(TimeStop, Y, M, D);
     DecodeTime(TimeStop, H, N, S, mS);
     H := H+Trunc(HourCount) mod 24;
  //   N := N+Trunc(60*Frac(HourCount));
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
     ibdsOrderTIME_STOP.Value := EncodeDate(Y ,M ,D )+EncodeTime(H, N, S, mS);
    End;
  except
  end;
 AmountInput := False;
end;

procedure TfrmAddRemove.wwdbeAmountKeyPress(Sender: TObject; var Key: Char);
begin
 If (Key=#13) then
  wwdbeAmountExit(wwdbeAmount);
 If Not (Key in ['0'..'9',DecimalSeparator,#8,#13]) then
  Key := #0;
end;

procedure TfrmAddRemove.wwDBDateTimePicker2Exit(Sender: TObject);
begin
 tpDurationChange(tpDuration);
end;

procedure TfrmAddRemove.wwdbeAmountEnter(Sender: TObject);
begin
 OldAmount := ibdsOrderPriceDelta.Value;
end;

end.
