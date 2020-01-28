@echo off

echo    ┌───────────────────────────────────────────┐ 
echo    │ Guardant AutoProtection WIZARD batch file │ 
echo    │ Copyright Aktiv Co.  1997-2001            │ 
echo    └───────────────────────────────────────────┘ 
@rem    Файл создан  11 Марта 2002  в   20:46

@rem ****** GAMEADMIN.EXE **********************************************************************
@rem *
@rem *    Приложение привязано к Guardant Stealth
@rem *    Расстановка опций произведена ВРУЧНУЮ
@rem *    Защита от нападения вирусов
@rem *    Проверка версии = 1
@rem *    Проверка маски  = 1
@rem *    Проверка номера программы = 1
@rem *    Проверять наличие ключа каждые 5 минут
@rem *
@rem ***************************************************************************************

C:\Guardant\NWKEY32.EXE /GS /V /UV=1 /UM=1 /UN=1 /T=5 @GAMEADMIN.FIL
IF ERRORLEVEL 1 GOTO ErrorEnd
IF NOT EXIST C:\UTILS\NOVEX32.DLL COPY C:\Guardant\novex32.dll C:\UTILS\NOVEX32.DLL 


@rem ****** GAMEANALYTIC.EXE **********************************************************************
@rem *
@rem *    Приложение привязано к Guardant Stealth
@rem *    Расстановка опций произведена ВРУЧНУЮ
@rem *    Защита от нападения вирусов
@rem *    Проверка версии = 1
@rem *    Проверка маски  = 2
@rem *    Проверка номера программы = 1
@rem *    Проверять наличие ключа каждые 5 минут
@rem *
@rem ***************************************************************************************

C:\Guardant\NWKEY32.EXE /GS /V /UV=1 /UM=2 /UN=1 /T=5 @GAMEANALYTIC.FIL
IF ERRORLEVEL 1 GOTO ErrorEnd
IF NOT EXIST C:\UTILS\NOVEX32.DLL COPY C:\Guardant\novex32.dll C:\UTILS\NOVEX32.DLL 


:ErrorEnd


