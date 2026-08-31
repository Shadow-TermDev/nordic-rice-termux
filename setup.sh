#!/usr/bin/env bash
# ================================================
#  Nordic RICE — One-time setup
#  Runs once when RICE is first applied via rice_manager
# ================================================
set -euo pipefail

echo "[nordic] Running one-time setup..."

# 1. Directoria de configuración básica
mkdir -p "$HOME/.config/neofetch"
mkdir -p "$HOME/.local/bin"

# 2. Instalación/Clonación manual de plugins ZSH si no existen
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [[ -d "$HOME/.oh-my-zsh" ]]; then
    mkdir -p "$ZSH_CUSTOM/plugins"
    
    # zsh-autosuggestions
    if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]; then
        echo "[nordic] Cloning zsh-autosuggestions..."
        git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    fi

    # zsh-syntax-highlighting
    if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]; then
        echo "[nordic] Cloning zsh-syntax-highlighting..."
        git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
    fi
else
    echo "[nordic] Warning: Oh My Zsh is not installed in $HOME/.oh-my-zsh"
fi

# 3. Permisos de ejecución para nordic-fetch
if [[ -f "$HOME/.local/bin/nordic-fetch" ]]; then
    chmod +x "$HOME/.local/bin/nordic-fetch"
fi

if [[ -f "$(dirname "$0")/nordic-fetch" ]]; then
    chmod +x "$(dirname "$0")/nordic-fetch" 2>/dev/null || true
fi

# 4. Verificación de Neofetch config
if [[ ! -f "$HOME/.config/neofetch/config.conf" ]]; then
    echo "[nordic] Warning: neofetch config not found — will be copied on next 'rice set'"
fi

# 5. Recomendación de Nerd Fonts
if ! fc-list 2>/dev/null | grep -qi "nerd\|jetbrains\|fira\|hack" ; then
    echo "[nordic] Tip: install a Nerd Font for icons → pkg install font-jetbrains-mono"
fi

echo "[nordic] Setup complete! Run 'exec zsh' or restart Termux."
