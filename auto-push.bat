@echo off
chcp 65001

FOR /F "tokens=2 delims==" %%I IN ('wmic os get localdatetime /value') DO set time=%%I
set datetime=%time:~0,4%-%time:~4,2%-%time:~6,2% %time:~8,2%:%time:~10,2%:%time:~12,2%
set commitMsg="发布文章" (%datetime%)

set /p customCommitMsg="请输入提交信息 (按 Enter 使用默认提交信息 '发布文章（时间）'): "
if not "%customCommitMsg%"=="" set commitMsg=%customCommitMsg% 

set branch="master"
set /p customBranch="请输入远程仓库的分支 (按 Enter 使用默认分支 'master'): "
if not "%customBranch%"=="" set branch=%customBranch%

git add .
git commit -m "%commitMsg%"
git push origin %branch%

echo 已提交到远程仓库，按任意键退出...
pause >nul