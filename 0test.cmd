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

:: function manual ,demo
rem �˳���������������1. goto :eof 2. exit /b 0 (������ֵ%errolevel% �˳���
rem It means the function end,and in the main function it will make the program exit

rem ��������ֵ������������ https://www.icode9.com/content-4-360767.html
rem ��������ֵ.bat
set returnValue=9
echo %returnValue%
call :funcdemo returnValue
echo returned %returnValue%
echo errolevel %errolevel%
:funcdemo
set %~1=0
exit /b 99
goto :eof


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
::done

:: func(change word color) two methods here--------------------------------------------------------------------------------

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
::func(color string)

@echo [4;1;5;7;8;46m nihao [0m
�ֱ�����ɫ��Χ:40----49 
40:�� 
41:��� 
42:�� 
43:��ɫ 
44:��ɫ 
45:��ɫ 
46:���� ����Ϊǳ��ɫ
47:��ɫ
����ɫ:30-----------39 
30:�� 
31:�� 
32:�� 
33:�� 
34:��ɫ 
35:��ɫ 
36:���� ����Ϊǳ��ɫ
37:��ɫ
[0m �ر��������� 
[1m ���ø����� 
[4m �»��� 
[5m ��˸ 
[7m ���� 
[8m ���� ��֪��ɶЧ��
[30m -- \33[37m ����ǰ��ɫ 
[40m -- \33[47m ���ñ���ɫ 
:: func(get random number(1-100)) two methods here-------------------------------------------------------------------------
set /a RandomNumber=%random%%%100+1
echo RandomNumber = %RandomNumber%
set /a RandomNumber=%random:~0,2%+1
echo RandomNumber = %RandomNumber%

:: func(cnd the length of the string)---------------------------------------------------------------------
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