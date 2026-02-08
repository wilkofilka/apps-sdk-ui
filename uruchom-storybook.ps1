# Uruchom Storybook (podgląd wyglądu). Wymaga: Node.js - https://nodejs.org (LTS)
$ErrorActionPreference = "Stop"
$projectRoot = $PSScriptRoot

# Sprawdź czy Node jest dostępny
try {
  $null = Get-Command node -ErrorAction Stop
} catch {
  Write-Host ""
  Write-Host "Node.js nie jest zainstalowany lub nie jest w PATH." -ForegroundColor Yellow
  Write-Host "1. Wejdz na: https://nodejs.org" -ForegroundColor Cyan
  Write-Host "2. Pobierz wersje LTS i zainstaluj (Next -> Finish)." -ForegroundColor Cyan
  Write-Host "3. Zamknij ten terminal, otworz nowy i uruchom ten skrypt ponownie." -ForegroundColor Cyan
  Write-Host ""
  exit 1
}

Set-Location $projectRoot

if (-not (Test-Path "node_modules")) {
  Write-Host "Pierwsze uruchomienie - instaluje zaleznosci (npm install)..." -ForegroundColor Gray
  npm install
  if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}

Write-Host "Uruchamiam Storybook..." -ForegroundColor Green
Write-Host "Przegladarka otworzy sie na http://localhost:6006" -ForegroundColor Gray
npm run storybook
