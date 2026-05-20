@echo off
echo ========================================
echo Deploy to GitHub Pages - Manual Steps
echo ========================================
echo.

echo Step 1: Reset git remote...
git remote remove origin
git remote add origin https://github.com/dinhquochung9999/TB_WEBAPP.git

echo.
echo Step 2: Creating initial commit...
git add .
git commit -m "Initial commit: Vue 3 dashboard deployment

- Add MainLayout with fixed sidebar and footer
- Add dark/light mode toggle
- Add ProfileView, SettingsView pages
- Add ExternalAppView and AnotherAppView
- Responsive sidebar with collapse
- Configured for GitHub Pages deployment

Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>" || echo Already committed

echo.
echo Step 3: Rename branch to main...
git branch -M main

echo.
echo Step 4: Pushing to GitHub...
echo Please authenticate with your GitHub credentials when prompted.
echo You can use:
echo   - GitHub username + Personal Access Token
echo   - SSH key
echo.
git push -u origin main --force

echo.
echo ========================================
echo If authentication fails:
echo ========================================
echo.
echo Option 1: Use Personal Access Token
echo 1. Go to https://github.com/settings/tokens
echo 2. Create new token with 'repo' permission
echo 3. Use token as password when prompted
echo.
echo Option 2: Use SSH
echo 1. Generate SSH key: ssh-keygen -t ed25519
echo 2. Add to GitHub: https://github.com/settings/keys
echo 3. Change remote: git remote set-url origin git@github.com:dinhquochung9999/TB_WEBAPP.git
echo.
pause

