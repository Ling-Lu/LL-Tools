@echo off
echo.
set startTips==============killing %1===================
echo %startTips%
if "%1" equ "" goto done
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

set /a cnt=0
for /f "delims=" %%i in ('adb shell ps ^| findstr %package%'
)do (
    call :count
)
if %cnt% leq 0 ( 
    goto error_package_dead
) else (
    adb shell am force-stop %package%
    echo am force-stop %package%
)
echo,
goto done
:count 
set /a cnt=%cnt%+1
goto :eof
:error
echo error
echo Wrong package name
goto done
:error_pm_more
echo error
echo more than one package matched,input more accurate package name please
goto done
:error_package_dead
echo error
echo process of %package% now alive
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
杀死 与提供的包名一致的app


:done
call endTips "%startTips%" 1 !
call colorStr "%endTips%"

echo.

