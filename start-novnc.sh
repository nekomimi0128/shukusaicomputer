#!/bin/bash
set -e

# 既存のVNCセッションを削除
sudo -u SHUKUSAI vncserver -kill :1 > /dev/null 2>&1 || true

# VNCサーバー起動
sudo -u SHUKUSAI vncserver :1 -geometry 1280x800 -depth 24

# noVNC起動（再起動時はポートが開放されるまで少し待つ）
while ! nc -z localhost 5901; do
  sleep 1
done
websockify --web=/usr/share/novnc/ 6080 localhost:5901 &
