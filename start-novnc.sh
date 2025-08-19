#!/bin/bash
set -e

# 既存 VNC セッションを削除
su - SHUKUSAI -c "vncserver -kill :1" > /dev/null 2>&1 || true

# VNC 起動
su - SHUKUSAI -c "vncserver :1 -geometry 1280x800 -depth 24"

# noVNC 起動
su - SHUKUSAI -c "websockify --web=/usr/share/novnc/ 6080 localhost:5901 &"
