unit AtEnd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons;

type
  TfrmAtEnd = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    lblAtEnd: TLabel;
    sbApply: TSpeedButton;
    procedure sbApplyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtEnd: TfrmAtEnd;

implementation

{$R *.DFM}

procedure TfrmAtEnd.sbApplyClick(Sender: TObject);
begin
 lblAtEnd.Caption := '';
 Close
end;

end.
