@echo off
if exist 1.txt del 1.txt
set "code=A B C D E F G H I J K L N M O P Q R S T U V W X Y Z" 

for /f "delims=" %%a in ('dir /b /a-d') do (
set out=%%a
for /f "tokens=1 delims=." %%h in ("%%a") do (
set str=%%h
for %%e in (%code%) do call,set "str=%%str:%%e=%%e%%"
call echo %%a  %%str%% %%str%% PNG>>1.TXT
)
)
pause