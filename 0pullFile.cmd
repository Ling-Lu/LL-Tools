@echo off
echo.
echo =============pull form download===================
set /a cnt=0
set pullPath=/sdcard/download
set targetPath=%cd%
adb shell ls %pullPath%
set /p pullTarget=which do you want to pull?:
set pullFile=%pullPath%/"%pullTarget%"
echo %pullFile%
set targetFile=%targetPath%\%pullTarget%
adb pull %pullFile% %targetFile%
dir %targetFile%
echo ==================================================
goto :eof