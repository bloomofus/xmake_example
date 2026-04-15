#!/bin/bash
# 清除构建缓存

echo "=== Cleaning... ==="

if [ -d "build" ]; then
    rm -rf build
    echo "[OK] Removed build/"
else
    echo "[WARN] No build directory found."
fi

echo "[DONE] Cleanup complete!"