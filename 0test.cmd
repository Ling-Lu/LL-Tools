@echo off
echo.
echo ===========Test pieces==================

call :colorStr nihao 2
call :colorStr nihao 1 f5

:done
echo =====================================
echo,
goto end

rem funtions here





rem comment following***********************************************************************************************************

:: func(count the lines) two methods here---------------------------------------------------------
set /a cnt=0
for /f "delims=" %%i in ('adb devices'
)do (
echo %%i
call set /a cnt=%%cnt%%+1
)
echo count %cnt%

set /a cnt=0
for /f "delims=" %%i in ('adb devices'
)do (
echo %%i
call :count
)
echo count %cnt%

goto done

:count 
set /a cnt=%cnt%+1
goto :eof
:: func(count the lines) done

::goto :eof----------------------------------------------------------------------------------------
::It means the function end,and in the main function it will make the program exit

::change word color--------------------------------------------------------------------------------

set msg="sameplestring"
echo. >%msg%&findstr /a:a .* %msg%*&del /q %msg%
rem ������Ч�������±�������ỻ��
rem set /p= <nul>%msg%&findstr /a:a .* %msg%*&del /q %msg%

::��⣺ ��ǰһ���˸��α���ˣ�֮��ո�λ�滻����һ���˸�����α�
::��⣺.* ��ʾ�κ��ַ�
::��⣺%msg%*��ߵ�*�����������û����ɫ��/a ��ɫ�����������ҵ��ļ����ļ�����
::��⣺findstr ���ļ��б�������ַ��������Ҹ��ļ��б���ļ���������ɫ����
set msg=sameplestring!
echo %msg%
echo. >%msg%&findstr /a:a .* %msg%*&del /q %msg%
set /p= <nul>%msg%&findstr /a:a .* %msg%*&del /q %msg%
for /f "delims=" %%i in ('echo. ^>%msg%^& findstr /a:d .* %msg%* ^& del /q %msg%')do (
 echo.%%i
)
::func sameple
for /f "delims= " %%i in ("abc abd abe") do (
call :colorStr %%i 1
echo suffix
)

:colorStr
set msg=%1
set colorMod=%2
set color=%3
if "" equ "%color%" set color=0c
echo %msg% %colorMod%
if "" equ "%msg%" goto :eof
if "%colorMod%" equ "1" (
set /p= <nul>%msg%&findstr /a:%color% .* %msg%*&del /q %msg%
) else (
echo. >%msg%&findstr /a:%color% .* %msg%*&del /q %msg%
)
goto :eof

::get random number(1-100)-------------------------------------------------------------------------
set /a RandomNumber=%random%%%100+1
echo RandomNumber = %RandomNumber%
set /a RandomNumber=%random:~0,2%+1
echo RandomNumber = %RandomNumber%

::cnd the length of the string---------------------------------------------------------------------
set str=123456789���adbdef
set cnt=0
:cntCharacter
call set character=%%str:~%cnt%,1%%
if "" neq "%character%" (
set /a cnt+=1
goto cntCharacter
)
echo charater number = %cnt%


rem comment done****************************************************************************************************************


:end