program GameAnalytic;

uses
  Forms, Windows,
  Main in 'Main.pas' {frmMain},
  Intro in 'Intro.pas' {frmIntro};

{Ivan}var tc : Cardinal;
{$R *.RES}

begin
  Application.Initialize;
  frmIntro := TfrmIntro.Create(Application);
  tc := GetTickCount;
  frmIntro.Show;
  frmIntro.Update;
  Application.Title := 'Wizard iGame Analitic';
  Application.CreateForm(TfrmMain, frmMain);
  While Abs(GetTickCount-tc)<2000 do
   Application.ProcessMessages;
  frmIntro.Free;
  Application.Run;
end.
