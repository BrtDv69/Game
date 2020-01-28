unit Misc;

interface

uses Classes, Windows, Messages, SyncObjs;

const
  UI_INITIALIZE    = WM_USER+1;
  USERSINFO_UPDATE = WM_USER+2;
  SERVICE_SHUTDOWN = WM_USER+3;

procedure ErrorDlg( const Mess: string);

implementation

uses SysUtils, Forms, ResStrs;

procedure ErrorDlg( const Mess: string);
begin
  Application.MessageBox(PChar(Mess), PChar(SError), MB_OK or MB_ICONERROR);
end;

end.
