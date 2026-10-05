# Claude Code Installer fuer aeltere Windows-10-Versionen
# Als Administrator ausfuehren:
#   Set-ExecutionPolicy -Scope Process Bypass -Force; .\install-claude-code.ps1

$ErrorActionPreference = "Stop"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$tmp = "$env:TEMP\cc-install"
New-Item -ItemType Directory -Force -Path $tmp | Out-Null

function Info($m) { Write-Host "==> $m" -ForegroundColor Cyan }

# 1. Windows-Version anzeigen
$build = [Environment]::OSVersion.Version.Build
Info "Windows Build: $build"
if ($build -lt 17763) {
    Write-Host "ACHTUNG: Build $build ist aelter als 1809 (17763). Wir versuchen es trotzdem ueber npm." -ForegroundColor Yellow
}

# 2. Git for Windows
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Info "Installiere Git for Windows..."
    $gitUrl = "https://github.com/git-for-windows/git/releases/download/v2.47.1.windows.1/Git-2.47.1-64-bit.exe"
    Invoke-WebRequest $gitUrl -OutFile "$tmp\git.exe" -UseBasicParsing
    Start-Process "$tmp\git.exe" -ArgumentList "/VERYSILENT /NORESTART" -Wait
} else { Info "Git ist schon da" }

# 3. Node.js LTS (v20 laeuft noch auf aelteren Windows-10-Builds)
if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Info "Installiere Node.js 20 LTS..."
    $nodeUrl = "https://nodejs.org/dist/v20.18.1/node-v20.18.1-x64.msi"
    Invoke-WebRequest $nodeUrl -OutFile "$tmp\node.msi" -UseBasicParsing
    Start-Process msiexec.exe -ArgumentList "/i `"$tmp\node.msi`" /qn /norestart" -Wait
} else { Info "Node ist schon da: $(node -v)" }

# PATH neu laden
$env:Path = [Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [Environment]::GetEnvironmentVariable("Path","User")

# 4. Git-Bash-Pfad fuer Claude Code setzen
$bash = "C:\Program Files\Git\bin\bash.exe"
if (Test-Path $bash) {
    [Environment]::SetEnvironmentVariable("CLAUDE_CODE_GIT_BASH_PATH", $bash, "User")
    $env:CLAUDE_CODE_GIT_BASH_PATH = $bash
}

# 5. Claude Code ueber npm statt nativem Installer
Info "Installiere Claude Code ueber npm..."
npm install -g @anthropic-ai/claude-code

# 6. Pruefen und Claude Code automatisch in neuem Fenster starten
$npmBin = Join-Path $env:APPDATA "npm"
$claudeCmd = Join-Path $npmBin "claude.cmd"
if (Test-Path $claudeCmd) {
    Info "Fertig! Claude Code wird jetzt geoeffnet..."
    Start-Process powershell.exe -ArgumentList "-NoExit", "-Command", "Set-Location `$env:USERPROFILE; & '$claudeCmd'"
} else {
    Write-Host "Claude Code wurde nicht gefunden. Bitte Fehlermeldung oben pruefen." -ForegroundColor Red
}
