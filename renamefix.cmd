@echo off
set oldName=*.jpg
set namePrefix=%~1
set nameSufix=%~2
for /f "delims=" %%a in ('dir %oldName% /b /a-d-h'
)do (
move %%a %namePrefix%%%a%nameSufix%
)
pause

goto :eof

:usage
���ļ������ǰ׺�ͺ�׺