@echo off
echo.
echo ===========Test pieces==================

call :colorStr nihao 2
call :colorStr nihao 1 f5

:done
echo =====================================
echo,
goto end

rem funtions here





rem comment following***********************************************************************************************************

:: function manual ,demo
rem ÍË³öº¯ÊıÁ½¸ö·½·¨£º1. goto :eof 2. exit /b 0 (´ø·µ»ØÖµ%errolevel% ÍË³ö£©
rem It means the function end,and in the main function it will make the program exit

rem º¯Êı·µ»ØÖµÁ½¸ö·½·¨´ø»Ø https://www.icode9.com/content-4-360767.html
rem º¯Êı·µ»ØÖµ.bat
set returnValue=9
echo %returnValue%
call :funcdemo returnValue
echo returned %returnValue%
echo errolevel %errolevel%
:funcdemo
set %~1=0
exit /b 99
goto :eof


:: func(count the lines) two methods here---------------------------------------------------------
set /a cnt=0
for /f "delims=" %%i in ('adb devices'
)do (
echo %%i
call set /a cnt=%%cnt%%+1
)
echo count %cnt%

set /a cnt=0
for /f "delims=" %%i in ('adb devices'
)do (
echo %%i
call :count
)
echo count %cnt%

goto done

:count 
set /a cnt=%cnt%+1
goto :eof
::done

:: func(change word color) two methods here--------------------------------------------------------------------------------

set msg="sameplestring"
echo. >%msg%&findstr /a:a .* %msg%*&del /q %msg%
rem Á½¸öµÈĞ§£¬µ«ÊÇÏÂ±ßÕâ¸ö²»»á»»ĞĞ
rem set /p= <nul>%msg%&findstr /a:a .* %msg%*&del /q %msg%

::Àí½â£º £¬Ç°Ò»¸öÍË¸ñÓÎ±ê»ØÍË£¬Ö®ºó¿Õ¸ñ²¹Î»Ìæ»»£¬ºóÒ»¸öÍË¸ñ»ØÍËÓÎ±ê
::Àí½â£º.* ±íÊ¾ÈÎºÎ×Ö·û
::Àí½â£º%msg%*ºó±ßµÄ*±ØĞë´ø£¬·ñÔòÃ»ÓĞÑÕÉ«£¬/a ÑÕÉ«ÊôĞÔ×÷ÓÃÔÚÕÒµ½ÎÄ¼şµÄÎÄ¼şÃûÉÏ
::Àí½â£ºfindstr ÔÚÎÄ¼şÁĞ±íÀï²éÕÒ×Ö·û´®£¬²¢ÇÒ¸øÎÄ¼şÁĞ±íµÄÎÄ¼şÃû¸³¸øÑÕÉ«¸ßÁÁ
set msg=sameplestring!
echo %msg%
echo. >%msg%&findstr /a:a .* %msg%*&del /q %msg%
set /p= <nul>%msg%&findstr /a:a .* %msg%*&del /q %msg%
for /f "delims=" %%i in ('echo. ^>%msg%^& findstr /a:d .* %msg%* ^& del /q %msg%')do (
 echo.%%i
)
::func sameple
for /f "delims= " %%i in ("abc abd abe") do (
call :colorStr %%i 1
echo suffix
)

:colorStr
set msg=%1
set colorMod=%2
set color=%3
if "" equ "%color%" set color=0c
echo %msg% %colorMod%
if "" equ "%msg%" goto :eof
if "%colorMod%" equ "1" (
set /p= <nul>%msg%&findstr /a:%color% .* %msg%*&del /q %msg%
) else (
echo. >%msg%&findstr /a:%color% .* %msg%*&del /q %msg%
)
goto :eof
::func(color string)

@echo [4;1;5;7;8;46m nihao [0m
×Ö±³¾°ÑÕÉ«·¶Î§:40----49 
40:ºÚ 
41:Éîºì 
42:ÂÌ 
43:»ÆÉ« 
44:À¶É« 
45:×ÏÉ« 
46:ÉîÂÌ ²âÊÔÎªÇ³À¶É«
47:°×É«
×ÖÑÕÉ«:30-----------39 
30:ºÚ 
31:ºì 
32:ÂÌ 
33:»Æ 
34:À¶É« 
35:×ÏÉ« 
36:ÉîÂÌ ²âÊÔÎªÇ³À¶É«
37:°×É«
[0m ¹Ø±ÕËùÓĞÊôĞÔ 
[1m ÉèÖÃ¸ßÁÁ¶È 
[4m ÏÂ»®Ïß 
[5m ÉÁË¸ 
[7m ·´ÏÔ 
[8m ÏûÒş ²»ÖªµÀÉ¶Ğ§¹û
[30m -- \33[37m ÉèÖÃÇ°¾°É« 
[40m -- \33[47m ÉèÖÃ±³¾°É« 
:: func(get random number(1-100)) two methods here-------------------------------------------------------------------------
set /a RandomNumber=%random%%%100+1
echo RandomNumber = %RandomNumber%
set /a RandomNumber=%random:~0,2%+1
echo RandomNumber = %RandomNumber%

:: func(cnd the length of the string)---------------------------------------------------------------------
set str=123456789ÄãºÃadbdef
set cnt=0
:cntCharacter
call set character=%%str:~%cnt%,1%%
if "" neq "%character%" (
set /a cnt+=1
goto cntCharacter
)
echo charater number = %cnt%

rem comment done****************************************************************************************************************


:end