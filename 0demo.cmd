@echo off
echo.
set startTips=--------------------------------------------------------------------------
echo %startTips%
set run_failure=0
REM -----------------------------------------------------------------------------------------------Code
echo Hello My world!
call :usage
call :error









REM -----------------------------------------------------------------------------------------------Code

:end
set colorAttr=9F
if %run_failure% EQU 1 set colorAttr=CF
call endTips "%startTips%" 1 -
call colorStr "%endTips%" 2 %colorAttr%
goto :eof

REM -----------------------------------------------------------------------------------------------Functions
REM Functions below
:usage
call colorStr "Usage" 2 79
call colorStr "Write your help Message here" 2
goto :eof

REM error tips
:error
echo Wrong package name
set run_failure=1
goto :eof
:error_pm_more
echo more than one package matched,input more accurate package name please
set run_failure=1
goto :eof
:error_package_dead
echo process of %package now alive
set run_failure=1
goto :eof

REM -----------------------------------------------------------------------------------------------Functions




