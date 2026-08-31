#!/usr/bin/env bash
# ================================================
#  Nordic RICE — Polar Night theme
#  Inspired by Nord color palette
#  arcticblues, Polar Night, Snow Storm
# ================================================

# Colors (Nord palette)
SHADOW_COLOR_PRIMARY="88c0d0"    # nord8 - Frost
SHADOW_COLOR_SECONDARY="81a1c1"  # nord9 - Frost
SHADOW_COLOR_ACCENT="bf616a"     # nord11 - Aurora Red

# Startup
SHADOW_STARTUP_MSG="The north awaits"
SHADOW_STARTUP_ANIM=true

# TTS
SHADOW_TTS_ENABLED=true
SHADOW_TTS_LANG="en-US"
SHADOW_TTS_RATE="1.0"
SHADOW_TTS_MSG="Nordic terminal ready"

# Environment
export SHADOW_RICE="nordic"
export BAT_THEME="Nord"
export PROMPT_EOL_MARK="|"
export NEOFetch_CONFIG="$HOME/.config/neofetch/config.conf"

# Nord color variables for scripts
export NORD0="2e3440"
export NORD1="3b4252"
export NORD2="434c5e"
export NORD3="4c566a"
export NORD4="d8dee9"
export NORD5="e5e9f0"
export NORD6="eceff4"
export NORD7="8fbcbb"
export NORD8="88c0d0"
export NORD9="81a1c1"
export NORD10="5e81ac"
export NORD11="bf616a"
export NORD12="d08770"
export NORD13="ebcb8b"
export NORD14="a3be8c"
export NORD15="b48ead"

# Startup animation
if [[ "$SHADOW_STARTUP_ANIM" == "true" ]]; then
    mensaje="$SHADOW_STARTUP_MSG"
    color='\033[38;2;136;192;208m'  # Nord8 in RGB
    fin_color='\033[0m'
    for ((i=0; i<${#mensaje}; i++)); do
        echo -ne "${color}${mensaje:$i:1}${fin_color}"
        sleep 0.08
    done
    echo
    sleep 0.2
fi

# TTS greeting
if [[ "$SHADOW_TTS_ENABLED" == "true" ]] && command -v termux-tts-speak &>/dev/null; then
    nohup sh -c "
        h=\$(date +%H)
        g='Good evening'
        [ \"\$h\" -ge 6 ] && [ \"\$h\" -lt 12 ] && g='Good morning'
        [ \"\$h\" -ge 12 ] && [ \"\$h\" -lt 19 ] && g='Good afternoon'
        termux-tts-speak -l ${SHADOW_TTS_LANG} -r ${SHADOW_TTS_RATE} \"\${g}, Nordic terminal ready\"
    " &>/dev/null &!
fi
