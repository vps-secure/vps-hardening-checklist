#!/bin/bash
# Hardened Arch VPS - by vps-secure
# Usage: sudo bash harden.sh

set -e
echo "[*] Hardening VPS..."

# 1. Update
pacman -Syu --noconfirm

# 2. UFW
pacman -S --noconfirm ufw
ufw default deny incoming
ufw default allow outgoing
ufw allow 2222/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw --force enable

# 3. SSH Hardening
sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
echo "SSH: Port 2222, keys only, root disabled - RESTART NEEDED"

# 4. Fail2Ban
pacman -S --noconfirm fail2ban
systemctl enable --now fail2ban
echo "[sshd]
enabled = true
port = 2222
maxretry = 5
bantime = 3600" > /etc/fail2ban/jail.local
systemctl restart fail2ban

echo "[+] DONE - Check README for manual steps!"
echo "[+] Don't forget: ssh-copy-id and create non-root user FIRST"