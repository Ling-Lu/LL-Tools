@echo off
REM 函数:将环境变量中的每一个路径都单独一行输出
echo %path%
for /f "tokens=* delims=;" %%i in ("%path%"
) do (
call :PATH2MultiLine %%i
)
pause
exit
:PATH2MultiLine
set oneLine=
if not "%1" == "" (
set oneLine=%1
:integration
if not "%2" == "" (
for /f "tokens=1,2 delims=:" %%i in ("%2"
)do (
if "%%j" == "" (
call set oneLine=%%oneLine%% %2
shift /1
goto integration
)
)
)
call echo "%%oneLine%%"
shift /1
goto PATH2MultiLine
)
goto :eof