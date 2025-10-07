#!/bin/bash
set -e

echo "🚀 Starting build for Render.com deployment..."

# 1. 安装 Dart SDK（如果不存在）
if ! command -v dart &> /dev/null; then
    echo "📦 Installing Dart SDK..."
    DART_VERSION="latest"
    curl -fsSL "https://storage.googleapis.com/dart-archive/channels/beta/release/${DART_VERSION}/sdk/dartsdk-linux-x64-release.zip" -o dart-sdk.zip
    unzip -q dart-sdk.zip
    export PATH="$PWD/dart-sdk/bin:$PATH"
    echo "✅ Dart SDK installed"
else
    echo "✅ Dart SDK already installed"
fi

# 2. 安装 Node.js 依赖
echo "📦 Installing Node.js dependencies..."
if ! command -v pnpm &> /dev/null; then
    npm i -g corepack@latest
    corepack enable
fi
corepack install
pnpm install --frozen-lockfile
echo "✅ Node.js dependencies installed"

# 3. 获取 Dart 依赖
echo "📦 Fetching Dart dependencies..."
dart pub get
echo "✅ Dart dependencies fetched"

# 4. 构建站点
echo "🏗️  Building site..."
dart run flutter_site build --release
echo "✅ Site built"

# 5. 运行翻译构建脚本
echo "🌐 Running translation build..."
bash tool/translator/build.sh
echo "✅ Translation completed"

# 6. 复制重定向文件到构建目录
if [ -f "_redirects" ]; then
    echo "📋 Copying _redirects file..."
    cp _redirects _site/_redirects
    echo "✅ _redirects file copied"
fi

# 7. 创建 _headers 文件（对应 firebase.json 的 headers）
echo "📋 Creating _headers file..."
cat > _site/_headers << 'EOF'
# JSON files with CORS
/f/*.json
  Access-Control-Allow-Origin: *

# Static assets with cache
/**/*.avif
/**/*.jpg
/**/*.jpeg
/**/*.gif
/**/*.png
/**/*.webp
/**/*.webm
/**/*.svg
/**/*.md
/**/*.css
/**/*.js
  Cache-Control: max-age=3600
  Access-Control-Allow-Origin: *

# Images with longer cache
/assets/images/*.jpg
/assets/images/*.jpeg
/assets/images/*.png
/assets/images/*.webp
/assets/images/*.avif
  Cache-Control: max-age=604800
  Access-Control-Allow-Origin: *

# Security headers for all pages
/**
  Referrer-Policy: strict-origin-when-cross-origin
  X-Content-Type-Options: nosniff
EOF
echo "✅ _headers file created"

echo "🎉 Build completed successfully!"
echo "📁 Static files are in: _site/"
