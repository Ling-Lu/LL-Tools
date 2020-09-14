@echo off

set str=100x200x300y400y500x600y700

for /f "tokens=1,3-5,* delims=xy" %%a in ("%str%") do (
	set c1=%%a
	set c3=%%b
	set c4=%%c
	set c5=%%d
	set c6=%%e

)

echo %c1%, %c3%, %c4%, %c5%,%c6%

pause
