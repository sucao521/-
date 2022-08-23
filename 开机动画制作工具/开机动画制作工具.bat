@echo off
color 0b
title 开机动画制作工具 diy
:munu
cls
echo ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
echo                             一键制作开机动画工具
echo ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
echo                             1.制作并替换开机动画
echo.
echo                             2.文件放错了吗？重来
echo.
echo                             3.初始化工具状态
echo.                            
echo                             0.返回主页面
echo.
echo                            
echo.
echo ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
echo **************************************************
set /p choice=     请选择：
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
echo 按任意键返回主目录
pause>nul 2>&1
goto munu


:S1
cls
title 开机动画制作工具 diy
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
echo 按任意键返回主目录
pause>nul 2>&1
goto munu
:C2
title 开机动画制作工具 diy
cls
move bin\bootanimation\part0\*.* in\1tp\ >nul 2>&1
move bin\bootanimation\part1\*.* in\2tp\ >nul 2>&1


echo 按任意键返回主目录
pause >nul 2>&1
goto munu
:Q3
cls
echo.
goto munu
