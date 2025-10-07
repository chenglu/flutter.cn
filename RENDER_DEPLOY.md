# Render.com 部署指南

本文档介绍如何将 Flutter 中文文档站点部署到 Render.com。

## 概述

Render.com 是一个现代化的云平台，支持静态站点、Web 服务和数据库等多种部署方式。相比 Firebase Hosting，Render.com 提供了更灵活的配置选项和更简单的部署流程。

## 前置条件

1. 一个 [Render.com](https://render.com) 账号
2. 项目代码已推送到 GitHub 仓库
3. 确保 `render.yaml` 配置文件在项目根目录

## 部署步骤

### 方法一：通过 Render Dashboard 部署（推荐）

1. **登录 Render.com**
   - 访问 [https://dashboard.render.com](https://dashboard.render.com)
   - 使用 GitHub 账号登录

2. **创建新的 Static Site**
   - 点击 "New +" 按钮
   - 选择 "Static Site"
   - 连接你的 GitHub 仓库（`cfug/flutter.cn`）

3. **配置构建设置**
   
   Render 会自动检测 `render.yaml` 文件，但你也可以手动配置：

   - **Name**: `flutter-cn-docs`（或你喜欢的名称）
   - **Branch**: `main`
   - **Build Command**:
     ```bash
     bash tool/build-render.sh
     ```
   - **Publish Directory**: `_site`

4. **环境变量**
   
   在 Environment 标签页添加以下环境变量：
   ```
   NODE_VERSION=22
   PRODUCTION=true
   OPTIMIZE=true
   ```

5. **高级设置**
   - **Auto-Deploy**: 启用（当 main 分支有新提交时自动部署）
   - **Pull Request Previews**: 启用（为每个 PR 创建预览环境）

6. **点击 "Create Static Site"**
   
   Render 会开始构建和部署你的站点。

### 方法二：使用 render.yaml 自动配置

如果项目根目录包含 `render.yaml` 文件，Render 会自动读取配置：

1. 在 Render Dashboard 点击 "New +" → "Blueprint"
2. 选择你的 GitHub 仓库
3. Render 会自动识别 `render.yaml` 并应用配置
4. 确认配置并点击 "Apply"

## 构建流程说明

我们的构建脚本 `tool/build-render.sh` 执行以下步骤：

1. **安装 Dart SDK** - 从 Google Cloud Storage 下载并安装
2. **安装 Node.js 依赖** - 使用 pnpm 安装项目依赖
3. **获取 Dart 依赖** - 运行 `dart pub get`
4. **构建站点** - 使用 Eleventy 生成静态文件
5. **运行翻译** - 执行翻译构建脚本
6. **配置重定向和头部** - 复制 `_redirects` 和生成 `_headers` 文件

## 自定义域名配置

### 添加自定义域名

1. 在 Render Dashboard 中，打开你的 Static Site
2. 进入 "Settings" 标签页
3. 找到 "Custom Domains" 部分
4. 点击 "Add Custom Domain"
5. 输入你的域名，例如 `docs.flutter.cn`
6. 按照 Render 的指示配置 DNS 记录

### DNS 配置示例

在你的 DNS 提供商处添加以下记录：

```
类型: CNAME
名称: docs（或 @，如果是根域名）
值: your-site.onrender.com
```

或者使用 A 记录：
```
类型: A
名称: docs（或 @）
值: <Render 提供的 IP 地址>
```

## 环境变量说明

| 变量名 | 值 | 说明 |
|--------|-----|------|
| `NODE_VERSION` | `22` | 指定 Node.js 版本 |
| `PRODUCTION` | `true` | 启用生产模式 |
| `OPTIMIZE` | `true` | 启用优化（压缩 HTML/CSS/JS） |

## PR 预览功能

Render 支持为每个 Pull Request 创建预览环境：

1. 在 Render Dashboard 的 Static Site 设置中启用 "Pull Request Previews"
2. 每次创建或更新 PR 时，Render 会自动创建一个预览 URL
3. 预览 URL 格式：`https://flutter-cn-docs-pr-<number>.onrender.com`

## 重定向配置

重定向规则在 `_redirects` 文件中定义，部署时会自动复制到 `_site/_redirects`。

格式示例：
```
/old-path /new-path 301
/docs/* /:splat 301
```

支持的占位符：
- `:splat` - 匹配路径的剩余部分
- `:placeholder` - 命名占位符

## 自定义头部

HTTP 头部在构建时生成到 `_site/_headers` 文件中。

示例：
```
/assets/**
  Cache-Control: max-age=31536000
  Access-Control-Allow-Origin: *

/**
  X-Content-Type-Options: nosniff
```

## 故障排查

### 构建失败

1. **检查构建日志**
   - 在 Render Dashboard 查看详细的构建日志
   - 查找错误信息和堆栈跟踪

2. **常见问题**：
   - Dart SDK 下载失败：检查网络连接或使用镜像
   - pnpm 安装失败：确保 Node.js 版本正确
   - 构建超时：考虑优化构建流程或升级 Render 计划

### 站点访问问题

1. **404 错误**
   - 检查 `_redirects` 文件是否正确
   - 确认文件路径大小写正确

2. **样式丢失**
   - 检查 `_headers` 文件中的 CORS 设置
   - 确认静态资源路径正确

## 性能优化

1. **启用 CDN**
   - Render 默认使用全球 CDN
   - 确保 `Cache-Control` 头部正确设置

2. **图片优化**
   - 使用 WebP 或 AVIF 格式
   - 设置适当的缓存时间（建议 7 天或更长）

3. **压缩**
   - Render 会自动 gzip 压缩文本文件
   - 确保 `OPTIMIZE=true` 以启用 HTML/CSS/JS 压缩

## 监控和分析

1. **Render 内置监控**
   - 访问量统计
   - 带宽使用情况
   - 构建历史

2. **外部分析工具**
   - 可以集成 Google Analytics
   - 添加自定义监控脚本

## 成本考虑

- **免费计划**：适合个人项目和小型网站
  - 每月 100 GB 带宽
  - 自动 SSL 证书
  - 全球 CDN

- **付费计划**：适合生产环境
  - 更高带宽配额
  - 优先构建队列
  - 更长的构建日志保留期

## 与 Firebase 的对比

| 功能 | Render.com | Firebase Hosting |
|------|------------|------------------|
| 价格 | 免费 100GB/月 | 免费 10GB/月 |
| 部署速度 | 快 | 快 |
| CDN | 全球 CDN | 全球 CDN |
| PR 预览 | ✅ 内置 | ❌ 需配置 |
| 配置方式 | YAML + _redirects | firebase.json |
| 构建环境 | 可定制 | 有限 |

## 回滚部署

如果新部署出现问题，可以快速回滚：

1. 在 Render Dashboard 打开你的 Static Site
2. 进入 "Deploys" 标签页
3. 找到之前成功的部署
4. 点击 "Redeploy" 按钮

## 进一步优化

1. **使用 Build Cache**
   - Render 自动缓存 `node_modules`
   - 可以手动缓存其他目录以加速构建

2. **分支部署**
   - 为 `staging` 分支创建单独的 Static Site
   - 实现开发、测试、生产的多环境部署

3. **Webhook 集成**
   - 配置 Deploy Hooks 用于 CI/CD 集成
   - 使用 Render API 自动化部署流程

## 支持和文档

- [Render 官方文档](https://render.com/docs)
- [Static Sites 指南](https://render.com/docs/static-sites)
- [社区论坛](https://community.render.com/)

## 总结

Render.com 提供了一个简单、强大且经济的方式来部署 Flutter 中文文档站点。通过本指南，你应该能够：

- ✅ 成功部署站点到 Render.com
- ✅ 配置自定义域名和 SSL
- ✅ 设置 PR 预览环境
- ✅ 优化性能和监控站点
- ✅ 在需要时快速回滚部署

如有问题，请参考 Render 官方文档或在项目中提 Issue。
