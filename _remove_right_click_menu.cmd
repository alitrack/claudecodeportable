@echo off
setlocal

echo.
echo [1/3] ׼������ Node.js ����ע����ļ�...
echo.

:: ���� Node.js �ű������� remove_claude_context.reg �ļ�
"%~dp0\node\node.exe" "%~dp0\generate_reg.js" remove

:: ��� Node.js �ű��Ƿ�ɹ�ִ��
if %errorlevel% neq 0 (
    echo.
    echo [����] ����ע����ļ�ʧ�ܣ����� generate_reg.js �ű���
    echo.
    pause
    exit /b
)

echo.
echo [2/3] ע����ļ� 'remove_claude_context.reg' �ѳɹ����ɣ�
echo.
echo [3/3] �����Զ��򿪸��ļ������ڵ�����ȷ�ϴ����е�����ǡ����Ƴ��˵��
echo.

timeout /t 2 >nul
start "" "%~dp0\remove_claude_context.reg"

endlocal
pause