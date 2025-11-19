#!/bin/bash
set -euo pipefail

echo "=============================="
echo "  Installing Bot Semeru..."
echo "=============================="

# --- Update packages ---
sudo apt update && sudo apt upgrade -y

# --- Install dependency ---
sudo apt install -y git python3-venv python3-pip

# --- Set timezone ---
sudo timedatectl set-timezone Asia/Jakarta

# --- Enable BBR & FQ ---
if ! grep -q '^net.core.default_qdisc=fq$' /etc/sysctl.conf; then
  echo 'net.core.default_qdisc=fq' | sudo tee -a /etc/sysctl.conf >/dev/null
fi

if ! grep -q '^net.ipv4.tcp_congestion_control=bbr$' /etc/sysctl.conf; then
  echo 'net.ipv4.tcp_congestion_control=bbr' | sudo tee -a /etc/sysctl.conf >/dev/null
fi

sudo sysctl -p

# --- Increase file descriptor limit ---
if ! grep -q '^\* soft nofile 1048576$' /etc/security/limits.conf; then
  echo '* soft nofile 1048576' | sudo tee -a /etc/security/limits.conf >/dev/null
fi

if ! grep -q '^\* hard nofile 1048576$' /etc/security/limits.conf; then
  echo '* hard nofile 1048576' | sudo tee -a /etc/security/limits.conf >/dev/null
fi

# --- Clone repository (public or private, silakan sesuaikan) ---
if [ ! -d "booking-semeru" ]; then
  echo "[INFO] Cloning booking-semeru..."
  git clone https://welldanyogia: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@github.com/welldanyogia/booking-semeru.git
fi

# --- Run installer ---
cd booking-semeru
bash install.sh

echo "======================================"
echo " Installation Finished Successfully!"
echo "======================================"
