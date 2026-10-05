# Laptop 1 – i5-7 (Game- & Media-Server + KI)

```
Dieser Windows-10-Laptop (HP ProBook 650 G3, i5-7300U, 16 GB RAM) wird mein Game- und Media-Server. Bitte installiere und richte ein:

1. Tailscale (Login im Browser mache ich selbst)
2. Java (passende Version für aktuelles Minecraft) und Crafty Controller, damit ich Minecraft-Server über eine Weboberfläche verwalten kann. Erstelle einen Minecraft-Server auf Port 25565
3. Jellyfin Media Server auf Port 8096, mit einem Ordner C:\Medien für Filme und Serien
4. Ollama installieren, Umgebungsvariable OLLAMA_HOST=0.0.0.0 setzen, damit Open WebUI auf dem Tailscale-Rechner "i7" darauf zugreifen kann (Port 11434). Das Modell qwen3:8b herunterladen und kurz testen. Der Minecraft-Server soll höchstens 4 GB RAM bekommen, damit genug für die KI bleibt
5. Alles soll beim Windows-Start automatisch starten (Autostart oder NSSM als Dienst)
6. Firewall-Regeln für diese Ports (25565, 8096, 11434 und Crafty), nur fürs private Netz und Tailscale
7. Remotedesktop aktivieren

Geh Schritt für Schritt vor, teste jeden Dienst, erkläre kurz auf Deutsch und frag vor riskanten Änderungen. Am Schluss gib mir eine Liste aller Dienste mit Adressen.
```
