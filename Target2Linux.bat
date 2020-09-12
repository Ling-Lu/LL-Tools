@echo off

set USER_PATH=Wuhu
set TARGET_PATH=ToWindow
set PROJECT=sc6500_samsung_EiderVEDS

set LINUX_IP=109.130.241.18
set USER_NAME=wuhu
set USER_PWD=1234

set BACKUP_PATH=%CD%
CD build\%PROJECT%_builddir\img
echo >sc6500_samsung_EiderVEDS
for /f "delims=" %%a in ('dir *Eider*.* /b /a-d-h'
)do (
for /f "tokens=1,2 delims=." %%b in ("%%a") do (
for /f "tokens=1,2,3,4* delims=_" %%e in ("%%b") do (
if "%%i" neq "" (set name=%%e_%%f_%%g_Eider_%%i.%%c) else (set name=%%e_%%f_%%g_Eider.%%c)
call move %%a %%name%%
)
)
)
CD %BACKUP_PATH%

echo cd /home/Projects/%USER_PATH%/%TARGET_PATH%>script
echo lcd build\%PROJECT%_builddir\img>>script
echo ls>>script
echo put -r . .>>script
echo exit>>script

psftp.exe %USER_NAME%@%LINUX_IP% -pw %USER_PWD% -b script
if %errorlevel% neq 0 goto connect_error

goto success
:connect_error
echo Failed to connect to Linux server,please check ip,user name,password.
goto complete

:success
color 97
echo Put files Success!
:complete
pause