echo off
set /p a=�������һ���ļ����س�
for /f "tokens=*" %%i in ('dir/b %a%')do (
echo �ļ�·���� %%~dpi
echo �ļ�����%%~nxi
)
pause

rem  ��Ҫע��ʹ��ʱ
echo off
set a=\a\a\a\\a\aa
for %%i in ("%a%")do (
echo �ļ�·���� %%~dpi
echo �ļ�����%%~nxi
)

pause