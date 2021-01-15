@echo off
set startTips====================================================
echo %startTips%
echo.
REM -----------------------------------------------------------------------------------------------Code
::call :usage
::goto error
set package=%1
set /a cnt=0
for /f "delims=" %%i in ('adb shell "dumpsys package %package% | grep android.intent.action.MAIN -A 3 | grep / | awk '{print $2}'"'
)do (
echo %%i
set component=%%i
call set /a cnt=%%cnt%%+1
)

if %cnt% LSS 1 (
	echo no component found in package 
	goto end
)
if %cnt% GEQ 2 (
	echo,
	echo More than one MAIN Activity found, Please input your target
	set /p component=
)

echo,
echo %package% --- %component% --- starting
adb shell am start %component%



REM -----------------------------------------------------------------------------------------------Code

REM -----------------------------------------------------------------------------------------------Error handle
REM error tips
goto end
:error
echo Wrong package name
goto end
REM -----------------------------------------------------------------------------------------------Error handle


:end
call endTips "%startTips%" 1 
call colorStr "%endTips%"
goto :eof

REM -----------------------------------------------------------------------------------------------Functions
REM Functions below
:usage
call colorStr "Usage" 2 79
call colorStr "start the Activity that has action android.intent.action.MAIN" 2
echo,
goto :eof
REM -----------------------------------------------------------------------------------------------Functions




