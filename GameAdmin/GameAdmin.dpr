program GameAdmin;

uses
  Forms, Windows,
  Main in 'Main.pas' {frmMain},
  NewOrder in 'NewOrder.pas' {frmNewOrder},
  AtEnd in 'AtEnd.pas' {frmAtEnd},
  SetUp in 'SetUp.pas' {frmSetUp},
  AddRemove in 'AddRemove.pas' {frmAddRemove},
  TransferWork in 'TransferWork.pas' {frmTransferWork},
  Encashment in 'Encashment.pas' {frmEncashment},
  Intro in 'Intro.pas' {frmIntro};

var tc : Cardinal;
{$R *.RES}

begin
  Application.Initialize;
  frmIntro := TfrmIntro.Create(Application);
  tc := GetTickCount;
  frmIntro.Show;
  frmIntro.Update;
  Application.CreateForm(TfrmMain, frmMain);
  While Abs(GetTickCount-tc)<2000 do
   Application.ProcessMessages;
  frmIntro.Free;
  Application.Run;
end.
