program Install;

{%ToDo 'Install.todo'}

uses
  Forms,
  Main in 'Main.pas' {frmMain},
  PswdChange in 'PswdChange.pas' {frmPswdChange};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Wizard iGame Install';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
