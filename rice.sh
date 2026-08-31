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
SHADOW_TTS_RATE="1.0"
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
# Prefer fastfetch if available, fallback to neofetch.
# Run via bash to avoid zsh prompt leaking into neofetch output.
if command -v neofetch &>/dev/null; then
    bash -c 'neofetch --config "$HOME/.config/neofetch/config.conf"' 2>/dev/null || true
elif command -v fastfetch &>/dev/null; then
    fastfetch 2>/dev/null || true
fi

# ── Startup animation ────────────────────────────────────────
if [[ "${SHADOW_STARTUP_ANIM}" == "true" ]]; then
    _nordic_msg="${SHADOW_STARTUP_MSG}"
    _nordic_color=$'\033[38;2;136;192;208m'
    _nordic_reset=$'\033[0m'
    # Respect NO_ANIM / non-interactive shells
    if [[ -t 1 && -z "${NO_ANIM:-}" ]]; then
        for (( _i=0; _i<${#_nordic_msg}; _i++ )); do
            printf '%s%s%s' "${_nordic_color}" "${_nordic_msg:$_i:1}" "${_nordic_reset}"
            sleep 0.04
        done
        printf '\n'
        sleep 0.1
    else
        printf '%s%s%s\n' "${_nordic_color}" "${_nordic_msg}" "${_nordic_reset}"
    fi
    unset _nordic_msg _nordic_color _nordic_reset _i
fi

# ── TTS greeting (time-aware, detached) ──────────────────────
if [[ "${SHADOW_TTS_ENABLED}" == "true" ]] && command -v termux-tts-speak &>/dev/null; then
    (
        _h=$(date +%H)
        _g="Good evening"
        if (( _h >= 6 && _h < 12 )); then _g="Good morning"
        elif (( _h >= 12 && _h < 19 )); then _g="Good afternoon"
        fi
        # Use configured message as suffix
        termux-tts-speak -l "${SHADOW_TTS_LANG}" -r "${SHADOW_TTS_RATE}" "${_g}, ${SHADOW_TTS_MSG}" 2>/dev/null
    ) &>/dev/null &
    # Disown only in zsh; bash uses disown silently
    if [[ -n "${ZSH_VERSION:-}" ]]; then
        disown 2>/dev/null || true
    else
        disown 2>/dev/null || true
    fi
    unset _h _g
fi
