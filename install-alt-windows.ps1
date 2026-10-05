# Claude-Installer fuer alte Windows-10-Versionen
# 1. Updatet Windows 10 automatisch auf 22H2 (falls noetig)
# 2. Installiert nach dem Neustart automatisch die Claude-App und oeffnet sie
# PowerShell als Admin:
#   irm https://raw.githubusercontent.com/eronbubi/claude-old/main/install-alt-windows.ps1 | iex

$ErrorActionPreference = "Stop"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
function Info($m) { Write-Host "==> $m" -ForegroundColor Cyan }

$appCmd = "powershell -NoProfile -ExecutionPolicy Bypass -Command `"[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12; irm https://raw.githubusercontent.com/eronbubi/claude-old/main/install-claude-app.ps1 | iex`""

$build = [Environment]::OSVersion.Version.Build
Info "Windows Build: $build"

if ($build -ge 19045) {
    Info "Windows ist aktuell genug. Installiere direkt die Claude-App..."
    irm https://raw.githubusercontent.com/eronbubi/claude-old/main/install-claude-app.ps1 | iex
    return
}

Info "Windows ist zu alt fuer Claude. Update auf Windows 10 22H2 wird gestartet."
Write-Host "Deine Dateien und Programme bleiben erhalten. Dauer: ca. 1-2 Stunden." -ForegroundColor Yellow
Write-Host "Der Laptop startet dabei mehrmals neu. Nicht ausschalten!" -ForegroundColor Yellow

# Nach dem Neustart die Claude-App automatisch installieren
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\RunOnce" -Name "ClaudeInstall" -Value $appCmd

# Windows 10 Update-Assistent von Microsoft laden und starten
$assistant = "$env:TEMP\Windows10Upgrade.exe"
Info "Lade Windows 10 Update-Assistent von Microsoft..."
Invoke-WebRequest "https://go.microsoft.com/fwlink/?LinkID=799445" -OutFile $assistant -UseBasicParsing
Info "Starte Update. Das Fenster vom Update-Assistenten zeigt den Fortschritt."
Start-Process $assistant -ArgumentList "/quietinstall /skipeula /auto upgrade"

Info "Fertig gestartet! Nach dem Update oeffnet sich die Claude-App automatisch beim ersten Login."
