unit PswdChange;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, wwdbedit, ExtCtrls, Buttons;

type
  TfrmPswdChange = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    dbeNewPassword: TwwDBEdit;
    dbeNewPasswordConfirm: TwwDBEdit;
    sbOK: TSpeedButton;
    procedure sbOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPswdChange: TfrmPswdChange;

implementation

uses Main;

{$R *.DFM}

procedure TfrmPswdChange.sbOKClick(Sender: TObject);
begin
 If (dbeNewPassword.Text<>dbeNewPasswordConfirm.Text) then
  MessageDlg('Вы неверно подтвердили пароль!',mtError,[mbOK],0)
 else
  ModalResult := mrOk
end;

end.
