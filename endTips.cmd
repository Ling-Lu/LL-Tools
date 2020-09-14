@echo off

set str=%~1
set mod=%2
set tip=%3
if "%tip%" EQU "" set tip==

set cnt=0
:cntCharacter
call set character=%%str:~%cnt%,1%%
if "" neq "%character%" (
set /a cnt+=1
goto cntCharacter
)

set endTips=
for /l %%i in (1,1,%cnt%) do ( 
    call set endTips=%%endTips%%%tip%
)
if "%mod%" neq "1" (
    echo %endTips%
)
goto :eof