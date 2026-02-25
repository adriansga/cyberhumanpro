@echo off
chcp 65001 >nul

echo.
echo ==========================================
echo  CYBERHUMAN.PRO - Deploy na GitHub Pages
echo  https://adriansga.github.io/cyberhumanpro/
echo ==========================================
echo.

cd /d "%~dp0"

git config user.email "adriansga718@gmail.com"
git config user.name "Adrian"

echo [1/4] Status zmian...
git status --short
echo.

echo [2/4] Sync z GitHub...
git pull origin main --no-rebase 2>nul
echo.

echo [3/4] Commit...
git add .
git commit -m "Deploy %date% %time:~0,8%"
echo.

echo [4/4] Push na GitHub...
git push origin main
echo.

if %ERRORLEVEL% EQU 0 (
    echo GOTOWE! Strona bedzie dostepna za ok. 1 minute:
    echo https://adriansga.github.io/cyberhumanpro/
) else (
    echo BLAD! Sprawdz:
    echo  - Czy repo istnieje na GitHub: github.com/adriansga/cyberhumanpro
    echo  - Czy jestes zalogowany do GitHub w systemie
)

echo.
pause
