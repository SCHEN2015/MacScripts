#!/bin/sh

# Description:
# Help YS to fix the promission of his file in portable hard drive.
#
# History:
# v1.0  2018-08-18  charles.shih  Implemented all the features.

echo "这个脚本将帮助你修复当前目录下所有文件和文件夹的权限，执行过程中可以随时按Ctrl+C取消……"

cd $(dirname $0)
echo "请再次确认你的当前目录为：$(pwd)\n"

echo "获取超级权限……"
sudo echo "OK!" || exit 1

echo "修复权限中，请耐心等待……"

f=~/pfix.$$

sudo find . -type d > $f
sed 's/\(.*\)/chmod a+rwx "\1"/' $f > $f.sh
/bin/bash $f.sh

sudo find . -type f > $f
sed 's/\(.*\)/chmod a+rw "\1"/' $f > $f.sh
/bin/bash $f.sh

rm $f ${f}.sh

echo "完成！"

exit 0

