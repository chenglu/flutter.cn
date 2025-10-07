# Render.com 部署快速开始

本项目支持通过 Render.com 进行静态站点部署。

## 快速部署

### 一键部署到 Render

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy?repo=https://github.com/cfug/flutter.cn)

### 手动部署步骤

1. **登录 Render.com**
   - 访问 [https://dashboard.render.com](https://dashboard.render.com)
   - 使用 GitHub 账号登录

2. **创建新的 Static Site**
   - 点击 "New +" → "Static Site"
   - 选择 `cfug/flutter.cn` 仓库
   - 或使用 "Blueprint" 自动读取 `render.yaml` 配置

3. **等待构建完成**
   - Render 会自动执行 `tool/build-render.sh` 构建脚本
   - 首次构建约需 5-10 分钟

4. **访问你的站点**
   - 构建成功后，Render 会提供一个 `.onrender.com` 域名
   - 可在 Settings 中配置自定义域名

## 本地测试构建

在推送到 GitHub 之前，可以本地测试构建脚本：

```bash
# 赋予执行权限（仅首次）
chmod +x tool/build-render.sh

# 执行构建
bash tool/build-render.sh

# 本地预览（可选）
cd _site
python -m http.server 8000
# 访问 http://localhost:8000
```

## 配置文件说明

- **`render.yaml`** - Render.com 的服务配置文件
- **`_redirects`** - URL 重定向规则
- **`tool/build-render.sh`** - 构建脚本
- **`RENDER_DEPLOY.md`** - 详细的部署文档

## 环境要求

Render.com 构建环境：
- Ubuntu Linux
- Node.js 22.x
- 自动安装 Dart SDK（通过构建脚本）
- 支持 pnpm

## 功能特性

✅ **自动部署** - push 到 main 分支自动触发部署  
✅ **PR 预览** - 每个 Pull Request 自动创建预览环境  
✅ **免费 SSL** - 自动配置 HTTPS 证书  
✅ **全球 CDN** - 内置 CDN 加速访问  
✅ **构建缓存** - 加速后续构建  

## 常见问题

### 构建失败？

1. 检查构建日志中的错误信息
2. 确认所有依赖文件都已提交到仓库
3. 验证 `tool/build-render.sh` 脚本可执行

### 重定向不工作？

1. 检查 `_redirects` 文件格式
2. 确认文件已复制到 `_site` 目录
3. 查看 Render Dashboard 的部署日志

### 如何配置自定义域名？

详见 [RENDER_DEPLOY.md](./RENDER_DEPLOY.md) 中的"自定义域名配置"章节。

## 更多帮助

- 📖 [完整部署文档](./RENDER_DEPLOY.md)
- 🌐 [Render 官方文档](https://render.com/docs/static-sites)
- 💬 [提交 Issue](https://github.com/cfug/flutter.cn/issues)

---

**提示**：如果你更熟悉 Firebase Hosting，项目仍然完全支持 Firebase 部署。两种部署方式可以同时使用。
