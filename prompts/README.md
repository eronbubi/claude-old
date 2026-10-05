# Homelab-Prompts

Prompts zum Einrichten von 4 alten Windows-Laptops als Homelab. Einfach den passenden Prompt in die Claude-App auf dem jeweiligen Laptop kopieren.

| Laptop | Datei | Rolle | Tailscale-Name |
|---|---|---|---|
| 1 | [laptop-1-i5-7.md](laptop-1-i5-7.md) | Game- & Media-Server (Minecraft, Jellyfin) | `i5-7` |
| 2 | [laptop-2-i7.md](laptop-2-i7.md) | Zentrale + KI (Open WebUI, Ollama, Uptime Kuma, Gitea, AdGuard) | `i7` |
| 3 | [laptop-3-celeron.md](laptop-3-celeron.md) | Leichtgewicht (Tailscale Subnet Router, Syncthing) | `celeron` |
| 4 | [laptop-4-i5-6.md](laptop-4-i5-6.md) | AI & Speicher (Ollama, Freigabe, Backups) | `i5-6` |

Den Tailscale-Login im Browser muss man bei jedem Laptop selbst machen. Danach die Laptops im Tailscale-Admin entsprechend umbenennen.
