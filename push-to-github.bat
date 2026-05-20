@echo off
echo Initializing Git repository...
git init
git add .
git commit -m "Initial commit: Vue 3 dashboard with dark mode, sidebar, footer, and external app integrations

- Add MainLayout with fixed sidebar and footer
- Add dark/light mode toggle in navbar
- Add ProfileView, SettingsView pages
- Add ExternalAppView (5198) and AnotherAppView (5199)
- Implement responsive sidebar with collapse functionality
- Add AppFooter component

Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>"

echo.
echo Adding GitHub remote...
git remote add origin https://github.com/dinhquochung9999/TB_WEBAPP.git

echo.
echo Renaming branch to main...
git branch -M main

echo.
echo Pushing to GitHub...
git push -u origin main

echo.
echo Done! Your code is now on GitHub.
pause
