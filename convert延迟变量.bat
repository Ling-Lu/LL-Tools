@echo off&setlocal enabledelayedexpansion
echo   将当前目录下的所有文件分割成名字和后缀名两部分，并且全部转换为大写输出
rem   /*延迟变量开启后对变量的引用有&var&改为!var!即可*/
rem   /*变量延迟用于解决在一行语句（一对括号视为一行语句）的之中有赋值导致变量没有得到最新值的情况*/

echo ::==========================================================::
echo processing...

set pro=你们好
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