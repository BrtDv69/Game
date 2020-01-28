unit SetUp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, wwdbedit, Db, IBCustomDataSet,
  Wwdotdot, Wwdbcomb, wwclearbuttongroup, wwradiogroup, DBCtrls;

type
  TfrmSetUp = class(TForm)
    dsSetUp: TDataSource;
    ibdsSetUp: TIBDataSet;
    ibdsSetUpIP_ADDRESS: TIBStringField;
    ibdsSetUpPORT: TIntegerField;
    ibdsSetUpPOST_PORT: TIntegerField;
    ibdsSetUpPOST_USER_NAME: TIBStringField;
    ibdsSetUpPOST_ADDRESS: TIBStringField;
    ibdsSetUpDESTINATION_ADDRESS: TIBStringField;
    ibdsSetUpCURRENCY_DECIMALS: TIntegerField;
    ibdsSetUpIMAGE: TBlobField;
    ibdsSetUpHASH_IMAGE: TIntegerField;
    ibdsSetUpON_ORDERLESS: TSmallintField;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    sbApply: TSpeedButton;
    sbCancel: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    sbClearImage: TSpeedButton;
    wwDBEdit3: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit4: TwwDBEdit;
    wwDBEdit5: TwwDBEdit;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit6: TwwDBEdit;
    wwDBComboBox1: TwwDBComboBox;
    dbImage: TDBImage;
    wwRadioGroup1: TwwRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sbCancelClick(Sender: TObject);
    procedure sbApplyClick(Sender: TObject);
    procedure dbImageDblClick(Sender: TObject);
    procedure sbClearImageClick(Sender: TObject);
    procedure ibdsSetUpNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetUp: TfrmSetUp;

implementation

uses Main;

{$R *.DFM}

procedure TfrmSetUp.FormCreate(Sender: TObject);
begin
 ibdsSetUp.Open;
 ibdsSetUp.FetchAll;
 If (ibdsSetUp.RecordCount=0) then
  ibdsSetUp.Append;
 If (ibdsSetUpCURRENCY_DECIMALS.IsNull) then
  Begin
   ibdsSetUp.Edit;
   ibdsSetUpCURRENCY_DECIMALS.Value := 1
  End;
 wwRadioGroup1.ItemIndex := ibdsSetUpON_ORDERLESS.AsInteger
end;

procedure TfrmSetUp.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 ibdsSetUp.Close
end;

procedure TfrmSetUp.sbCancelClick(Sender: TObject);
begin
 ModalResult := mrCancel
end;

procedure TfrmSetUp.sbApplyClick(Sender: TObject);
begin
 try
  ibdsSetUp.ApplyUpdates;
  frmMain.trMain.CommitRetaining;
  frmMain.psMain.Host := ibdsSetUpIP_ADDRESS.AsString;
  frmMain.psMain.Port := ibdsSetUpPORT.AsInteger;
  frmMain.NMSMTP1.Host := ibdsSetUpIP_ADDRESS.AsString;
  frmMain.NMSMTP1.Port := ibdsSetUpPOST_PORT.AsInteger;
  frmMain.NMSMTP1.UserID := ibdsSetUpPOST_USER_NAME.AsString;
  frmMain.NMSMTP1.PostMessage.FromAddress := ibdsSetUpPOST_ADDRESS.AsString;
  frmMain.NMSMTP1.PostMessage.FromName := ibdsSetUpPOST_USER_NAME.AsString;
  frmMain.NMSMTP1.PostMessage.ToAddress.Add(ibdsSetUpDESTINATION_ADDRESS.AsString);
  ModalResult := mrOK
 except
  frmMain.trMain.RollbackRetaining;
  MessageDlg('Ошибка сохранения. Проверьте введенные данные.', mtError, [mbOK],0)
 end;
end;

procedure TfrmSetUp.dbImageDblClick(Sender: TObject);
var IconName : String;
    Icon   : TIcon;
    Bitmap : TBitmap;
    LastSymbol : Char;
begin
 If frmMain.opdIcon.Execute then
  Begin
   frmMain.opdIcon.InitialDir := frmMain.opdIcon.FileName;
   IconName := frmMain.opdIcon.FileName;
   LastSymbol := IconName[Length(IconName)];
   If UpCase(LastSymbol)='O' then
    Begin
     Icon   := TIcon.Create;
     Bitmap := TBitmap.Create;
     Icon.LoadFromFile(IconName);
     Bitmap.Width := Icon.Width;
     Bitmap.Height := Icon.Height;
     Bitmap.Canvas.Draw(0, 0, Icon );
     Delete(IconName,Length(IconName)-2,3);
     IconName := IconName+'bmp';
     Bitmap.SaveToFile(IconName);
     Icon.Free;
     Bitmap.Free;
     ibdsSetUp.Edit;
     ibdsSetUpIMAGE.LoadFromFile(IconName);
     DeleteFile(IconName);
    End
   else
    Begin
     ibdsSetUp.Edit;
     ibdsSetUpIMAGE.LoadFromFile(IconName);
    End;
   sbClearImage.Enabled := True;
   frmMain.Stream := TMemoryStream.Create;
   ibdsSetUpIMAGE.SaveToStream(frmMain.Stream);
   ibdsSetUpHASH_IMAGE.AsInteger := frmMain.CRC(frmMain.Stream);
   frmMain.Stream.Free
  End;
end;

procedure TfrmSetUp.sbClearImageClick(Sender: TObject);
begin
 ibdsSetUp.Edit;
 ibdsSetUpIMAGE.Value := '';
 ibdsSetUpHASH_IMAGE.Value := 0;
 sbClearImage.Enabled := False;
 dbImage.DataField := '';
 dbImage.DataField := 'IMAGE'
end;

procedure TfrmSetUp.ibdsSetUpNewRecord(DataSet: TDataSet);
begin
 ibdsSetUpIMAGE.Value := '';
 ibdsSetUpHASH_IMAGE.Value := 0;
 sbClearImage.Enabled := False;
 dbImage.DataField := '';
 dbImage.DataField := 'IMAGE'
end;

end.
