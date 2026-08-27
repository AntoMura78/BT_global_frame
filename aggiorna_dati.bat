@echo off
cd /d "%~dp0"
echo Aggiornamento dei dati locali in corso...
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0aggiorna_dati.ps1"
if errorlevel 1 (
  echo.
  echo Aggiornamento non riuscito. Controlla il messaggio sopra.
)
echo.
pause
