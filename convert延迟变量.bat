@echo off&setlocal enabledelayedexpansion
echo   ����ǰĿ¼�µ������ļ��ָ�����ֺͺ�׺�������֣�����ȫ��ת��Ϊ��д���
rem   /*�ӳٱ���������Ա�����������&var&��Ϊ!var!����*/
rem   /*�����ӳ����ڽ����һ����䣨һ��������Ϊһ����䣩��֮���и�ֵ���±���û�еõ�����ֵ�����*/

echo ::==========================================================::
echo processing...

set pro=���Ǻ�
echo %pro%

set code=A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
if exist output.txt del output.txt
for /f "delims=" %%a in ('dir /b /a-d-h'
)do (
set fullname=%%a
for /f "tokens=1,2 delims=." %%e in ("!fullname!") do (
set name=%%e
for %%i in (%code%) do set "name=!name:%%i=%%i!"
set sufix=%%f
for %%i in (%code%) do set "sufix=!sufix:%%i=%%i!"
echo %%a  !name!  !name!  !sufix!>>output.txt
)
)
echo $$$$$$$$$$$$ ~~ Complete ~~ $$$$$$$$$$$$$
pause