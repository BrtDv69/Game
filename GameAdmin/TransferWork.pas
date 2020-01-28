unit TransferWork;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdbdatetimepicker, Buttons, ExtCtrls, DBCtrls, fcLabel,
  wwdblook, Mask, wwdbedit, Wwdbspin, Db, IBCustomDataSet, DateUtil;

type
  TfrmTransferWork = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    sbApply: TSpeedButton;
    sbCancel: TSpeedButton;
    Panel3: TPanel;
    Label5: TLabel;
    Panel4: TPanel;
    Label6: TLabel;
    Label8: TLabel;
    DBText1: TDBText;
    Label9: TLabel;
    DBText2: TDBText;
    fcLabel1: TfcLabel;
    DBText3: TDBText;
    DBText4: TDBText;
    Label3: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    Label4: TLabel;
    tpDuration: TwwDBDateTimePicker;
    lblMany: TLabel;
    fcLabel2: TfcLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBText8: TDBText;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    DBText12: TDBText;
    wwDBLookupCombo1: TwwDBLookupCombo;
    wwDBLookupCombo2: TwwDBLookupCombo;
    ibdsDonor: TIBDataSet;
    dsDonor: TDataSource;
    ibdsDonorID: TIntegerField;
    ibdsDonorNUMBER: TIBStringField;
    ibdsDonorIP_ADDRESS: TIBStringField;
    ibdsDonorTARIFF_NAME: TIBStringField;
    ibdsDonorI_SPEED: TIntegerField;
    ibdsDonorTIME_START: TDateTimeField;
    ibdsDonorTIME_STOP: TDateTimeField;
    ibdsDonorPRICE: TFloatField;
    ibdsDonorDuration: TTimeField;
    ibdsDonorTime_Remain: TTimeField;
    ibdsDonorMany_Remain: TFloatField;
    ibdsTariffs: TIBDataSet;
    ibdsTariffsNAME: TIBStringField;
    ibdsTariffsPRICE: TFloatField;
    ibdsTariffsID: TIntegerField;
    ibdsTariffsI_SPEED: TIntegerField;
    ibdsComps: TIBDataSet;
    ibdsCompsID: TIntegerField;
    ibdsCompsNUMBER: TIBStringField;
    ibdsCompsIP_ADDRESS: TIBStringField;
    ibdsCompsCLASS: TIntegerField;
    dsAcceptor: TDataSource;
    ibdsAcceptor: TIBDataSet;
    ibdsAcceptorID: TIntegerField;
    ibdsAcceptorCOMP_ID: TIntegerField;
    ibdsAcceptorNUMBER: TIBStringField;
    ibdsAcceptorIP_ADDRESS: TIBStringField;
    ibdsAcceptorTARIFF_ID: TIntegerField;
    ibdsAcceptorTARIFF_NAME: TIBStringField;
    ibdsAcceptorI_SPEED: TIntegerField;
    ibdsAcceptorTIME_START: TDateTimeField;
    ibdsAcceptorTIME_STOP: TDateTimeField;
    ibdsAcceptorPRICE: TFloatField;
    ibdsAcceptorCOMMENTS: TIBStringField;
    ibdsAcceptorDuration: TTimeField;
    ibdsAcceptorTime_Remain: TTimeField;
    ibdsAcceptorMany_Remain: TFloatField;
    ibdsAcceptorTARIFF_PRICE: TFloatField;
    ibdsAcceptorINTERFACE: TSmallintField;
    procedure ibdsDonorCalcFields(DataSet: TDataSet);
    procedure tpDurationChange(Sender: TObject);
    procedure ibdsAcceptorCalcFields(DataSet: TDataSet);
    procedure wwDBLookupCombo1CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure wwDBLookupCombo2CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbCancelClick(Sender: TObject);
    procedure sbApplyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   DonorTimeStop : Double;
   DonorPrice : Double;
   AcceptorTimeStop : Double;
   AcceptorPrice : Double;
  end;

var
  frmTransferWork: TfrmTransferWork;

implementation

uses Main;

{$R *.DFM}

var ManyDelta : Double;
    OldtpDuration : Double = 0;

procedure TfrmTransferWork.ibdsDonorCalcFields(DataSet: TDataSet);
 var Hour, Min, Sec: Word;
