@echo off
echo.
echo =====================================
set package=%1
if "%1" EQU "" SET package=com.gwm.car.gwmcarmediaservice
set /a cnt=0
for /f "delims=" %%i in ('adb shell pm list packages -f %package%'
)do (
set package=%%i
call :count
echo %%i
)
echo %1 %cnt% %package%
if %cnt% EQU 0 goto error
if %cnt% GTR 1 goto error_pm_more
for /f "delims===" %%i in ("%package%"
)do (
set package=%%i
)

for /f "tokens=1,2 delims=:" %%i in ("%package%"
)do (
set package=%%j
)
set ppath=%package%==
echo,
echo install path: %ppath%

echo %ppath%
adb ls %ppath%
set ppatharm=%ppath%/lib/arm
echo %ppatharm%
adb ls %ppatharm%
set ppatharm64=%ppath%/lib/arm64
echo %ppatharm64%
adb ls %ppatharm64%

echo =====================================
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


列出与之匹配的包名所在的app目录下及lib下的问价夹中的内容
默认

这里是注释 ===============
for /f "delims=" %%i in ('adb shell pgrep %package%'
)do (
set p=%%i
)
echo PID:%p%
if "%p%" EQU "" goto error_package_dead
adb shell kill -s 9 %p%

<INTENT> specifications include these flags and arguments:
    [-a <ACTION>] [-d <DATA_URI>] [-t <MIME_TYPE>]
    [-c <CATEGORY> [-c <CATEGORY>] ...]
    [-n <COMPONENT_NAME>]
    [-e|--es <EXTRA_KEY> <EXTRA_STRING_VALUE> ...]
    [--esn <EXTRA_KEY> ...]
    [--ez <EXTRA_KEY> <EXTRA_BOOLEAN_VALUE> ...]
    [--ei <EXTRA_KEY> <EXTRA_INT_VALUE> ...]
    [--el <EXTRA_KEY> <EXTRA_LONG_VALUE> ...]
    [--ef <EXTRA_KEY> <EXTRA_FLOAT_VALUE> ...]
    [--eu <EXTRA_KEY> <EXTRA_URI_VALUE> ...]
    [--ecn <EXTRA_KEY> <EXTRA_COMPONENT_NAME_VALUE>]
    [--eia <EXTRA_KEY> <EXTRA_INT_VALUE>[,<EXTRA_INT_VALUE...]]
        (mutiple extras passed as Integer[])
    [--eial <EXTRA_KEY> <EXTRA_INT_VALUE>[,<EXTRA_INT_VALUE...]]
        (mutiple extras passed as List<Integer>)
    [--ela <EXTRA_KEY> <EXTRA_LONG_VALUE>[,<EXTRA_LONG_VALUE...]]
        (mutiple extras passed as Long[])
    [--elal <EXTRA_KEY> <EXTRA_LONG_VALUE>[,<EXTRA_LONG_VALUE...]]
        (mutiple extras passed as List<Long>)
    [--efa <EXTRA_KEY> <EXTRA_FLOAT_VALUE>[,<EXTRA_FLOAT_VALUE...]]
        (mutiple extras passed as Float[])
    [--efal <EXTRA_KEY> <EXTRA_FLOAT_VALUE>[,<EXTRA_FLOAT_VALUE...]]
        (mutiple extras passed as List<Float>)
    [--esa <EXTRA_KEY> <EXTRA_STRING_VALUE>[,<EXTRA_STRING_VALUE...]]
        (mutiple extras passed as String[]; to embed a comma into a string,
         escape it using "\,")
    [--esal <EXTRA_KEY> <EXTRA_STRING_VALUE>[,<EXTRA_STRING_VALUE...]]
        (mutiple extras passed as List<String>; to embed a comma into a string,
         escape it using "\,")
    [-f <FLAG>]
    [--grant-read-uri-permission] [--grant-write-uri-permission]
    [--grant-persistable-uri-permission] [--grant-prefix-uri-permission]
    [--debug-log-resolution] [--exclude-stopped-packages]
    [--include-stopped-packages]
    [--activity-brought-to-front] [--activity-clear-top]
    [--activity-clear-when-task-reset] [--activity-exclude-from-recents]
    [--activity-launched-from-history] [--activity-multiple-task]
    [--activity-no-animation] [--activity-no-history]
    [--activity-no-user-action] [--activity-previous-is-top]
    [--activity-reorder-to-front] [--activity-reset-task-if-needed]
    [--activity-single-top] [--activity-clear-task]
    [--activity-task-on-home] [--activity-match-external]
    [--receiver-registered-only] [--receiver-replace-pending]
    [--receiver-foreground] [--receiver-no-abort]
    [--receiver-include-background]
    [--selector]
    [<URI> | <PACKAGE> | <COMPONENT>]
这里是注释 ===============

:done




