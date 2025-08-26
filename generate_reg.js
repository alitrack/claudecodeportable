const fs = require('fs');
const path = require('path');

// 获取当前脚本所在的目录，也就是我们的懒人包根目录
const basePath = __dirname;
// 将单斜杠替换为注册表需要的双反斜杠
const escapedBasePath = basePath.replace(/\\/g, '\\\\');

// 定义要生成的两种注册表文件的内容
const regFiles = {
  'add_claude_context.reg': `Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\\Directory\\Background\\shell\\OpenWithClaude]
@="在此处打开 Claude Code"
"Icon"="${escapedBasePath}\\\\claude.ico"

[HKEY_CLASSES_ROOT\\Directory\\Background\\shell\\OpenWithClaude\\command]
@="cmd.exe /c \\"cd /d \\"%V\\" && start \\"Claude Code\\" \\"${escapedBasePath}\\\\start_claude.cmd\\"\\""

[HKEY_CLASSES_ROOT\\Directory\\shell\\OpenWithClaude]
@="在此处打开 Claude Code"
"Icon"="${escapedBasePath}\\\\claude.ico"

[HKEY_CLASSES_ROOT\\Directory\\shell\\OpenWithClaude\\command]
@="cmd.exe /c \\"cd /d \\"%1\\" && start \\"Claude Code\\" \\"${escapedBasePath}\\\\start_claude.cmd\\"\\""
`,
  'remove_claude_context.reg': `Windows Registry Editor Version 5.00

[-HKEY_CLASSES_ROOT\\Directory\\Background\\shell\\OpenWithClaude]

[-HKEY_CLASSES_ROOT\\Directory\\shell\\OpenWithClaude]
`
};

const action = process.argv[2]; // 获取命令行的第三个参数 (add 或 remove)

if (!action || !regFiles[`${action}_claude_context.reg`]) {
  console.error('Usage: node generate_reg.js <add|remove>');
  process.exit(1);
}

const fileName = `${action}_claude_context.reg`;
const fileContent = regFiles[fileName];
const filePath = path.join(basePath, fileName);

try {
  // 使用 'utf16le' 编码写入文件，这至关重要！
  fs.writeFileSync(filePath, "\uFEFF" + fileContent, { encoding: 'utf16le' });
  console.log(`Successfully generated: ${fileName}`);
  console.log('File is located at:', filePath);
  
  // 返回成功码，以便批处理脚本知道可以继续
  process.exit(0); 

} catch (error) {
  console.error(`Failed to generate ${fileName}:`, error);
  // 返回失败码
  process.exit(1); 
}