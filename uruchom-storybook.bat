@echo off
REM Uruchom Storybook - podwojne klikniecie lub z terminala. Wymaga Node.js: https://nodejs.org (LTS)
cd /d "%~dp0"

where node >nul 2>nul
if errorlevel 1 (
  echo.
  echo Node.js nie jest zainstalowany lub nie jest w PATH.
  echo 1. Wejdz na: https://nodejs.org
  echo 2. Pobierz wersje LTS i zainstaluj.
  echo 3. Zamknij terminal, otworz nowy i uruchom ten plik ponownie.
  echo.
  pause
  exit /b 1
)

if not exist "node_modules" (
  echo Pierwsze uruchomienie - instaluje zaleznosci...
  call npm install
  if errorlevel 1 exit /b 1
)

echo Uruchamiam Storybook - przegladarka otworzy sie na http://localhost:6006
call npm run storybook
pause
