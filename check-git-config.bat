@echo off
echo ========================================
echo Check Git Configuration
echo ========================================
echo.

echo Your Git configuration:
git config --global user.name
git config --global user.email

echo.
echo GitHub authenticated as:
gh auth status

echo.
echo If credentials are wrong, reset them:
echo.
echo Option 1: Use GitHub CLI (Recommended)
echo   gh auth login
echo.
echo Option 2: Reset credentials manually
echo   git credential reject https://github.com
echo   (Then try to push, it will prompt for credentials)
echo.
pause
