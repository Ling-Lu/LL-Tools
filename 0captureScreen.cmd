@echo off
adb root
set filename=screenshot.png
set filePath=C:\Users\%username%
echo capturing
adb shell /system/bin/screencap -p /sdcard/%filename%
echo pulling
adb pull /sdcard/%filename% %filePath%\
start %filePath%\%filename%
dir %filePath%\%filename%
