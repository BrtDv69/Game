@echo off

echo    �������������������������������������������Ŀ 
echo    � Guardant AutoProtection WIZARD batch file � 
echo    � Copyright Aktiv Co.  1997-2001            � 
echo    ��������������������������������������������� 
@rem    ���� ᮧ���  11 ���� 2002  �   20:46

@rem ****** GAMEADMIN.EXE **********************************************************************
@rem *
@rem *    �ਫ������ �ਢ易�� � Guardant Stealth
@rem *    ����⠭���� ��権 �ந������� �������
@rem *    ���� �� ��������� ����ᮢ
@rem *    �஢�ઠ ���ᨨ = 1
@rem *    �஢�ઠ ��᪨  = 1
@rem *    �஢�ઠ ����� �ணࠬ�� = 1
@rem *    �஢����� ����稥 ���� ����� 5 �����
@rem *
@rem ***************************************************************************************

C:\Guardant\NWKEY32.EXE /GS /V /UV=1 /UM=1 /UN=1 /T=5 @GAMEADMIN.FIL
IF ERRORLEVEL 1 GOTO ErrorEnd
IF NOT EXIST C:\UTILS\NOVEX32.DLL COPY C:\Guardant\novex32.dll C:\UTILS\NOVEX32.DLL 


@rem ****** GAMEANALYTIC.EXE **********************************************************************
@rem *
@rem *    �ਫ������ �ਢ易�� � Guardant Stealth
@rem *    ����⠭���� ��権 �ந������� �������
@rem *    ���� �� ��������� ����ᮢ
@rem *    �஢�ઠ ���ᨨ = 1
@rem *    �஢�ઠ ��᪨  = 2
@rem *    �஢�ઠ ����� �ணࠬ�� = 1
@rem *    �஢����� ����稥 ���� ����� 5 �����
@rem *
@rem ***************************************************************************************

C:\Guardant\NWKEY32.EXE /GS /V /UV=1 /UM=2 /UN=1 /T=5 @GAMEANALYTIC.FIL
IF ERRORLEVEL 1 GOTO ErrorEnd
IF NOT EXIST C:\UTILS\NOVEX32.DLL COPY C:\Guardant\novex32.dll C:\UTILS\NOVEX32.DLL 


:ErrorEnd


