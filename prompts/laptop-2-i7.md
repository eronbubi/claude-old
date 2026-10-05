# Laptop 2 – i7 (Zentrale)

```
Dieser Windows-10-Laptop (HP ProBook 470 G1, i7-4702MQ, 8 GB RAM) wird die Zentrale meines Homelabs. Kein Docker, kein WSL, Virtualisierung ist aus. Bitte installiere und richte ein:

1. Tailscale (Login im Browser mache ich selbst)
2. Python 3.11 und Open WebUI per pip auf Port 8080
3. Uptime Kuma auf Port 3001 (über Node.js)
4. Gitea auf Port 3000
5. AdGuard Home mit Weboberfläche auf Port 3080
6. NSSM, damit alle Dienste als Windows-Dienst automatisch starten
7. Open WebUI soll später Ollama auf dem Tailscale-Rechner "i5-6" Port 11434 nutzen, bereite das nur vor
8. Firewall-Regeln nur fürs private Netz und Tailscale
9. Remotedesktop aktivieren

Geh Schritt für Schritt vor, teste jeden Dienst, erkläre kurz auf Deutsch und frag vor riskanten Änderungen. Am Schluss gib mir eine Liste aller Dienste mit Adressen.
```
