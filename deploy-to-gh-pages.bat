@echo off
REM Deploy built site (dist) to gh-pages branch (safe, non-destructive to main)
echo ========================================
echo Deploying to GitHub Pages (branch: gh-pages)
echo ========================================

:: Optional: install dependencies if node_modules absent
IF NOT EXIST node_modules (
  echo node_modules not found — running npm install
  npm install
)

echo Building project...
npm run build || (echo Build failed && pause && exit /b 1)

echo Preparing deployment folder...
cd /d %~dp0
REM Ensure dist exists
IF NOT EXIST dist (
  echo dist folder not found after build && pause && exit /b 1
)

REM Create temporary deploy folder

set TEMP_DIR=%TEMP%\my-app-gh-pages-deploy
if exist "%TEMP_DIR%" rd /s /q "%TEMP_DIR%"
mkdir "%TEMP_DIR%"
xcopy /E /I /Y dist "%TEMP_DIR%\dist\" > nul

cd /d "%TEMP_DIR%\dist"
echo Initializing git in temp folder...
git init > nul 2>&1
git checkout -b gh-pages > nul 2>&1
git add -A
git commit -m "Deploy to gh-pages" > nul 2>&1 || (echo No changes to deploy)

echo Pushing to origin gh-pages (force)...
git remote add origin https://github.com/dinhquochung9999/TB_WEBAPP.git 2>nul || git remote set-url origin https://github.com/dinhquochung9999/TB_WEBAPP.git
git push -f origin gh-pages

echo Cleaning up...
rd /s /q "%TEMP_DIR%"
echo Deployment complete. Visit: https://dinhquochung9999.github.io/TB_WEBAPP/
pause
