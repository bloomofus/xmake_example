#!/bin/bash
# 清除旧构建并重新编译

echo "=== Rebuilding RectSelector Project ==="

rm -rf build
mkdir -p build

cd build

echo "[INFO] Running cmake..."
cmake .. 

echo "[INFO] Compiling..."
make

echo "[SUCCESS] Build completed!"
echo ""
echo "To run: ./build/main"