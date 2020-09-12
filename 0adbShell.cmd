@echo off
echo adb wait-for-device
adb wait-for-device

set para=%1
:loop
shift
if "" neq "%1" (
set para=%para% %1
goto loop
)

if "" EQU "%para%" (
echo cmd null
) else (
adb shell "%para%"
)

echo,
echo done