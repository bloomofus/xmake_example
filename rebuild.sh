#!/bin/bash
# 清除旧构建并重新编译

echo "=== Rebuilding RectSelector Project ==="

if [ -d "build" ]; then
    echo "[INFO] Cleaning previous build directory..."
    rm -rf build
fi

mkdir -p build
cd build

echo "[INFO] Running cmake..."
cmake .. 

echo "[INFO] Compiling..."
make

echo "[SUCCESS] Build completed!"
echo ""
echo "To run: ./build/rect_selector"