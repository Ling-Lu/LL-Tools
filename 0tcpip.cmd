@echo off
echo.
echo ����Զ�̵���
echo =====================================

set /a cnt=0
for /f "delims=" %%i in ('adb devices'
)do (
call :count
)
if %cnt% EQU 1 (
echo No device found, Please connect
adb wait-for-device 
)

SET device=
if %cnt% GTR 2 (
echo,
adb devices
echo More than one devices found, Please input your target device
set /p device=
)
if "%device%" NEQ "" set device=-s %device%

for /f "delims=" %%i in ('adb %device% shell ifconfig ^| find "inet addr:192.168."'
)do (
set ip=%%i
)
for /f "tokens=1,2,* delims= " %%i in ("%ip%"
)do (
set ip=%%j
)
for /f "tokens=1,2,* delims=:" %%i in ("%ip%"
)do (
set ip=%%j
)

if "%ip%" EQU "" goto error_no_ip
echo connecting %ip%
adb %device% tcpip 5555
adb %device% connect %ip%:5555

rem �ȴ�2s
for /f "tokens=1,2,* delims=:" %%i in ('timeout /t 2'
)do (
echo,
)
adb devices

goto done

rem error handle
:error_no_ip
echo ERROR
echo Wlan ip not found ,is it connected with Wlan ?
call :usage
goto done

goto end
rem ע��

����ֵ %ERRORLEVEL%

����
set /a cnt=0
for /f "delims=" %%i in ('adb shell ifconfig ^| findstr %1'
)do (
call :count
echo %%i
)
:count 
set /a cnt=%cnt%+1
goto :eof
:usage
echo usage
echo 1. usb�����豸
echo 2. �豸�͵�������ͬһ��wifi
goto :eof

:done
echo =====================================
echo,
:end