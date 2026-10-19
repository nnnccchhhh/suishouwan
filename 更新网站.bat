@echo off
setlocal
set "SITE=D:\随手玩\github-site"
cd /d "%SITE%"
set "PATH=%PATH%;C:\Program Files\GitHub CLI"
set GIT_TERMINAL_PROMPT=0

echo ================================================
echo   更新「随手玩」网站
echo ================================================
echo.
echo 正在把最新的三个游戏复制到网站目录...

copy /Y "D:\随手玩\人生重开模拟器\人生重开模拟器.html" "%SITE%\life\index.html" >nul
if errorlevel 1 (echo   [跳过] 人生重开模拟器 没找到，保留网上旧版) else (echo   [OK]   人生重开模拟器)

copy /Y "D:\随手玩\斗罗剧情转盘\斗罗剧情转盘.html" "%SITE%\douluo\index.html" >nul
if errorlevel 1 (echo   [跳过] 斗罗剧情转盘 没找到，保留网上旧版) else (echo   [OK]   斗罗剧情转盘)

copy /Y "D:\随手玩\德州扑克\德州扑克.html" "%SITE%\poker\index.html" >nul
if errorlevel 1 (echo   [跳过] 德州扑克 没找到，保留网上旧版) else (echo   [OK]   德州扑克)

echo.
git add -A
git diff --cached --quiet
if not errorlevel 1 (
  echo 内容没有变化，网上已经是最新的了。
  echo.
  pause
  exit /b 0
)

echo 正在上传到 GitHub...
git -c user.name="nnnccchhhh" -c user.email="nnnccchhhh@users.noreply.github.com" commit -m "更新游戏" >nul
git push -q origin main
if errorlevel 1 (
  echo.
  echo [失败] 上传没成功，检查一下网络，再双击本文件重试。
  echo.
  pause
  exit /b 1
)

echo.
echo 上传成功！等 1 分钟左右，网址就会变成新版本：
echo   https://nnnccchhhh.github.io/suishouwan/
echo.
echo （浏览器打不开新的，就按 Ctrl+F5 强制刷新）
echo.
pause
