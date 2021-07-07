@echo off
echo.
echo ===========Test pieces==================

call :colorStr nihao 2
call :colorStr nihao 1 f5

:done
echo =====================================
echo,
goto end

rem funtions here





rem comment following***********************************************************************************************************

:: function manual ,demo
rem 退出函数两个方法：1. goto :eof 2. exit /b 0 (带返回值%errolevel% 退出）
rem It means the function end,and in the main function it will make the program exit

rem 函数返回值两个方法带回 https://www.icode9.com/content-4-360767.html
rem 函数返回值.bat
set returnValue=9
echo %returnValue%
call :funcdemo returnValue
echo returned %returnValue%
echo errolevel %errolevel%
:funcdemo
set %~1=0
exit /b 99
goto :eof


:: func(count the lines) two methods here---------------------------------------------------------
set /a cnt=0
for /f "delims=" %%i in ('adb devices'
)do (
echo %%i
call set /a cnt=%%cnt%%+1
)
echo count %cnt%

set /a cnt=0
for /f "delims=" %%i in ('adb devices'
)do (
echo %%i
call :count
)
echo count %cnt%

goto done

:count 
set /a cnt=%cnt%+1
goto :eof
::done

:: func(change word color) two methods here--------------------------------------------------------------------------------

set msg="sameplestring"
echo. >%msg%&findstr /a:a .* %msg%*&del /q %msg%
rem 两个等效，但是下边这个不会换行
rem set /p= <nul>%msg%&findstr /a:a .* %msg%*&del /q %msg%

::理解： ，前一个退格游标回退，之后空格补位替换，后一个退格回退游标
::理解：.* 表示任何字符
::理解：%msg%*后边的*必须带，否则没有颜色，/a 颜色属性作用在找到文件的文件名上
::理解：findstr 在文件列表里查找字符串，并且给文件列表的文件名赋给颜色高亮
set msg=sameplestring!
echo %msg%
echo. >%msg%&findstr /a:a .* %msg%*&del /q %msg%
set /p= <nul>%msg%&findstr /a:a .* %msg%*&del /q %msg%
for /f "delims=" %%i in ('echo. ^>%msg%^& findstr /a:d .* %msg%* ^& del /q %msg%')do (
 echo.%%i
)
::func sameple
for /f "delims= " %%i in ("abc abd abe") do (
call :colorStr %%i 1
echo suffix
)

:colorStr
set msg=%1
set colorMod=%2
set color=%3
if "" equ "%color%" set color=0c
echo %msg% %colorMod%
if "" equ "%msg%" goto :eof
if "%colorMod%" equ "1" (
set /p= <nul>%msg%&findstr /a:%color% .* %msg%*&del /q %msg%
) else (
echo. >%msg%&findstr /a:%color% .* %msg%*&del /q %msg%
)
goto :eof
::func(color string)

@echo [4;1;5;7;8;46m nihao [0m
字背景颜色范围:40----49 
40:黑 
41:深红 
42:绿 
43:黄色 
44:蓝色 
45:紫色 
46:深绿 测试为浅蓝色
47:白色
字颜色:30-----------39 
30:黑 
31:红 
32:绿 
33:黄 
34:蓝色 
35:紫色 
36:深绿 测试为浅蓝色
37:白色
[0m 关闭所有属性 
[1m 设置高亮度 
[4m 下划线 
[5m 闪烁 
[7m 反显 
[8m 消隐 不知道啥效果
[30m -- \33[37m 设置前景色 
[40m -- \33[47m 设置背景色 
:: func(get random number(1-100)) two methods here-------------------------------------------------------------------------
set /a RandomNumber=%random%%%100+1
echo RandomNumber = %RandomNumber%
set /a RandomNumber=%random:~0,2%+1
echo RandomNumber = %RandomNumber%

:: func(cnd the length of the string)---------------------------------------------------------------------
set str=123456789你好adbdef
set cnt=0
:cntCharacter
call set character=%%str:~%cnt%,1%%
if "" neq "%character%" (
set /a cnt+=1
goto cntCharacter
)
echo charater number = %cnt%

rem comment done****************************************************************************************************************


:end