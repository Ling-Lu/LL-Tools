@echo off
echo ~~*****************************************~~
echo  set /a �������� +-*/ ��ȫ���� 
echo     �����߼���λ ��λ����� ���""
echo  set /p ��ʾ���̸�ֵ������ =��ǰ�����пո�
echo ~~*****************************************~~

@echo off
echo set a=0x15
echo set /p p=Input a number ��
echo set /a a=%a%%%p%
echo echo %a%
set a=0x15
set /p p=Input a number ��
set /a a=%a%%%p%
echo %a%
pause

echo ~~*****************************************~~
echo      ��λ����
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
echo �ַ����滻

rem ~~*****************************************~~
rem �ַ����滻
rem set a=abcdefgaa
rem set var=%a:a=Q%  ��a�����е�a�ַ�ȫ���滻ΪQ �������� var
rem set var=%a:~1,3% ������a�ӵ�һλ��ʼ��3���ַ���������var
rem set var=%a:~-3%  ������a�ĺ�3λ�ַ���������var
rem set var=%a:~0,-3%������a�ӵ�0Ϊ��ʼ����ȥ����3λ��������var
rem ~~*****************************************~~
@echo off
set a=abcdefgaa
echo a=abcdefgaa
echo �滻����a�е��ַ�aΪQ
set var=%a:a=Q%
echo %var%
echo ��ȡ��һ���������ַ�
set var=%a:~1,3%
echo %var%
echo ��ȡ��������ַ�
set var=%a:~-3%
echo %var%
echo ��ȡ�ӵ�0λ����ȥ�����λ
set var=%a:~0,-3%
echo %var%
echo ��ȡ�ӵ�һλ��ʼ�������ַ�
set var=%a:~1%
echo %var%
pause