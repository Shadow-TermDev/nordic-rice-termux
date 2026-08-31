#!/usr/bin/env bash
# ================================================
#  Nordic RICE — One-time setup
#  Runs once when RICE is first applied
# ================================================

echo "[nordic] Running one-time setup..."

# Create neofetch config directory
mkdir -p "$HOME/.config/neofetch"

# Enable nordic-fetch alias
chmod +x "$HOME/.local/bin/nordic-fetch" 2>/dev/null

echo "[nordic] Setup complete!"
