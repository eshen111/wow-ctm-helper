# CTM 私服助手 — 部署与云同步指南

## 一、GitHub Pages 部署（免费托管）

### 前提
- 有一个 GitHub 账号 (https://github.com)
- 安装了 Git (你电脑已有)

### 步骤

```bash
# 1. 在 GitHub 上创建新仓库
#    访问 https://github.com/new
#    仓库名: wow-ctm-helper (任意)
#    选 Private (私有仓库，别人看不到)
#    不要勾选任何初始化选项

# 2. 在本地初始化并推送
cd /Users/zhangbaowei3/Documents/Codex/2026-06-11/codex-codex
git init
git add dist/
git commit -m "初始部署"
git remote add origin https://github.com/你的用户名/wow-ctm-helper.git
git push -u origin main

# 3. 启用 GitHub Pages
#    进入仓库 → Settings → Pages
#    Source 选 "Deploy from a branch"
#    Branch 选 main, /dist 目录
#    点击 Save
#    等 1-2 分钟，就会显示你的网站链接
```

> **你的网站链接**: `https://你的用户名.github.io/wow-ctm-helper`

---

## 二、Supabase 云数据库（跨设备实时同步）

### 前提
- 一个 Supabase 账号 (https://supabase.com)

### 步骤

**1. 创建 Supabase 项目**

- 访问 https://supabase.com 注册/登录
- 点击 "New project"
- 填写项目名称 (如 "wow-ctm-helper")
- 设置数据库密码 (保存好!)
- 选择区域 (选香港或新加坡，国内速度快)
- 点击 "Create new project" (等 1-2 分钟创建)

**2. 创建数据库表**

- 进入项目 → SQL Editor
- 点击 "New query"
- 粘贴 `database.sql` 的内容
- 点击 "Run"
- 表创建成功

**3. 开启实时订阅**

- 进入项目 → Database → Replication
- 找到 `app_data` 表
- 开启 INSERT / UPDATE / DELETE 的开关
- 点击 "Enable"

**4. 获取 API 密钥**

- 进入项目 → Settings → API
- 复制 Project URL (形如 `https://xxxxx.supabase.co`)
- 复制 anon public key (形如 `eyJ...`)
- 打开 `index.html`
- 找到开头的 `SUPABASE_URL` 和 `SUPABASE_ANON_KEY`，填入这两个值

**5. 重新部署**

```bash
git add dist/
git commit -m "添加 Supabase 云同步配置"
git push
```

GitHub Pages 会自动更新，约 1-2 分钟后生效。

---

## 三、验证同步

- 在电脑 A 打开网站，添加一条数据
- 在电脑 B（或手机浏览器）打开同一个链接
- 刷新或等待几秒，数据会自动同步过来
- 同步是实时的——一台设备修改，另一台自动更新

> **注意**: 如果配置了 Supabase 但无法连接，网站会自动降级到本地存储模式（localStorage），数据保存在当前浏览器中，不会丢失。
