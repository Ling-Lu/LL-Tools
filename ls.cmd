@echo off

set params=%1
:getparam
shift /1
if "%1" NEQ "" (
set params=%params% %1
goto getparam
)

dir %params%
set params=



goto end
rem func here







:end