@echo off
@chcp 936 >nul

:: ����Ƿ�װ�� Git
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [����] δ��⵽ Git�����Ȱ�װ Git.
    pause
    exit /b
)

:: ��ʾ�û�����
cls
echo ��Ҫ���� lua �⵽���°汾
echo.
echo ����: �� lua ������и��Ķ��ᱻ����
echo.
echo [y] ȷ�� / [n] ȡ��
set "input=y"
set /p input=������: [ֱ�ӻس�, Ĭ��Ϊy] 

:: �ж��û�����
echo.
if /i "%input%"=="n" (
    echo ������ȡ��.
    pause
    exit /b
)

if not "%input%"=="y" (
    echo δʶ�������, ������ȡ��.
    pause
    exit /b
)

:: ǿ����ȡԶ�̷�֧�����Ǳ������и���
echo ���ڸ��� lua ��...
git clean -fd
git reset --hard
git fetch --all
git reset --hard origin/main

:: ��ʾ���
echo �������.
pause