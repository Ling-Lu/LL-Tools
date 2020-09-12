@echo off  
for /f "tokens=2 delims==" %%a in ('wmic path win32_operatingsystem get LocalDateTime /value') do (  
    set t=%%a
)  
set nowTime=%t:~0,12%
echo,%nowTime% 
echo %t:~0,8%
echo %nowTime:~-4%
pause 