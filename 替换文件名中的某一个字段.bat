@echo off
set name=
for /f "delims=" %%a in ('dir *Eider*.* /b /a-d-h'
)do (
for /f "tokens=1,2 delims=." %%b in ("%%a") do (
for /f "tokens=1,2,3,4* delims=_" %%e in ("%%b") do (
if "%%i" neq "" (set name=%%e_%%f_%%g_Eider_%%i.%%c) else (set name=%%e_%%f_%%g_Eider.%%c)
call  move %%a %%name%%
)
)
)
pause