#!/usr/bin/env bash
# ================================================
#  Nordic RICE — One-time setup
#  Runs once when RICE is first applied via rice_manager
# ================================================
set -euo pipefail

echo "[nordic] Running one-time setup..."

# 1. Ensure config directories
mkdir -p "$HOME/.config/neofetch"
mkdir -p "$HOME/.local/bin"

# 2. Ensure nordic-fetch is executable (rice_manager copies via manifest.files)
if [[ -f "$HOME/.local/bin/nordic-fetch" ]]; then
    chmod +x "$HOME/.local/bin/nordic-fetch"
fi
# Also chmod source if running from repo directly
if [[ -f "$(dirname "$0")/nordic-fetch" ]]; then
    chmod +x "$(dirname "$0")/nordic-fetch" 2>/dev/null || true
fi

# 3. Validate neofetch config exists, fallback warning
if [[ ! -f "$HOME/.config/neofetch/config.conf" ]]; then
    echo "[nordic] Warning: neofetch config not found — will be copied on next 'rice set'"
fi

# 4. Optional: ensure Nerd Font hint
if ! fc-list 2>/dev/null | grep -qi "nerd\|jetbrains\|fira\|hack" ; then
    echo "[nordic] Tip: install a Nerd Font for icons → pkg install font-jetbrains-mono or sw install fonts"
fi

echo "[nordic] Setup complete! Run 'exec zsh' or restart Termux."
