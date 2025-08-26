@echo off
setlocal

echo.
echo [1/3] 准备调用 Node.js 生成注册表文件...
echo.

:: 调用 Node.js 脚本来生成 remove_claude_context.reg 文件
"%~dp0\node\node.exe" "%~dp0\generate_reg.js" remove

:: 检查 Node.js 脚本是否成功执行
if %errorlevel% neq 0 (
    echo.
    echo [错误] 生成注册表文件失败！请检查 generate_reg.js 脚本。
    echo.
    pause
    exit /b
)

echo.
echo [2/3] 注册表文件 'remove_claude_context.reg' 已成功生成！
echo.
echo [3/3] 即将自动打开该文件，请在弹出的确认窗口中点击“是”以移除菜单项。
echo.

timeout /t 2 >nul
start "" "%~dp0\remove_claude_context.reg"

endlocal
pause