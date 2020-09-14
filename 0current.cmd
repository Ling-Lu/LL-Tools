@echo off
for /f "delims=" %%i in ('adb shell dumpsys window ^| find "mFocusedWindow"') do (
    echo %%i
    for /f "tokens=1,2-6 delims=/} " %%m in ("%%i") do (
        set packageName=%%o
    )
)
call colorStr %packageName% 2 79
goto :eof
