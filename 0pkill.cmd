@echo off
echo.
echo =============killing %1===================
set /a cnt=0
for /f "delims=" %%i in ('adb shell pm list packages ^| findstr %1'
)do (
set package=%%i
call :count
echo %%i
)
echo start %1 %cnt% %package%
if %cnt% EQU 0 goto error
if %cnt% GTR 1 goto error_pm_more
for /f "tokens=1,2 delims=:" %%i in ("%package%"
)do (
set package=%%j
)
echo package == %package% 
echo,
adb shell ps | findstr %package%
adb shell am force-stop %package%

echo ======am force-stop %package% =====
echo,
goto done
:count 
set /a cnt=%cnt%+1
goto done
:error
echo Wrong package name
goto done
:error_pm_more
echo more than one package matched,input more accurate package name please
goto done
:error_package_dead
echo process of %package now alive
goto done



这里是注释
for /f "delims=" %%i in ('adb shell pgrep %package%'
)do (
set p=%%i
)
echo PID:%p%
if "%p%" EQU "" goto error_package_dead
adb shell kill -s 9 %p%

：usage
杀死 与提供的包名 一直的app


:done