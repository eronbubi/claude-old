# claude-old

## ⚡ Schnell-Installation

PowerShell **als Administrator** öffnen und einfügen:

```powershell
irm https://raw.githubusercontent.com/eronbubi/claude-old/main/install-claude-code.ps1 | iex
```

Inoffizieller Installer für **Claude Code** auf älteren Windows-10-Rechnern, bei denen der offizielle Installer nicht klappt.

> ⚠️ Kein offizielles Anthropic-Projekt. Auf sehr alten Windows-Builds (vor 1809) kann Claude Code trotzdem nicht laufen. Dann hilft nur ein Windows-Update auf 22H2.

## Was der Installer macht

1. Zeigt die Windows-Build-Nummer an
2. Installiert **Git for Windows** (falls nicht vorhanden)
3. Installiert **Node.js 20 LTS** (falls nicht vorhanden)
4. Setzt `CLAUDE_CODE_GIT_BASH_PATH`
5. Installiert Claude Code über npm: `npm install -g @anthropic-ai/claude-code`

## Benutzung

Du musst **nichts selbst installieren**. Git und Node.js werden automatisch im Hintergrund installiert.

**Variante 1: Doppelklick**
`install.bat` herunterladen und doppelklicken, dann bei der Windows-Frage auf **Ja** klicken.

**Variante 2: Ein Befehl**
PowerShell als Administrator öffnen und einfügen:

```powershell
irm https://raw.githubusercontent.com/eronbubi/claude-old/main/install-claude-code.ps1 | iex
```

Am Ende öffnet sich Claude Code automatisch in einem neuen Fenster.

## Lizenz

MIT, siehe [LICENSE](LICENSE).
