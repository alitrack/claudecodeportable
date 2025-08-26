# Claude Code 便携版 for Windows

[![Author](https://img.shields.io/badge/Author-Steven_Lee-blue.svg)](https://github.com/alitrack)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

一个为 Windows 用户打造的开箱即用的 Claude Code 环境，无需安装 Node.js 和 Git，解压即用，极致方便。

## ✨ 特性

- **真正的便携**：所有依赖项（Node.js, Git）已打包，可存放在U盘中随处运行。
- **开箱即用**：无需配置环境变量，不污染系统。
- **网络友好**：默认配置使用国内大模型 API 代理，解决网络连接问题。
- **一键启动**：提供 `.cmd` 脚本，双击即可启动。
- **右键菜单集成**：支持在任意文件夹右键快速启动，极大提升效率。

## 🚀 快速开始

### 1. 配置 API Key

首次使用前，请先配置你的 API Key。

1.  打开根目录下的 `config.cmd` 文件。
2.  将 `set ANTHROPIC_AUTH_TOKEN=你的API_KEY放这里` 这一行中的 `你的API_KEY放这里` 替换为你自己的 API Key。

    > 本项目默认使用智谱 AI (Bigmodel) 的 API 接口。你可以在 [这里](https://open.bigmodel.cn/usercenter/proj-mgmt/apikeys) 获取你的 Key。

### 2. 启动 Claude Code

你有以下两种方式启动：

- **方法一 (直接启动)**：
  双击运行 `start_claude.cmd`。

- **方法二 (拖拽启动)**：
  将你的项目文件夹**拖拽**到 `start_claude.cmd` 图标上，Claude Code 将在该项目目录中启动。

### 3. (可选) 添加到右键菜单

为了获得最佳体验，强烈建议将 Claude Code 集成到你的 Windows 右键菜单中。

1.  **添加菜单**：双击运行 `_setup_right_click_menu.cmd`，并在弹出的确认窗口中点击“是”。
2.  **使用菜单**：现在，你可以在**任意文件夹**或**桌面空白处**点击鼠标右键，选择“在此处打开 Claude Code”来快速启动。

- **移除菜单**：如果需要，可以运行 `_remove_right_click_menu.cmd` 来清理右键菜单项。

## 📂 目录结构说明
```
ClaudeCodePortable/
├── node/ # 便携版 Node.js
├── PortableGit/ # 便携版 Git
├── config.cmd # 【重要】API Key 配置文件
├── start_claude.cmd # 主启动脚本
├── generate_reg.js # (内部脚本) 用于生成注册表文件
├── _setup_right_click_menu.cmd # (可选运行) 添加右键菜单
└── _remove_right_click_menu.cmd # (可选运行) 移除右键菜单
```

## ❓ 常见问题 (FAQ)

- **Q: 如何更新 Claude Code 到最新版本？**
- **A:** 在本目录下打开命令行，运行 `.\node\npm.cmd install -g @anthropic-ai/claude-code@latest` 即可。

## 致谢

- [Anthropic](https://www.anthropic.com/) for creating Claude Code.
- [Node.js](https://nodejs.org/)
- [Git for Windows](https://git-scm.com/downloads/win)

---