@echo off

REM ��ѯĿ¼��δ��ѹ���ļ� ��ѹ



echo.
set startTips=--------------------------------------------------------------------------
echo %startTips%
echo monitoring ~~~

set monitorPath="E:\Ѹ������"


cd /d %monitorPath%
echo %cd%

:loop
timeout /t 60
date /t
time /t

echo looking for *.rar
for /f "delims=" %%a in ('dir *.rar /b /a-d-h'
)do (
call :unzip %%a
)

echo looking for *.zip
for /f "delims=" %%a in ('dir *.zip /b /a-d-h'
)do (
call :unzip %%a
)

echo looking for *.gz
for /f "delims=" %%a in ('dir *.gz /b /a-d-h'
)do (
call :unzip %%a
)

goto loop


REM unzip
:unzip
set name=%~nx1
set name=%name:.=_%
if not exist %name% (
echo unzipping %1
WinRAR  x %1 %name%/
echo unzip done %1
)
goto :eof