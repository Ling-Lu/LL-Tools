rem ����ǰĿ¼�µ������ļ��ָ�����ֺͺ�׺�������֣�����ȫ��ת��Ϊ��д���
@echo off
echo ::==========================================================::
echo processing...
set code=A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
if exist output.txt del output.txt
for /f "delims=" %%a in ('dir /b /a-d-h'
)do (
for /f "tokens=1,2 delims=." %%e in ("%%a") do (
set name=%%e
for %%i in (%code%) do call,set "name=%%name:%%i=%%i%%"
set sufix=%%f
for %%i in (%code%) do call,set "sufix=%%sufix:%%i=%%i%%"
call echo %%a  %%name%%  %%name%%  %%sufix%%>>output.txt
)
)
echo !!!!!!!!!!!!!!Complete!!!!!!!!!!!!!!
pause