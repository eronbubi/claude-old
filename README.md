# claude-old

## 🧓 Altes Windows 10? Alles automatisch

Wenn die Claude-App sagt, dass deine Windows-Version zu alt ist, nimm diesen Installer. Er updatet Windows 10 automatisch auf 22H2 (gratis, Dateien bleiben) und installiert danach die Claude-App, die sich beim nächsten Login von selbst öffnet.

PowerShell **als Administrator** öffnen und einfügen:

```powershell
irm https://raw.githubusercontent.com/eronbubi/claude-old/main/install-alt-windows.ps1 | iex
```

⏱️ Dauer ca. 1–2 Stunden, der Laptop startet mehrmals neu. Nicht ausschalten!

## 🖥️ Claude Desktop-App installieren

PowerShell öffnen und einfügen (kein Git, kein Node nötig):

```powershell
irm https://raw.githubusercontent.com/eronbubi/claude-old/main/install-claude-app.ps1 | iex
```

Die App öffnet sich danach automatisch. Oder `install-app.bat` doppelklicken.

## ⚡ Claude Code (Terminal) installieren

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

## 🛠️ Fehlerbehebung

**Fehler: "githubusercontent.com ... wurde nicht als Name eines Cmdlet erkannt"**

Der Befehl ist beim Kopieren in zwei Zeilen zerbrochen. So geht's:

1. PowerShell schliessen und neu **als Administrator** öffnen
2. Den Befehl als **eine einzige Zeile** einfügen. Er muss mit `irm` anfangen und mit `iex` aufhören:

```powershell
irm https://raw.githubusercontent.com/eronbubi/claude-old/main/install-claude-app.ps1 | iex
```

3. Erst ganz am Schluss Enter drücken. Das `|` macht man auf der Schweizer Tastatur mit **AltGr + 7**.

## Lizenz

MIT, siehe [LICENSE](LICENSE).

## 📋 Homelab-Prompts

Einfach auf dem jeweiligen Laptop den Kopier-Button oben rechts im Kasten drücken und in die Claude-App einfügen. Tailscale-Login im Browser machst du selbst, danach den Laptop im Tailscale-Admin umbenennen.

### Laptop 1 – i5-7 (Game- & Media-Server)

```
Dieser Windows-10-Laptop (HP ProBook 650 G3, i5-7300U, 16 GB RAM) wird mein Game- und Media-Server. Bitte installiere und richte ein:

1. Tailscale (Login im Browser mache ich selbst)
2. Java (passende Version für aktuelles Minecraft) und Crafty Controller, damit ich Minecraft-Server über eine Weboberfläche verwalten kann. Erstelle einen Minecraft-Server auf Port 25565
3. Jellyfin Media Server auf Port 8096, mit einem Ordner C:\Medien für Filme und Serien
4. Alles soll beim Windows-Start automatisch starten (Autostart oder NSSM als Dienst)
5. Firewall-Regeln für diese Ports, nur fürs private Netz und Tailscale
6. Remotedesktop aktivieren

Geh Schritt für Schritt vor, teste jeden Dienst, erkläre kurz auf Deutsch und frag vor riskanten Änderungen. Am Schluss gib mir eine Liste aller Dienste mit Adressen.
```

### Laptop 2 – i7 (Zentrale + KI)

```
Dieser Windows-10-Laptop (HP ProBook 470 G1, i7-4702MQ, 8 GB RAM) wird die Zentrale meines Homelabs. Kein Docker, kein WSL, Virtualisierung ist aus. Bitte installiere und richte ein:

1. Tailscale (Login im Browser mache ich selbst)
2. Python 3.11 und Open WebUI per pip auf Port 8080
3. Uptime Kuma auf Port 3001 (über Node.js)
4. Gitea auf Port 3000
5. AdGuard Home mit Weboberfläche auf Port 3080
6. NSSM, damit alle Dienste als Windows-Dienst automatisch starten
7. Ollama lokal installieren und das Modell qwen3:4b herunterladen (passt in 8 GB RAM). Open WebUI soll dieses lokale Ollama (http://localhost:11434) nutzen. Später kommt noch ein zweiter Ollama-Server auf dem Tailscale-Rechner "i5-6" dazu, bereite vor, dass man den in Open WebUI zusätzlich eintragen kann
8. Firewall-Regeln nur fürs private Netz und Tailscale
9. Remotedesktop aktivieren

Geh Schritt für Schritt vor, teste jeden Dienst, erkläre kurz auf Deutsch und frag vor riskanten Änderungen. Am Schluss gib mir eine Liste aller Dienste mit Adressen.
```

### Laptop 3 – Celeron (Leichtgewicht)

```
Dieser schwache Windows-10-Laptop (HP 250 G7, Celeron N4000, 4 GB RAM) soll so leicht wie möglich laufen. Bitte:

1. Tailscale installieren (Login mache ich selbst) und als Subnet Router für mein Heimnetz 192.168.1.0/24 einrichten
2. SyncTrayzor (Syncthing) installieren mit Autostart
3. Unnötige Autostart-Programme, Hintergrund-Apps und Dienste deaktivieren, damit die CPU im Leerlauf weniger ausgelastet ist. Zeig mir vorher die Liste
4. Remotedesktop aktivieren

Erkläre kurz auf Deutsch und frag vor riskanten Änderungen. Am Schluss sag mir, wie hoch die CPU-Last im Leerlauf jetzt ist.
```

### Laptop 4 – i5-6 (AI & Speicher)

```
Dieser Windows-10-Laptop (HP ProBook 650 G2, i5-6300U, 16 GB RAM) wird AI- und Speicher-Server. Bitte:

1. Tailscale installieren (Login mache ich selbst)
2. Ollama installieren, Umgebungsvariable OLLAMA_HOST=0.0.0.0 setzen, damit andere Geräte auf Port 11434 zugreifen können
3. Das Modell qwen3:8b herunterladen und kurz testen
4. Ordner C:\Server erstellen und im Netzwerk freigeben
5. Tägliches Backup mit robocopy über die Aufgabenplanung einrichten
6. Firewall-Regeln nur fürs private Netz und Tailscale
7. Remotedesktop aktivieren

Erkläre kurz auf Deutsch und frag vor riskanten Änderungen. Am Schluss gib mir die Adressen.
```
