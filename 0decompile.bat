@echo off
set cmd=D:\Git_Projects\tools\ApkDecompile\apktool2.0.1\apktool.jar
set d2jcmd=D:\Git_Projects\tools\ApkDecompile\dex2jar\dex2jar-0.0.9.13\d2j-dex2jar.bat
set jdcmd=D:\Git_Projects\tools\ApkDecompile\jd-gui-0.3.3.windows\jd-gui.exe

set apkName=%~n1
set apkPath=Dprojects\%apkName%

echo 解压中...
"bc.exe" x -o:%apkPath% -aoa %1
echo 解压完成
echo,

echo 反编译资源 , 请稍等几分钟...
%cmd% d %1
xcopy /ey %apkName% %apkPath% >nul
rd /s /q %apkName%
rem \ 反斜杠必须加且加在前边 \Dprojects apkName 是数字的时候不能访问
rem move /y %apkName% \Dprojects
echo 资源反编译完成
echo,

for /f "delims=" %%a in ("%apkPath%\classes.dex"
) do (
set dexFile=%%~fa
)
for /f "delims=" %%a in ("%dexFile%"
) do (
set apkPath=%%~dpa
)
for /f "delims=" %%a in ("%d2jcmd%"
) do (
set cmdDisk=%%~da
set cmdPath=%%~pa
)

set cnt=0
for /f "delims=" %%a in ('dir /a /b %apkPath%classes*.dex'
) do (
set /a cnt+=1
)

if not exist %dexFile% goto :SKIP_DEX2JAVA
%cmdDisk%
cd %cmdPath%
ECHO 代码反编译开始
call %d2jcmd% --force %dexFile%
move classes-dex2jar.jar %apkPath%
start %jdcmd% %apkPath%classes-dex2jar.jar
ECHO %apkName% 代码反编译完成
echo,
if %cnt% GTR 1 echo 有# %cnt% #个dex文件，只反编译默认的一个

goto :DEX2JAVA
:SKIP_DEX2JAVA
ECHO 没有代码文件，只有资源
:DEX2JAVA

rem start /max 最大化打开
start %apkPath%
pause
exit

EQU - 等于
NEQ - 不等于
LSS - 小于
LEQ - 小于或等于
GTR - 大于
GEQ - 大于或等于

