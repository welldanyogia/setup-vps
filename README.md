# Setup VPS Scripts

Repository ini berisi berbagai script otomatis untuk melakukan setup VPS, benchmark jaringan, dan instalasi bot **booking-semeru**.

---

## 📌 1. Remote Benchmark Setup

Gunakan script berikut untuk melakukan benchmark jaringan pada VPS secara otomatis:

```bash
wget -qO- https://raw.githubusercontent.com/welldanyogia/setup-vps/main/remote_setup_bench.sh | bash
```

## 📌 2. Bot Setup

Gunakan script berikut untuk melakukan benchmark jaringan pada VPS secara otomatis:

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y git python3-venv python3-pip
sudo timedatectl set-timezone Asia/Jakarta
echo 'net.core.default_qdisc=fq' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv4.tcp_congestion_control=bbr' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
echo '* soft nofile 1048576' | sudo tee -a /etc/security/limits.conf
echo '* hard nofile 1048576' | sudo tee -a /etc/security/limits.conf
git clone https://welldanyogia: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@github.com/welldanyogia/booking-semeru.git
cd booking-semeru
bash install.sh
```

## 📌 3. Cek Kuota Setup

Gunakan script berikut untuk melakukan benchmark jaringan pada VPS secara otomatis:

```bash
# 0) paket dasar Python (wajib)
sudo apt update
sudo apt install -y python3 python3-venv python3-pip ca-certificates

# (opsional) biar 'python' menunjuk ke python3
sudo apt install -y python-is-python3

# 1) clone repo
git clone https://welldanyogia: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@github.com/welldanyogia/semeru-kapasitas.git
cd semeru-kapasitas

# 2) virtualenv
python3 -m venv .venv
source .venv/bin/activate

# 3) dependencies
python -m pip install --upgrade pip wheel
pip install requests beautifulsoup4 colorama
```

## 📌 4. Cek Kuota Run

Gunakan script berikut untuk melakukan benchmark jaringan pada VPS secara otomatis:

```bash
python semeru-kapasitas.py \
  --site-id 8 \
  --year-month 2025-10 \
  --target 2025-10-18 \
  --loop \
  --interval 1 \
  --ipv4
```
