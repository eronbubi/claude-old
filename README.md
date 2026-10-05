# claude-old

Inoffizieller Installer für **Claude Code** auf älteren Windows-10-Rechnern, bei denen der offizielle Installer nicht klappt.

> ⚠️ Kein offizielles Anthropic-Projekt. Auf sehr alten Windows-Builds (vor 1809) kann Claude Code trotzdem nicht laufen. Dann hilft nur ein Windows-Update auf 22H2.

## Was der Installer macht

1. Zeigt die Windows-Build-Nummer an
2. Installiert **Git for Windows** (falls nicht vorhanden)
3. Installiert **Node.js 20 LTS** (falls nicht vorhanden)
4. Setzt `CLAUDE_CODE_GIT_BASH_PATH`
5. Installiert Claude Code über npm: `npm install -g @anthropic-ai/claude-code`

## Benutzung

PowerShell **als Administrator** öffnen:

```powershell
cd $env:USERPROFILE\Downloads
Set-ExecutionPolicy -Scope Process Bypass -Force; .\install-claude-code.ps1
```

Danach PowerShell neu öffnen und `claude` eintippen.

## Lizenz

MIT, siehe [LICENSE](LICENSE).
