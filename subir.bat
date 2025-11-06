if exist ".git" rmdir /s /q ".git"
git init
git add .
git commit -m "Primer commit"
git remote remove origin 2>nul
git remote add origin https://github.com/facu-programer/Roblox-Delta-Executor-Bunker.git
git branch -M main
git push -u origin main --force
pause
