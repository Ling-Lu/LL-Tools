@echo off
echo adb wait-for-device
adb wait-for-device
set para=%1
if "" EQU "%para%" (
adb shell dumpsys activity broadcasts > broadcast.log
broadcast.log
) else (
echo %1
echo.
adb shell "dumpsys activity broadcasts | grep -C 3 %para%"
)

echo done