@echo off

set USER_PATH=Wuhu
set SOURCE_PATH=ToWindow
set BACKUP_PATH=..\Binary
set NEW_FOLDER=
set DOWNLOAD_PATH=..\Binary\Download

set LINUX_IP=109.130.241.18
set USER_NAME=wuhu
set USER_PWD=1234

for /f "tokens=2 delims==" %%a in ('wmic path win32_operatingsystem get LocalDateTime /value') do (  
    set t=%%a
)
set t=%t:~0,12%
set NEW_FOLDER=%t:~0,8%_%t:~-4%

echo cd /home/Projects/%USER_PATH%/%SOURCE_PATH%>script
echo dir>>script
echo get -r . %SOURCE_PATH%>>script
echo exit>>script

"psftp.exe" %USER_NAME%@%LINUX_IP% -pw %USER_PWD% -b script
if %errorlevel% neq 0 goto connect_error

if not exist %SOURCE_PATH% goto getlog_error
echo.
echo *******************************************************
echo,
mkdir %BACKUP_PATH%\%NEW_FOLDER%
xcopy  %SOURCE_PATH% %BACKUP_PATH%\%NEW_FOLDER%\ /S/E/H
xcopy  %SOURCE_PATH% %DOWNLOAD_PATH%\ /S/E/H
goto success
:connect_error
echo Failed to connect to Linux server,please check ip,user name,password.
goto complete

:getlog_error
echo Failed to get %SOURCE_PATH% from Linux.
echo please check the file path:/home/Projects/%USER_PATH%/%SOURCE_PATH%
goto complete

:success
color 97
echo Get file Success!
:complete
pause