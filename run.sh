#!/bin/bash
# 启动程序脚本

PROJECT_ROOT="$(dirname "$0")"
BINARY="$PROJECT_ROOT/build/rect_selector"

if [ ! -f "$BINARY" ]; then
    echo "[ERROR] Binary not found. Please run 'rebuild.sh' first."
    exit 1
fi

echo "[RUNNING] Starting RectSelector..."
"$BINARY"