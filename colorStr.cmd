@echo off

set msg=%~1
set colorMod=%2
set colorAttr=%3
if "" equ "%colorAttr%" set colorAttr=fd
if "%msg%" equ "" goto :eof

::msg 中不能包含文件名禁止的字符"：< > / \ | : " * ?"
set ForbiddenStr="/" "\" ":"
for /f "delims=" %%i in ('echo %1 ^| findstr "?"') do (
	goto errorMsg
)
for /f "delims=" %%i in ('echo %1 ^| findstr "*"') do (
	goto errorMsg
)
for /f "delims=" %%i in ('echo %1 ^| findstr ">"') do (
	goto errorMsg
)
for /f "delims=" %%i in ('echo %1 ^| findstr "<"') do (
	goto errorMsg
)
for %%i in (%ForbiddenStr%) do (
	for /f "delims=" %%a in ('echo "%msg%" ^| find "%%~i"') do (
		goto errorMsg
	)
)
goto noError
:errorMsg
set msg="Error String containing forbidden character"
set colorAttr=fc
:noError
set msg="%msg%"
if "%colorMod%" equ "1" (
set /p= <nul>%msg%&findstr /a:%colorAttr% .* %msg%*&del /q %msg%
) else (
echo. >%msg%&findstr /a:%colorAttr% .* %msg%*&del /q %msg%
)
goto :eof