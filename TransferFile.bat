@echo off
set user=wuhu
rem =�ź����пո�Ҳ�ᱻ�������ڸ�ֵ��user
set host=109.130.246.247
set password=wuhu
set direction=999
set wrgCnt=0
:start
echo select your direction
echo 1:Linux-^>Windows 
echo 2:Windows-^>Linux 
rem ȡ��ת���ַ�����������ת���ַ���ת�����ùر�
set /p direction=:
rem =�ź��������>���� �����ӡ����� ������ʾ��ʾ�ַ�
rem =��ǰ�治���пո�
if %direction% == 1 (
:again
set /p linux_path= input linux path :
set /p local_path= input local path :
call echo %user%@%host%:%%linux_path%% %%local_path%%
call start /wait pscp %user%@%host%:%%linux_path%% %%local_path%%
rem %cd% ��ʾ��ǰĿ¼
set a=1
set  linux_path=
set  local_path=
set /p a="press enter to continue and input E to exit:"
if "%a%" == "e" exit
goto again
)else if %direction% == 2 (
:again2
set /p linux_path= input linux path :
set /p local_path= input local path :
call echo %%local_path%% %user%@%host%:%%linux_path%%
call start /wait pscp %%local_path%% %user%@%host%:%%linux_path%%
set a=1
set  linux_path=
set  local_path=
set /p a=press enter to continue and input E to exit:
if "%a%" == "e" exit
goto again2
)else (
set /a wrgCnt = wrgCnt+1
rem echo %wrgCnt% ��������if ��ѭ�����ڸı���߶����ʱ�� ���������Ч
rem ��Ҫ����ķ�ʽ
rem echo "%wrgCnt%" �������������
call echo %%wrgCnt%% �������������
rem ��������������Ϻ��߶�һ��˫����
if "%wrgCnt%" == "9" (
rem ����жϱ���Ҫ��˫���Ż�����
echo you are a bad man !
pause
exit
)else (
echo =====================================
echo invalid parameter input again
echo following below please
echo         ::********::
goto start
)
)
rem else ��������пո�ǰ�����û�У� if ������(֮ǰ�����пո�
pause