@echo off
setlocal enabledelayedexpansion
cd %~1
set count=1000

for /f "delims=" %%i in ('dir /b  *.jpg,*.png,*.bmp,*.jpeg,*.gif') do call:Rename "%%~i"
cd ../
 
:Rename
set /a count+=1
if /i "%~1"=="!count:~1!%~x1" goto :eof
if exist "!count:~1!%~x1" goto Rename
echo ¸ÄÃû£º%1 !count:~1!
ren "%~1" "!count:~1!%~x1"

goto :eof

