@echo off
for /f "delims=" %%i in ('dir /b/ad/o-d'
)do (
echo %%i
echo %%~ti
)
pause