begin
 ibdsDonorDuration.AsFloat := ibdsDonorTIME_STOP.AsFloat-ibdsDonorTIME_START.AsFloat;
 DecodeTime(Now,Hour,Min,Sec,Sec);
 ibdsDonorTime_Remain.AsFloat := ibdsDonorTIME_STOP.AsFloat-EncodeTime(Hour,Min,0,0);
 ibdsDonorMany_Remain.Value := Round(DonorPrice*100*ibdsDonorTime_Remain.AsFloat/(DonorTimeStop-ibdsDonorTIME_START.AsFloat))/100
end;

procedure TfrmTransferWork.tpDurationChange(Sender: TObject);
 var Hour, Min, Sec: Word;
begin
 ibdsDonorCalcFields(ibdsDonor);
 If (Frac(tpDuration.Time)>OldtpDuration) and (Frac(tpDuration.Time)>ibdsDonorTime_Remain.AsFloat) then
  tpDuration.Time := OldtpDuration+ibdsDonorTime_Remain.AsFloat;
 OldtpDuration := Frac(tpDuration.Time);
 ManyDelta := Round(DonorPrice*100*Frac(tpDuration.Time)/(DonorTimeStop-ibdsDonorTIME_START.AsFloat))/100;
 ibdsDonorPRICE.Value := DonorPrice-ManyDelta;
 ibdsDonorTIME_STOP.AsFloat := DonorTimeStop-Frac(tpDuration.Time);
 lblMany.Caption := FormatFloat('стоимостью: ### ### ### ##0.00р.',ManyDelta);
 If (ibdsAcceptor.State=dsInsert) then
  Begin
   DecodeTime(Now,Hour,Min,Sec,Sec);
   ibdsAcceptorTIME_START.Value := Date+IncMinute(EncodeTime(Hour,Min,0,0),1)
  End;
 ibdsAcceptorTIME_STOP.Value := Round(1440*(AcceptorTimeStop+ManyDelta/24/ibdsAcceptorTARIFF_PRICE.Value))/1440;
 ibdsAcceptorPRICE.Value := AcceptorPrice+ManyDelta
end;

procedure TfrmTransferWork.ibdsAcceptorCalcFields(DataSet: TDataSet);
 var Hour, Min, Sec: Word;
begin
 ibdsAcceptorDuration.AsFloat := ibdsAcceptorTIME_STOP.AsFloat-ibdsAcceptorTIME_START.AsFloat;
 DecodeTime(Now,Hour,Min,Sec,Sec);
 If (EncodeTime(Hour,Min,0,0)>Frac(ibdsAcceptorTIME_START.AsFloat)) then
  ibdsAcceptorTime_Remain.AsFloat := ibdsAcceptorTIME_STOP.AsFloat-EncodeTime(Hour,Min,0,0)
 else
  ibdsAcceptorTime_Remain.AsFloat := ibdsAcceptorDuration.AsFloat;
 If (AcceptorTimeStop=ibdsAcceptorTIME_START.AsFloat) then
  ibdsAcceptorMany_Remain.Value := 0
 else
  ibdsAcceptorMany_Remain.Value := Round(AcceptorPrice*100*ibdsAcceptorTime_Remain.AsFloat/(AcceptorTimeStop-ibdsAcceptorTIME_START.AsFloat))/100;
 If (ibdsAcceptor.State=dsInsert) then
  ibdsAcceptorMany_Remain.Value := ibdsAcceptorMany_Remain.Value+ManyDelta
end;

procedure TfrmTransferWork.wwDBLookupCombo1CloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
 If (modified) then
  Begin
   ibdsAcceptorNUMBER.Value := ibdsCompsNUMBER.Value;
   ibdsAcceptorIP_ADDRESS.Value := ibdsCompsIP_ADDRESS.Value
  End
end;

procedure TfrmTransferWork.wwDBLookupCombo2CloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
 var Hour, Min, Sec: Word;
begin
 If (modified) then
  Begin
   ibdsAcceptorTARIFF_NAME.Value := ibdsTariffsNAME.Value;
   ibdsAcceptorI_SPEED.Value := ibdsTariffsI_SPEED.Value;
   ibdsAcceptorTARIFF_PRICE.Value := ibdsTariffsPRICE.Value;
   If (ibdsAcceptor.State=dsInsert) then
    Begin
     DecodeTime(Now,Hour,Min,Sec,Sec);
     ibdsAcceptorTIME_START.Value := Date+IncMinute(EncodeTime(Hour,Min,0,0),1)
    End;
   ibdsAcceptorTIME_STOP.Value := Round(1440*(ibdsAcceptorTIME_START.AsFloat+ManyDelta/24/ibdsAcceptorTARIFF_PRICE.Value))/1440
  End
