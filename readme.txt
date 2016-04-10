Git is a sersion control system.
Git is free sotfware.

learn commond
git add <file>
git add . //add all new file
git commit 
git status 查看当前仓库的状态
git diff <file>	查看文件的修改内容
git reset --hard <commit id>回退到某个版本
git log 查看log
git reflog 查看每一次的命令纪录

git checkout -- <file>  撤销对这个文件的修改 回到最近一次git commit/git add时的状态。就是丢弃工作区的修改
git reset HEAD <file>  丢弃暂存区的修改

git branch 列出当前所有分支
git branch <branch-name> 创建一个分支
git checkout <branch-name> 切换到某个分支
git checkout -b <branch-name> 组合命令，创建分支，并切换到这个分支

git log --pretty=oneline 每个commit 一行
git log --graph --pretty=oneline --abbrev-commit 带图标的查看log

git merge <branch-name>  把分支合并到当前分支（快速合并）
git branch -d <branch-name> 删除某个分支（当前不能在要删除的这个分支上）
当Git无法自动合并分支时，就必须首先解决冲突。解决冲突后，再提交，合并完成。

git merge --no-ff -m "commit log" <branch-name> 使用no-ff模式合并代码，合并后的历史有分支，能看出来曾经做过合并（即使删除这个分支后）

为爱判处终身孤寂，不还手，不放手（测试 bug分支）

git stash 保存现场
git stash list 获取stashlist
git stash apply <stash>回复到stash 不删除该stash
git stash drop <stash> 删除stash
git stash pop 回复stash 并删除
