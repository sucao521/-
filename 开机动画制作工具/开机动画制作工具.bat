@echo off
color 0b
title ���������������� diy
:munu
cls
echo ��������������������������������������������������������������������������������
echo                             һ������������������
echo ��������������������������������������������������������������������������������
echo                             1.�������滻��������
echo.
echo                             2.�ļ��Ŵ���������
echo.
echo                             3.��ʼ������״̬
echo.                            
echo                             0.������ҳ��
echo.
echo                            
echo.
echo ��������������������������������������������������������������������������������
echo **************************************************
set /p choice=     ��ѡ��
if not "%choice%"=="" set choice=%choice:~0,1%
if /i "%choice%"=="1" goto S1
if /i "%choice%"=="2" goto C2
if /i "%choice%"=="3" goto A4
if /i "%choice%"=="0" goto Q3




echo.
:A4
del bin\bootanimation\part0\*.*  /q /f 
del bin\bootanimation\part1\*.*  /q /f 
del in\1tp\*.*  /q /f 
del in\2tp\*.*  /q /f 
XCOPY /y  "bin\bootanimation.zip" "bin\bootanimation\bootanimation.zip" >nul 2>&1
echo �������������Ŀ¼
pause>nul 2>&1
goto munu


:S1
cls
title ���������������� diy
echo.

for %%A in (in\1tp) do (
	call bin\rname1.bat %%A
)

for %%A in (in\2tp) do (
	call bin\rname2.bat %%A
)
move in\1tp\*.* bin\bootanimation\part0\ >nul 2>&1
move in\2tp\*.* bin\bootanimation\part1\ >nul 2>&1
cd bin\bootanimation
..\aapt  r  bootanimation.zip part0/*.* part1/*.* >nul 2>&1
..\aapt  a  bootanimation.zip part0/*.* part1/*.*  >nul 2>&1
XCOPY  /y  bootanimation.zip ..\..\out
echo �������������Ŀ¼
pause>nul 2>&1
goto munu
:C2
title ���������������� diy
cls
move bin\bootanimation\part0\*.* in\1tp\ >nul 2>&1
move bin\bootanimation\part1\*.* in\2tp\ >nul 2>&1


echo �������������Ŀ¼
pause >nul 2>&1
goto munu
:Q3
cls
echo.
goto munu
