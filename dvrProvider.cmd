@echo off
adb root
adb wait-for-device

set startTips====================================================
echo.
echo %startTips%

set target="/system/priv-app/GwmDVRProvider/GwmDVRProvider.apk"
set targetName=GwmDVRProvider

adb remount

for /f "tokens=2 delims==" %%a in ('wmic path win32_operatingsystem get LocalDateTime /value') do (  
    set t=%%a
)
set nowTime=%t:~0,12%
echo,%nowTime%

set targetPath=..\%targetName%\%nowTime%\
if not exist %targetPath% mkdir %targetPath%

echo pulling %target% %targetPath%
adb pull %target% %targetPath%
adb shell ls -al %target%
echo deleting
adb shell rm -rf %target%
echo pushing
adb push F:\Projects\FW\vendorGwmPackages\packages\services\GwmDVRProvider\app\build\outputs\apk\debug\app-debug.apk %target%
adb shell ls -al %target%

adb reboot
echo adb shell am start -n com.gwm.dvrprovider/.MainActivity
call endTips "%startTips%" 1 
call colorStr "%endTips%"
goto :eof
