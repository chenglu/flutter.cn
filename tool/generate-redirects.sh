#!/bin/bash
# 从 firebase.json 生成 _redirects 文件
# 这个脚本会读取 firebase.json 中的重定向规则并转换为 Render.com 的 _redirects 格式

set -e

echo "🔄 Converting firebase.json redirects to _redirects format..."

# 检查是否安装了 jq
if ! command -v jq &> /dev/null; then
    echo "❌ Error: jq is required but not installed."
    echo "Please install jq: https://stedolan.github.io/jq/download/"
    exit 1
fi

# 读取 firebase.json
FIREBASE_JSON="firebase.json"
OUTPUT_FILE="_redirects"

if [ ! -f "$FIREBASE_JSON" ]; then
    echo "❌ Error: firebase.json not found"
    exit 1
fi

# 创建临时文件
TEMP_FILE=$(mktemp)

# 添加文件头部注释
cat > "$OUTPUT_FILE" << 'EOF'
# Render.com Redirects Configuration
# Auto-generated from firebase.json
# Format: <source> <destination> <status_code>
# Supported placeholders: :splat (matches rest of path)

EOF

# 处理 regex redirects
echo "# Regex-based redirects" >> "$OUTPUT_FILE"
jq -r '.hosting.redirects[] | select(.regex) | "\(.regex) \(.destination) \(.type)"' "$FIREBASE_JSON" | while read -r line; do
    # 将 Firebase regex 格式转换为 _redirects 格式
    # 例如: ^\/flutter(\/.*)?  ->  /flutter/*
    source=$(echo "$line" | awk '{print $1}')
    dest=$(echo "$line" | awk '{print $2}')
    code=$(echo "$line" | awk '{print $3}')
    
    # 简单的转换规则（可能需要手动调整复杂的 regex）
    source_clean=$(echo "$source" | sed 's/\^//g' | sed 's/\$//g' | sed 's/\\//g' | sed 's/(.*)?/*/')
    dest_clean=$(echo "$dest" | sed 's/:1/:splat/g')
    
    echo "$source_clean $dest_clean $code" >> "$OUTPUT_FILE"
done

echo "" >> "$OUTPUT_FILE"

# 处理 source-based redirects
echo "# Path-based redirects" >> "$OUTPUT_FILE"
jq -r '.hosting.redirects[] | select(.source) | "\(.source) \(.destination) \(.type)"' "$FIREBASE_JSON" | while read -r line; do
    # 将 :rest* 转换为 :splat
    source=$(echo "$line" | awk '{print $1}')
    dest=$(echo "$line" | awk '{print $2}')
    code=$(echo "$line" | awk '{print $3}')
    
    source_clean=$(echo "$source" | sed 's/:rest\*/:splat/g')
    dest_clean=$(echo "$dest" | sed 's/:rest\*/:splat/g')
    
    echo "$source_clean $dest_clean $code" >> "$OUTPUT_FILE"
done

echo "" >> "$OUTPUT_FILE"

# 添加默认的 SPA fallback（用于 clean URLs）
cat >> "$OUTPUT_FILE" << 'EOF'
# SPA fallback for clean URLs
/*    /index.html   200
EOF

echo "✅ _redirects file generated successfully!"
echo "📄 Output: $OUTPUT_FILE"
echo ""
echo "⚠️  Note: Some complex regex patterns may need manual adjustment."
echo "Please review the file before deploying."
