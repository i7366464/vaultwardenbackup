#!/bin/bash
# 自动打包网站目录并清理旧备份

# 1. 定义路径
SOURCE_DIR="/www/wwwroot/www.example.com"
DEST_DIR="/file/bit"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="www.example.com_$TIMESTAMP.tar.gz"

# 2. 创建压缩包
# -c 创建归档文件
# -z 使用 gzip 压缩
# -f 指定输出文件名
# -C 切换到目标目录避免路径太长
tar -czf "$ARCHIVE_NAME" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

# 3. 移动压缩包到目标目录
mv "$ARCHIVE_NAME" "$DEST_DIR"

# 4. 查找并删除 7 天前的旧备份
OLD_BACKUPS=$(find "$DEST_DIR" -type f -name "*.tar.gz" -mtime +7)

if [ -n "$OLD_BACKUPS" ]; then
    echo "$OLD_BACKUPS" | xargs rm -f
    echo "🧹 已清理 7 天前的旧备份文件"
else
    echo "📁 还没有 7 天前的旧备份文件，无需清理"
fi

# 5. 最后输出压缩结果
echo "✅ 压缩完成：$ARCHIVE_NAME"
