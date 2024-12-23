@echo off
@chcp 65001 >nul

:: 检查是否安装了 Git
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [错误] 未检测到 Git，请先安装 Git.
    pause
    exit /b
)

:: 提示用户操作
cls
echo 将要更新 lua 库到最新版本
echo.
echo 警告: 对 lua 库的所有更改都会被覆盖
echo.
echo [y] 确认 / [n] 取消
set "input=y"
set /p input=请输入: [默认为y] 

:: 判断用户输入
echo.
if /i "%input%"=="n" (
    echo 更新已取消.
    pause
    exit /b
)

if not "%input%"=="y" (
    echo 未识别的输入, 默认继续.
)

:: 强行拉取远程分支并覆盖本地所有更改
echo 正在更新 lua 库...
git clean -fd
git reset --hard
git fetch --all
git reset --hard origin/main

:: 提示完成
echo 更新完成.
pause