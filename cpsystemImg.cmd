@echo off

set startTips====================================================
echo.
echo %startTips%
set defaultChoice=N
if "%1" neq "" set defaultChoice=%1

echo copying ,please wait
echo.
copy /y \\10.8.169.236\source\wh_src\Android\lagvm_p\LINUX\android\out\target\product\sa8155_v35\system.img E:\bins\systemFlash\
echo copy done
echo,
dir E:\bins\systemFlash\system.img

echo,
CHOICE /T 60 /D %defaultChoice% /M "ÊÇ·ñ¿ªÊ¼download"

if %errorlevel% neq 1 goto done
echo start to download
call E:\bins\systemFlash\flashSystem.bat

:done
call endTips "%startTips%" 1 
call colorStr "%endTips%"
goto :eof


