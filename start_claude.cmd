@echo off
setlocal

:: 设定窗口标题
title Claude Code

:: 1. 加载用户配置
call "%~dp0config.cmd"

:: 检查 API Key 是否已配置
if not defined ANTHROPIC_AUTH_TOKEN (
    echo.
    echo [错误] 未在 config.cmd 中找到 API Key!
    echo 请先修改 config.cmd 文件，填入你的 ANTHROPIC_AUTH_TOKEN。
    echo.
    pause
    exit /b
)

:: 2. 设置便携化环境变量
set "CLAUDE_CODE_PATH=%~dp0"
set "NODE_PATH=%CLAUDE_CODE_PATH%node"
set "CLAUDE_CODE_GIT_BASH_PATH=%CLAUDE_CODE_PATH%PortableGit\bin\bash.exe"

:: 3. 检查是否通过拖拽文件夹方式启动
if "%~1" neq "" (
    echo 正在切换工作目录到: %~1
    cd /d "%~1"
)

:: 4. 执行 Claude Code 命令
echo 正在启动 Claude Code...
"%NODE_PATH%\node.exe" "%NODE_PATH%\node_modules\@anthropic-ai\claude-code\cli.js" %*

endlocal