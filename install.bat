@echo off
:: Doppelklick-Installer fuer Claude Code (aeltere Windows 10)
:: Startet sich selbst als Administrator und laedt alles automatisch
net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)
powershell -NoProfile -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12; irm https://raw.githubusercontent.com/eronbubi/claude-old/main/install-claude-code.ps1 | iex"
echo.
echo Fertig! Neues PowerShell-Fenster oeffnen und "claude" eintippen.
pause
