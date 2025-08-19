#!/bin/bash
set -e

# SHUKUSAIユーザー用VNC設定
sudo -u SHUKUSAI bash <<'EOF'
mkdir -p /home/SHUKUSAI/.vnc
echo "shukusai" | vncpasswd -f > /home/SHUKUSAI/.vnc/passwd
chmod 600 /home/SHUKUSAI/.vnc/passwd

# xstartupコピー
cp /xstartup /home/SHUKUSAI/.vnc/xstartup
chmod +x /home/SHUKUSAI/.vnc/xstartup
EOF
