@echo off
echo ~~*****************************************~~
echo  set /a 算术运算 +-*/ 完全不变 
echo     其他逻辑移位 按位运算等 需加""
echo  set /p 提示键盘赋值给变量 =号前不能有空格
echo ~~*****************************************~~

@echo off
echo set a=0x15
echo set /p p=Input a number ：
echo set /a a=%a%%%p%
echo echo %a%
set a=0x15
set /p p=Input a number ：
set /a a=%a%%%p%
echo %a%
pause

echo ~~*****************************************~~
echo      按位运算
@echo off
echo set /a var= 3"&"1
set /a var= 3"&"1
echo %var%

echo set /a var= 1"|"2
set /a var= 1"|"2
echo %var%

echo set /a var= 1"^"1
set /a var= 1"^"1
echo %var%

echo set /a var"&="3
set /p var=input value of var:
set /a var"&="3
echo %var%
pause
cls




echo ~~*****************************************~~
echo 字符串替换

rem ~~*****************************************~~
rem 字符串替换
rem set a=abcdefgaa
rem set var=%a:a=Q%  将a变量中的a字符全部替换为Q 赋给变量 var
rem set var=%a:~1,3% 将变量a从第一位开始的3个字符赋给变量var
rem set var=%a:~-3%  将变量a的后3位字符赋给变量var
rem set var=%a:~0,-3%将变量a从第0为开始到减去倒数3位赋给变量var
rem ~~*****************************************~~
@echo off
set a=abcdefgaa
echo a=abcdefgaa
echo 替换变量a中的字符a为Q
set var=%a:a=Q%
echo %var%
echo 获取第一到第三个字符
set var=%a:~1,3%
echo %var%
echo 获取最后三个字符
set var=%a:~-3%
echo %var%
echo 获取从第0位到减去最后三位
set var=%a:~0,-3%
echo %var%
echo 获取从第一位开始到最后的字符
set var=%a:~1%
echo %var%
pause