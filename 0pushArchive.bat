@echo off
if "%1" == "" goto :error
echo,
echo @@@ Begin @@@
echo.
rem adb shell su -c setenforce 0

set targetType=*.apk *.jar
set workPath=%cd%
set workDisk=%~d0

set targetDisk=%~d1
set targetBackupPath=%~dpn1

for /f "tokens=2 delims==" %%a in ('wmic path win32_operatingsystem get LocalDateTime /value') do (  
    set t=%%a
)
set nowTime=%t:~0,12%
set targetBackupPathSuffix=%nowTime:~4,2%.%nowTime:~6,2%_%nowTime:~-4%

HaoZipC.exe x %1 -y -o%~dpn1
if %errorlevel% neq 0 goto :error

%targetDisk%
cd %targetBackupPath%\android

echo,
echo decompress completed

echo,
echo waiting for device
adb wait-for-device
adb shell getprop ro.product.model
adb remount

for /f "delims=" %%i in ('dir %targetType% /b/a-d/od/s '
)do (
%workDisk%
cd %workPath%

call :pushOperation %%i

%targetDisk%
cd %targetDecompressPath%
)
%workDisk%
cd %workPath%

choice /C YN /T 5 /D Y /M 重启?
if %errorlevel% equ 1 (
adb reboot
)

goto :done





:pushOperation
adb wait-for-device
:cnt
if "%1" == "" goto skip

set myPath=%~dp1
call :system_Path "%mypath%"

echo,
set backupPath=%targetBackupPath%\pull_backUp\%targetBackupPathSuffix%
if not exist %backupPath% (
mkdir %backupPath%
echo make dir %backupPath%
)
echo ************** %~nx1 **************
adb pull %mypath%/%~nx1 %backupPath%
echo ************** backup done

echo,
if ".apk" equ "%~x1" (
echo installing %1
adb install -r %1
) else (
echo pushing %1 to %mypath%
adb push %1 %mypath%
)

rem set deleteOdexS=%~n1.odex
rem set deleteOdex=

rem for /f "tokens=1,* delims= " %%e in ('adb shell ls %mypath%/%deleteOdexS%') do (
rem if "%%f" equ "" set deleteOdex=%%~nxe
rem )

rem if "%deleteOdex%" neq "" (echo deleted ************** %mypath%/%deleteOdex% ************** & adb shell rm -f %mypath%/%deleteOdex%)

shift /1
goto :cnt 
:skip

goto :sucess


:ou
for /f "tokens=1,* delims=\" %%e in (%1) do (
if "%%f" neq "" ( call :ou "%%f" 
) else (
set myPath=%%e
)
)
goto :eof

:ou_L
for /f "tokens=1,2,3,* delims=\" %%e in (%1) do (
if "%%h" neq "" ( call :ou_L "%%f\%%g\%%h"
) else (
set myPathL=/%%e/%%f/%%g
)
)
goto :eof

:system_Path
for /f "tokens=1,2,3,* delims=\" %%e in (%1) do (
if "%%e" neq "system" ( call :system_Path "%%f\%%g\%%h"
) else (

if "%%g" neq "" (
set myPath=/%%e/%%f/%%g
) else (
set myPath=/%%e/%%f
)

goto :eof
)
)
goto :eof


:usage
echo 可以多文件，一次拖拉几个文件到该bat上，或者在命令行多次拖拽
echo L和非L型号都支持
goto :eof

goto :eof
rem pushOpt========================================================================


:error
echo what you input is not an archive that HaoZipC.exe surport
goto :done

:sucess
echo,
echo one push completed
echo backUp path is %backupPath%
echo **************************************************
echo,
:done
