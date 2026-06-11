#!/bin/bash
# ===== CTM 私服助手 - 一键部署脚本 =====
# 使用前请先完成：
#   1. 访问 https://github.com/new
#   2. 仓库名: wow-ctm-helper（大小写一致）
#   3. 选 Private（私有）
#   4. 不要勾选任何初始化选项
#   5. 点击 "Create repository"

# 配置：替换为你的 GitHub 用户名
GITHUB_USER="eshen111"
REPO_NAME="wow-ctm-helper"

echo "=== 正在部署 CTM 私服助手到 GitHub Pages ==="

# 初始化 git 仓库
cd "$(dirname "$0")"
git init

# 添加并提交文件
git add index.html database.sql SETUP.md
git commit -m "初始部署：CTM私服助手"

# 添加远程仓库并推送
git remote add origin "https://github.com/$GITHUB_USER/$REPO_NAME.git"
echo ""
echo "即将推送到 https://github.com/$GITHUB_USER/$REPO_NAME"
echo "请在弹出的窗口中输入你的 GitHub 账号密码（或个人访问令牌）"
echo ""
git push -u origin main

echo ""
echo "=== 推送完成！==="
echo "接下来请手动启用 GitHub Pages："
echo "1. 访问 https://github.com/$GITHUB_USER/$REPO_NAME/settings/pages"
echo "2. Source 选 Deploy from a branch"
echo "3. Branch 选 main, / (root) 目录"
echo "4. 点击 Save"
echo "5. 等 1-2 分钟后，你的网站就上线了！"
echo ""
echo "你的网站链接: https://$GITHUB_USER.github.io/$REPO_NAME"
