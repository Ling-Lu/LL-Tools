@echo off
set cmd=D:\Git_Projects\tools\ApkDecompile\apktool2.0.1\apktool.jar
set d2jcmd=D:\Git_Projects\tools\ApkDecompile\dex2jar\dex2jar-0.0.9.13\d2j-dex2jar.bat
set jdcmd=D:\Git_Projects\tools\ApkDecompile\jd-gui-0.3.3.windows\jd-gui.exe

set apkName=%~n1
set apkPath=Dprojects\%apkName%

echo ��ѹ��...
"bc.exe" x -o:%apkPath% -aoa %1
echo ��ѹ���
echo,

echo ��������Դ , ���Եȼ�����...
%cmd% d %1
xcopy /ey %apkName% %apkPath% >nul
rd /s /q %apkName%
rem \ ��б�ܱ�����Ҽ���ǰ�� \Dprojects apkName �����ֵ�ʱ���ܷ���
rem move /y %apkName% \Dprojects
echo ��Դ���������
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
ECHO ���뷴���뿪ʼ
call %d2jcmd% --force %dexFile%
move classes-dex2jar.jar %apkPath%
start %jdcmd% %apkPath%classes-dex2jar.jar
ECHO %apkName% ���뷴�������
echo,
if %cnt% GTR 1 echo ��# %cnt% #��dex�ļ���ֻ������Ĭ�ϵ�һ��

goto :DEX2JAVA
:SKIP_DEX2JAVA
ECHO û�д����ļ���ֻ����Դ
:DEX2JAVA

rem start /max ��󻯴�
start %apkPath%
pause
exit

EQU - ����
NEQ - ������
LSS - С��
LEQ - С�ڻ����
GTR - ����
GEQ - ���ڻ����

