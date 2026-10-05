# Claude Desktop-App Installer (ohne Git, ohne Node)
# PowerShell: irm https://raw.githubusercontent.com/eronbubi/claude-old/main/install-claude-app.ps1 | iex

$ErrorActionPreference = "Stop"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
function Info($m) { Write-Host "==> $m" -ForegroundColor Cyan }

Info "Windows Build: $([Environment]::OSVersion.Version.Build)"

$setup = "$env:TEMP\ClaudeSetup.exe"
$url = "https://claude.ai/api/desktop/win32/x64/exe/latest/redirect"

try {
    Info "Lade Claude Desktop-App herunter..."
    Invoke-WebRequest $url -OutFile $setup -UseBasicParsing
    Info "Installiere Claude..."
    Start-Process $setup -Wait
} catch {
    Write-Host "Download fehlgeschlagen, versuche winget..." -ForegroundColor Yellow
    winget install --id Anthropic.Claude -e --accept-source-agreements --accept-package-agreements
}

# App suchen und starten
$paths = @(
    "$env:LOCALAPPDATA\AnthropicClaude\claude.exe",
    "$env:LOCALAPPDATA\Programs\Claude\Claude.exe",
    "$env:LOCALAPPDATA\AnthropicClaude\Claude.exe"
)
$exe = $paths | Where-Object { Test-Path $_ } | Select-Object -First 1
if ($exe) {
    Info "Fertig! Claude wird geoeffnet..."
    Start-Process $exe
} else {
    Info "Installiert! Falls Claude nicht von selbst aufgeht: Windows-Taste druecken und 'Claude' tippen."
}
