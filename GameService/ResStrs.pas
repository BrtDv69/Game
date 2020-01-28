unit ResStrs;

interface

resourcestring
  SAlreadyRunning = 'Сервис уже запущен.';
  SMutexName      = 'WGSSVS';
  SServiceName    = 'WIZGAMESVS';
  SServiceDisplayName = 'Wizard iGame Client';
  SServiceOnly = 'On Windows NT 3.5 and lower application may be running as service only!';

  SServerProcCode   = 'SERVER_THREAD1';

  SUnableCreateSem = 'Невозможно создать семафор.';

  SError = 'Ошибка!';

procedure RaiseError(const S: string);

implementation

uses SysUtils;

procedure RaiseError(const S: string);
begin
 raise Exception.Create(S);
end;

end.