end;

procedure TfrmTransferWork.sbCancelClick(Sender: TObject);
begin
 ModalResult := mrCancel
end;

procedure TfrmTransferWork.sbApplyClick(Sender: TObject);
 var PostMsgAcceptor, PostMsgIPAcceptor, PostMsgIPDonor, SendStrDonor, SendStrAcceptor : String;
     TransferOK : Boolean;
begin
  TransferOK := True;
  SendStrDonor := '';
  If (ibdsDonorI_SPEED.Value>0) then
   If (Trunc(86400*(ibdsDonorTIME_STOP.Value-now))>0) then
    SendStrDonor := 'CHANGE '+ibdsDonorIP_ADDRESS.AsString+' '+IntToStr(Trunc(86400*(ibdsDonorTIME_STOP.Value-now)))
   else
    SendStrDonor := 'CHANGE '+ibdsDonorIP_ADDRESS.AsString+' 0';
  SendStrAcceptor := '';
  If (ibdsAcceptorI_SPEED.Value>0) then
   If (ibdsAcceptor.State=dsInsert) then
    SendStrAcceptor := 'OPEN '+ibdsAcceptorIP_ADDRESS.AsString+' '+ibdsAcceptorI_SPEED.AsString+' '+IntToStr(Trunc(86400*(ibdsAcceptorTIME_STOP.Value-now)))
   else
    If (Trunc(86400*(ibdsAcceptorTIME_STOP.Value-now))>0) then
     SendStrAcceptor := 'CHANGE '+ibdsAcceptorIP_ADDRESS.AsString+' '+IntToStr(Trunc(86400*(ibdsAcceptorTIME_STOP.Value-now)))
    else
     SendStrAcceptor := 'CHANGE '+ibdsAcceptorIP_ADDRESS.AsString+' 0';
 try
  If wwDBLookupCombo1.ReadOnly then
   PostMsgAcceptor := 'ReCalcNow'
  else
   PostMsgAcceptor := 'Nord';
  PostMsgIPAcceptor := ibdsAcceptorIP_ADDRESS.AsString;
  PostMsgIPDonor := ibdsDonorIP_ADDRESS.AsString;
  ibdsDonor.ApplyUpdates;
  ibdsAcceptor.ApplyUpdates;
  frmMain.trMain.Commit;
  frmMain.trMain.StartTransaction;
//  frmMain.DataSetsOpen;
  If (frmMain.psMain.Host<>'') and ((SendStrDonor<>'') or (SendStrAcceptor<>'')) then
   Begin
    If (SendStrDonor<>'') then
     try
      frmMain.psMain.Connect;
      If (frmMain.psMain.Transaction(SendStrDonor)='OK'#10) then
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
       If (frmMain.psMain.Transaction(SendStrDonor)='OK'#10) then
        MessageDlg('OK',mtInformation,[mbOK],0)
       else
        MessageDlg('Невозможно установить связь с сервером интернета. Проверьте настройки',mtError,[mbOK],0);
       frmMain.psMain.Disconnect;
      except
       MessageDlg('Невозможно установить связь с сервером интернета. Проверьте настройки',mtError,[mbOK],0)
      end
     end;
    If (SendStrAcceptor<>'') then
     try
      frmMain.psMain.Connect;
      If (frmMain.psMain.Transaction(SendStrAcceptor)='OK'#10) then
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
       If (frmMain.psMain.Transaction(SendStrAcceptor)='OK'#10) then
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
  TransferOK := False;
  frmMain.trMain.RollbackRetaining;
  MessageDlg('Ошибка сохранения. Проверьте введенные данные.', mtError, [mbOK],0)
 end;
 If TransferOK then
  Begin
   try
    frmMain.nmmsgSendMsg.Host := PostMsgIPAcceptor;
    frmMain.nmmsgSendMsg.PostIt(PostMsgAcceptor)
   except
    try
     frmMain.nmmsgSendMsg.PostIt(PostMsgAcceptor)
    except
    end
   end;
   try
    frmMain.nmmsgSendMsg.Host := PostMsgIPDonor;
    frmMain.nmmsgSendMsg.PostIt('ReCalcNow')
   except
    try
     frmMain.nmmsgSendMsg.PostIt('ReCalcNow')
    except
    end
   end
 End
end;

end.
