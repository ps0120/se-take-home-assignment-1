#!/bin/bash

# 遇到错误立即退出
set -e

# Build Script
# This script contains compilation/verification steps for the CLI application

echo "Building CLI application..."

# 确保我们在项目的根目录运行 (因为脚本在 scripts/ 文件夹里)
cd "$(dirname "$0")/.."

# 步骤 1: 准备依赖 (如果有的话)
if [ -f "package.json" ]; then
  echo "Installing dependencies..."
  npm install --silent
else
  echo "No package.json found. Skipping dependencies installation."
fi

# 步骤 2: "编译"步骤 - 验证所有源代码的纯语法有效性 (Static Syntax Check)
echo "Compiling and verifying JavaScript syntax..."

for file in *.js; do
  if [ -f "$file" ]; then
    # node -c 会检查文件语法是否合法，如果遇到SyntaxError会返回非0代码并停止
    node -c "$file"
  fi
done

echo "Attempting to require modules to ensure linkages are correct..."
# 检查内部模块的引用是否正确（不会实际运行index.js）
node -e "require('./queue'); require('./botManager'); require('./orderController');"

echo "=================================="
echo "Build completed successfully."
echo "=================================="

exit 0