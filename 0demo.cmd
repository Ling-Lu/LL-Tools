@echo off
set startTips====================================================
echo %startTips%
echo.
REM -----------------------------------------------------------------------------------------------Code
call :usage
goto error



REM -----------------------------------------------------------------------------------------------Code

REM -----------------------------------------------------------------------------------------------Error handle
REM error tips
goto end
:error
echo Wrong package name
goto end
:error_pm_more
echo more than one package matched,input more accurate package name please
goto end
:error_package_dead
echo process of %package now alive

REM -----------------------------------------------------------------------------------------------Error handle


:end
call endTips "%startTips%" 1 
call colorStr "%endTips%"
goto :eof

REM -----------------------------------------------------------------------------------------------Functions
REM Functions below
:usage
call colorStr "Usage" 2 79
call colorStr "Write your help Message here" 2
goto :eof
REM -----------------------------------------------------------------------------------------------Functions




