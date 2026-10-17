# Hardened Arch VPS Checklist
> Cheap Contabo VPS ($5) gets brute-forced in 15 minutes with default root + password on port 22.

My stats: 14 days uptime, 2.4k attacks blocked, 0 breaches.

### My Stack
- UFW: default deny, allow 2222, 80, 443
- SSH: Port 2222, key-only, root disabled
- Fail2Ban: 5 retry, 1h ban
- Auto-updates weekly

### Day 1 Checklist
1. Create non-root user + SSH key
2. ufw default deny + allow 2222
3. Harden sshd_config


---

## Need help hardening your VPS?

I offer $49 VPS hardening for cheap VPS (Contabo, Hetzner, etc) - 30min setup.

📧 Email: antigun4@gmail.com
💬 Reddit: u/vps-secure

I secure: UFW, SSH keys, Fail2Ban, auto-updates.

Check my work: `./harden.sh`
4. Install Fail2Ban
5. Auto-updates

Full script coming soon. PRs welcome!
Built by @vps-secure