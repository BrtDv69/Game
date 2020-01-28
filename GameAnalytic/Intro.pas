unit Intro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  TfrmIntro = class(TForm)
    Image1: TImage;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIntro: TfrmIntro;

implementation

{$R *.DFM}

procedure TfrmIntro.FormShow(Sender: TObject);
begin
 frmIntro.Top := Trunc(Screen.Height/2-frmIntro.Height/2);
 frmIntro.Left := Trunc(Screen.Width/2-frmIntro.Width/2);
 Image1.Left := Trunc(frmIntro.Width/2-Image1.Width/2);
end;

end.
