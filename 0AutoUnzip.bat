@echo off

REM ÂÖÑ¯Ä¿Â¼ÖÐÎ´½âÑ¹µÄÎÄ¼þ ½âÑ¹



echo.
set startTips=--------------------------------------------------------------------------
echo %startTips%
echo monitoring ~~~

set monitorPath="E:\Ñ¸À×ÏÂÔØ"


cd /d %monitorPath%
echo %cd%

:loop
timeout /t 60
date /t & time /t

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

echo looking for *.7z
for /f "delims=" %%a in ('dir *.7z /b /a-d-h'
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
set rn=%~nx1
set rn=%rn:(=_%
set rn=%rn:)=_%
if not exist %rn% (
move /y "%1" %rn%
)

set name=%rn:.=_%

if not exist %name% (
echo [1;36m unzipping %rn% [0m
"C:\Program Files\WinRAR\WinRAR"  x "%rn%" %name%\
echo unzip done %rn%
)

goto :eof