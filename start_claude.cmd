@echo off
setlocal

:: �趨���ڱ���
title Claude Code

:: 1. �����û�����
call "%~dp0config.cmd"

:: ��� API Key �Ƿ�������
if not defined ANTHROPIC_AUTH_TOKEN (
    echo.
    echo [����] δ�� config.cmd ���ҵ� API Key!
    echo �����޸� config.cmd �ļ���������� ANTHROPIC_AUTH_TOKEN��
    echo.
    pause
    exit /b
)

:: 2. ���ñ�Я����������
set "CLAUDE_CODE_PATH=%~dp0"
set "NODE_PATH=%CLAUDE_CODE_PATH%node"
set "CLAUDE_CODE_GIT_BASH_PATH=%CLAUDE_CODE_PATH%PortableGit\bin\bash.exe"

:: 3. ����Ƿ�ͨ����ק�ļ��з�ʽ����
if "%~1" neq "" (
    echo �����л�����Ŀ¼��: %~1
    cd /d "%~1"
)

:: 4. ִ�� Claude Code ����
echo �������� Claude Code...
"%NODE_PATH%\node.exe" "%NODE_PATH%\node_modules\@anthropic-ai\claude-code\cli.js" %*

endlocal