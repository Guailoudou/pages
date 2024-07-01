@echo off
chcp 65001
cd /d %~dp0
echo 这是实现MC的UUID迁移的命令行工具，请将文件放置于想要迁移的存档文件夹内部。

echo 请将旧UUID和新UUID作为命令行参数传递给该工具。

echo 例如：UUIDMigrator.bat 旧UUID 新UUID

echo 如果未传递参数，则将提示用户输入。

if not "%1" == "" (
    if not "%2" == "" (
        set olduuid=%1
        set newuuid=%2
        goto run
    )
)
set /p olduuid=输入 old UUID:
set /p newuuid=输入 new UUID:

:run
copy "playerdata\%olduuid%.dat" "playerdata\%newuuid%.dat"
if %errorlevel% == 0 (
    echo playerdata 复制成功！
) else (
    echo playerdata 复制失败，请检查文件路径和权限 请放在地图文件夹内！
)

copy "stats\%olduuid%.json" "stats\%newuuid%.json"
if %errorlevel% == 0 (
    echo stats 复制成功！
) else (
    echo stats 复制失败，请检查文件路径和权限 请放在地图文件夹内！
)

copy "advancements\%olduuid%.json" "advancements\%newuuid%.json"
if %errorlevel% == 0 (
    echo advancements 复制成功！
) else (
    echo advancements 复制失败，请检查文件路径和权限 请放在地图文件夹内！
)
pause