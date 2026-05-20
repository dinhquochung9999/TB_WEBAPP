@echo off
echo ========================================
echo Deploy to GitHub Pages
echo ========================================
echo.

echo Step 1: Initializing Git...
git init
git add .
git commit -m "Deploy: Add GitHub Actions workflow for GitHub Pages deployment

- Configure vite.config.ts with /TB_WEBAPP/ base path
- Add GitHub Actions workflow for automatic build and deploy
- Deploy to https://dinhquochung9999.github.io/TB_WEBAPP/

Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>"

echo.
echo Step 2: Adding GitHub remote...
git remote add origin https://github.com/dinhquochung9999/TB_WEBAPP.git

echo.
echo Step 3: Renaming branch to main...
git branch -M main

echo.
echo Step 4: Pushing to GitHub...
git push -u origin main --force

echo.
echo ========================================
echo Deployment setup complete!
echo ========================================
echo.
echo Your web will be available at:
echo https://dinhquochung9999.github.io/TB_WEBAPP/
echo.
echo GitHub Actions will automatically build and deploy when you push to main branch.
echo.
echo To enable GitHub Pages:
echo 1. Go to https://github.com/dinhquochung9999/TB_WEBAPP/settings/pages
echo 2. Select "Deploy from a branch"
echo 3. Choose "gh-pages" branch
echo 4. Click Save
echo.
pause
