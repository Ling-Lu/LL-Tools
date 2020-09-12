@echo off
set user=wuhu
rem =号后面有空格也会被计算在内赋值给user
set host=109.130.246.247
set password=wuhu
set direction=999
set wrgCnt=0
:start
echo select your direction
echo 1:Linux-^>Windows 
echo 2:Windows-^>Linux 
rem 取消转义字符，即将所有转义字符的转义作用关闭
set /p direction=:
rem =号后面如果有>符号 则必须加“”号 否则不显示提示字符
rem =号前面不能有空格
if %direction% == 1 (
:again
set /p linux_path= input linux path :
set /p local_path= input local path :
call echo %user%@%host%:%%linux_path%% %%local_path%%
call start /wait pscp %user%@%host%:%%linux_path%% %%local_path%%
rem %cd% 表示当前目录
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
rem echo %wrgCnt% 当变量在if 或循环体内改变或者定义的时候 这种输出无效
rem 需要下面的方式
rem echo "%wrgCnt%" 输出输入错误次数
call echo %%wrgCnt%% 输出输入错误次数
rem 以上两种在输出上后者多一对双引号
if "%wrgCnt%" == "9" (
rem 这个判断必须要有双引号或单引号
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
rem else 后面必须有空格前面可以没有， if 条件后(之前必须有空格
pause