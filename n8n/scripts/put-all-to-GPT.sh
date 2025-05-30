#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="all-json-examples"
echo "📁 建立目標資料夾：$TARGET_DIR"
mkdir -p "$TARGET_DIR"

echo "📥 複製各資料夾下的 automation.json → 資料夾名稱.json"
for dir in */; do
  src="$dir/automation.json"
  if [ -f "$src" ]; then
    folder="${dir%/}"
    dst="$TARGET_DIR/${folder}.json"
    echo "  • $src → $dst"
    cp "$src" "$dst"
  fi
done

echo "📥 複製其它所有 .json → 資料夾名稱--原檔名.json"
find . -mindepth 2 -maxdepth 2 -type f -name "*.json" ! -path "./all-json-examples/*" ! -name "automation.json" | while read -r src; do
  parent=$(basename "$(dirname "$src")")
  fname=$(basename "$src")
  dst="$TARGET_DIR/${parent}--${fname}"
  echo "  • $src → $dst"
  cp "$src" "$dst"
done

echo "✅ 完成，所有 JSON 已集中到 $TARGET_DIR"
