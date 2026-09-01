#!/usr/bin/env bash
# ================================================
#  Nordic RICE — Polar Night theme
#  Inspired by Nord color palette (https://www.nordtheme.com)
#  For Shadow-SetUp
# ================================================

# Colors (Nord palette — also exported as NORD0-15 below)
SHADOW_COLOR_PRIMARY="88c0d0"    # Nord8 - frost
SHADOW_COLOR_SECONDARY="81a1c1"  # Nord9 - frost
SHADOW_COLOR_ACCENT="bf616a"     # Nord11 - aurora red

# Startup
SHADOW_STARTUP_MSG="The north awaits"
SHADOW_STARTUP_ANIM=true

# TTS — greeting is time-aware, message is suffix
SHADOW_TTS_ENABLED=true
SHADOW_TTS_LANG="en-US"
SHADOW_TTS_RATE="1.4"
SHADOW_TTS_MSG="Nordic terminal ready"

# Environment
export SHADOW_RICE="nordic"
export PROMPT_EOL_MARK="%"
export BAT_THEME="Nord"

# Nord color variables (https://www.nordtheme.com/docs/colors-and-palettes)
export NORD0="2e3440"   # Polar Night
export NORD1="3b4252"
export NORD2="434c5e"
export NORD3="4c566a"
export NORD4="d8dee9"   # Snow Storm
export NORD5="e5e9f0"
export NORD6="eceff4"
export NORD7="8fbcbb"   # Frost
export NORD8="88c0d0"
export NORD9="81a1c1"
export NORD10="5e81ac"
export NORD11="bf616a"  # Aurora
export NORD12="d08770"
export NORD13="ebcb8b"
export NORD14="a3be8c"
export NORD15="b48ead"

# ── Neofetch on startup ──────────────────────────────────────
# Modular: usa config del RICE si existe, fallback limpio a fastfetch/neofetch
# Se ejecuta vía bash para evitar fugas del prompt zsh
if command -v neofetch &>/dev/null; then
    bash -c 'neofetch --config "$HOME/.config/neofetch/config.conf"' 2>/dev/null || neofetch 2>/dev/null || true
elif command -v fastfetch &>/dev/null; then
    fastfetch 2>/dev/null || true
fi

# ── Startup animation (Compatible Zsh & Bash, sin 'local' fuera de función) ──
if [[ "${SHADOW_STARTUP_ANIM}" == "true" ]]; then
    _nordic_msg="${SHADOW_STARTUP_MSG}"
    _nordic_color=$'\033[38;2;136;192;208m'
    _nordic_reset=$'\033[0m'
    if [[ -t 1 && -z "${NO_ANIM:-}" ]]; then
        _nordic_len=${#_nordic_msg}
        _nordic_i=0
        while (( _nordic_i < _nordic_len )); do
            if [[ -n "${ZSH_VERSION:-}" ]]; then
                # zsh: index 1-based, substring $msg[$((i+1))]
                _nordic_char="${_nordic_msg:$((_nordic_i)):1}"
            else
                _nordic_char="${_nordic_msg:$_nordic_i:1}"
            fi
            printf '%s%s%s' "${_nordic_color}" "${_nordic_char}" "${_nordic_reset}"
            sleep 0.04 2>/dev/null || sleep 0.04
            _nordic_i=$(( _nordic_i + 1 ))
        done
        printf '\n'
        sleep 0.1 2>/dev/null || true
    else
        printf '%s%s%s\n' "${_nordic_color}" "${_nordic_msg}" "${_nordic_reset}"
    fi
    unset _nordic_msg _nordic_color _nordic_reset _nordic_len _nordic_i _nordic_char
fi

# ── Cargar alias/funciones del RICE de forma agnóstica (fix para eza/la/ll) ──
# 100% compatible Bash/Zsh: Zsh no define BASH_SOURCE al hacer source
if [[ -n "${ZSH_VERSION:-}" ]]; then
    RICE_SCRIPT_DIR="$(cd "$(dirname "${(%):-%x}")" 2>/dev/null && pwd)"
else
    RICE_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd)"
fi
# Fallback a $0 si lo anterior falla
if [[ -z "${RICE_SCRIPT_DIR:-}" ]] || [[ ! -d "${RICE_SCRIPT_DIR:-}" ]]; then
    RICE_SCRIPT_DIR="$(cd "$(dirname "$0")" 2>/dev/null && pwd)"
fi
[ -f "$RICE_SCRIPT_DIR/aliases.sh" ] && source "$RICE_SCRIPT_DIR/aliases.sh"
[ -f "$RICE_SCRIPT_DIR/functions.sh" ] && source "$RICE_SCRIPT_DIR/functions.sh"
if ! alias ls &>/dev/null; then
    [ -f "$HOME/.shadow-setup/aliases.sh" ] && source "$HOME/.shadow-setup/aliases.sh"
fi
if ! declare -f mkcd &>/dev/null && ! typeset -f mkcd &>/dev/null; then
    [ -f "$HOME/.shadow-setup/functions.sh" ] && source "$HOME/.shadow-setup/functions.sh"
fi
