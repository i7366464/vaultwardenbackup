# vaultwardenbackup

用来备份vaultwarden的脚本

## 说明

- $(dirname "$SOURCE_DIR")：获取目录路径，如 /www/wwwroot

- $(basename "$SOURCE_DIR")：获取文件夹名称，如 www.example.com

- tar -czf "$ARCHIVE_NAME" -C ...：避免压缩包中包含完整路径。

- find ... -mtime +7：查找修改时间早于 7 天前的文件。

- -exec rm -f {} \;：对查找到的每个文件执行删除操作。
