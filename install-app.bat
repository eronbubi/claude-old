@echo off
:: Doppelklick-Installer fuer die Claude Desktop-App
powershell -NoProfile -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12; irm https://raw.githubusercontent.com/eronbubi/claude-old/main/install-claude-app.ps1 | iex"
pause
