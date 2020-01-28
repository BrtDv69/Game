@echo off

echo    ┌───────────────────────────────────────────┐ 
echo    │ Guardant AutoProtection WIZARD batch file │ 
echo    │ Copyright Aktiv Co.  1997-2001            │ 
echo    └───────────────────────────────────────────┘ 
@rem    Файл создан  4 Июня 2002  в   20:24

@rem ****** GAMEADMIN.EXE **********************************************************************
@rem *
@rem *    Приложение привязано к Guardant Stealth
@rem *    Расстановка опций произведена ВРУЧНУЮ
@rem *    Защита от нападения вирусов
@rem *    Проверка версии = 1
@rem *    Проверка маски  = 1
@rem *    Проверка номера программы = 1
@rem *    Проверять наличие ключа каждые 5 минут
@rem *    Изменены стандартные сообщения вакцины
@rem *
@rem ***************************************************************************************

C:\Guardant\NWKEY32.EXE /GS /V /UV=1 /UM=1 /UN=1 /T=5 /MSG=GAMEADMIN.MSG @GAMEADMIN.FIL
IF ERRORLEVEL 1 GOTO ErrorEnd
IF NOT EXIST C:\UTILS\NOVEX32.DLL COPY C:\Guardant\novex32.dll C:\UTILS\NOVEX32.DLL 


:ErrorEnd


