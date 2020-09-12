echo off
set /p a=请拖入第一个文件并回车
for /f "tokens=*" %%i in ('dir/b %a%')do (
echo 文件路径： %%~dpi
echo 文件名：%%~nxi
)
pause

rem  需要注意使用时
echo off
set a=\a\a\a\\a\aa
for %%i in ("%a%")do (
echo 文件路径： %%~dpi
echo 文件名：%%~nxi
)

pause