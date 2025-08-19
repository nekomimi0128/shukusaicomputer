#!/bin/bash
set -e

# VNCサーバー起動
sudo -u SHUKUSAI vncserver -kill :1 > /dev/null 2>&1 || true
sudo -u SHUKUSAI vncserver :1 -geometry 1280x800 -depth 24

# noVNC起動
websockify --web=/usr/share/novnc/ 6080 localhost:5901
