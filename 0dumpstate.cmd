@echo off

set fileName=%1
if "" equ "%fileName%" set fileName=dump.log 
echo wait-for-device
adb wait-for-device
echo,
echo taking dumpstate
adb shell dumpstate > %fileName%
echo,
echo %fileName%
%fileName%
echo dumpstate done