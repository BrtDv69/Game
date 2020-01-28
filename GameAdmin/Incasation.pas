unit Incasation;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, wwdbedit, ExtCtrls, Spin, Buttons, IBSQL;

type
  TfrmIncasation = class(TForm)
    Panel1: TPanel;
    wwDBEdit1: TwwDBEdit;
    Label7: TLabel;
    Label1: TLabel;
    sbApply: TSpeedButton;
    sbCancel: TSpeedButton;
    spHalfAmount: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ibsIncasation: TIBSQL;
    Label2: TLabel;
    Label3: TLabel;
    EditRub: TEdit;
    EditKop: TEdit;
    procedure spHalfAmountClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbApplyClick(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
    procedure EditKopExit(Sender: TObject);
    procedure EditRubExit(Sender: TObject);
    procedure EditKopKeyPress(Sender: TObject; var Key: Char);
    procedure EditRubKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIncasation: TfrmIncasation;

implementation

uses Main;

{$R *.DFM}

procedure TfrmIncasation.spHalfAmountClick(Sender: TObject);
begin
 EditRub.Text:=IntToStr(Trunc(AllAmount/2));
 EditKop.Text:=IntToStr(Trunc((AllAmount/2-Trunc(AllAmount/2))*100));
 if Length(EditKop.Text)>2 then EditKop.Text:=Copy(EditKop.Text,1,2);
 if Length(EditKop.Text)=1 then EditKop.Text:=EditKop.Text+'0';
end;

procedure TfrmIncasation.SpeedButton2Click(Sender: TObject);
begin
EditRub.Text:=IntToStr(Trunc(AllAmount/1));
EditKop.Text:=IntToStr(Trunc((AllAmount/1-Trunc(AllAmount/1))*100));
if Length(EditKop.Text)>2 then EditKop.Text:=Copy(EditKop.Text,1,2);
if Length(EditKop.Text)=1 then EditKop.Text:=EditKop.Text+'0';
end;

procedure TfrmIncasation.sbApplyClick(Sender: TObject);
var
FormatString:String;
i:Integer;
begin
if Length(EditRub.Text)=0 then EditRub.Text:='0';
if Length(EditKop.Text)=1 then EditKop.Text:='0'+EditKop.Text;
if Length(EditKop.Text)=0 then EditKop.Text:='00';
//ibsIncasation.GenerateParamNames := True;
ibsIncasation.ParamByName('RemoveSum').AsDouble :=StrToInt(EditRub.Text)+StrToInt(EditKop.Text)/100 ;
ibsIncasation.ParamByName('Comment').AsString :=wwDBEdit1.Text;
ibsIncasation.ExecQuery;
ibsIncasation.Close;
ModalResult := mrOK;
frmMain.fcStatusBar1.Panels[2].Text :=FormatFloat('#,##0.00',AllAmount-(StrToInt(EditRub.Text)+StrToInt(EditKop.Text)/100)) ;
end;

procedure TfrmIncasation.sbCancelClick(Sender: TObject);
begin
ModalResult := mrCancel;
end;

procedure TfrmIncasation.EditKopExit(Sender: TObject);
begin
 if Length(EditKop.Text)=1 then EditKop.Text:='0'+EditKop.Text;
 if Length(EditKop.Text)=0 then EditKop.Text:='00';
end;

procedure TfrmIncasation.EditRubExit(Sender: TObject);
begin
 if Length(EditRub.Text)=0 then EditRub.Text:='0';
end;

procedure TfrmIncasation.EditKopKeyPress(Sender: TObject; var Key: Char);
begin
if not ((key in ['0'..'9'])or((GetKeyState(VK_DELETE)<0))or(GetKeyState(VK_BACK)<0)) then EditKop.ReadOnly:=True
else EditKop.ReadOnly:=False;
end;

procedure TfrmIncasation.EditRubKeyPress(Sender: TObject; var Key: Char);
begin
if not ((key in ['0'..'9'])or((GetKeyState(VK_DELETE)<0))or(GetKeyState(VK_BACK)<0)) then EditRub.ReadOnly:=True
else EditRub.ReadOnly:=False;   
end;

end.
