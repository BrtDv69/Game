unit Encashment;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, wwdbedit, IBSQL;

type
  TfrmEncashment = class(TForm)
    Panel1: TPanel;
    Label10: TLabel;
    dbeAmount: TwwDBEdit;
    Label7: TLabel;
    dbeComments: TwwDBEdit;
    sbApply: TSpeedButton;
    sbCancel: TSpeedButton;
    ibsEncashment: TIBSQL;
    Label1: TLabel;
    procedure sbCancelClick(Sender: TObject);
    procedure sbApplyClick(Sender: TObject);
    procedure dbeAmountKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEncashment: TfrmEncashment;

implementation

uses Main;

{$R *.DFM}

procedure TfrmEncashment.sbCancelClick(Sender: TObject);
begin
 ModalResult := mrCancel
end;

procedure TfrmEncashment.sbApplyClick(Sender: TObject);
begin
 try
  ibsEncashment.ParamByName('AMOUNT').AsDouble := StrToFloat(dbeAmount.Text);
 except
  MessageDlg('Недопустимые символы в сумме инкассации',mtError,[mbOK],0);
  Exit
 end;
 ibsEncashment.ParamByName('COMMENTS').AsString := dbeComments.Text;
 ibsEncashment.ExecQuery;
 try
  frmMain.trMain.CommitRetaining
 except
  MessageDlg('Невозможно сохранить - утеряна связь с базой данных.',mtError,[mbOK],0)
 end;
 frmMain.ibsGen_ID.SQL.Clear;
 frmMain.ibsGen_ID.SQL.Add('select AMOUNT');
 frmMain.ibsGen_ID.SQL.Add('from CASH_DESK');
 frmMain.ibsGen_ID.ExecQuery;
 frmMain.fcStatusBar1.Panels[2].Text := FormatFloat('#,##0.00',frmMain.ibsGen_ID.FieldByName('AMOUNT').AsDouble);
 frmMain.ibsGen_ID.Close;
 ModalResult := mrOK
end;

procedure TfrmEncashment.dbeAmountKeyPress(Sender: TObject; var Key: Char);
begin
 If Not (Key in ['0'..'9',DecimalSeparator,#8,#13]) then
  Key := #0
end;

end.
