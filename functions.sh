#!/data/data/com.termux/files/usr/bin/bash
# ================================================
#  Nordic RICE · Functions
#  Nordic-themed shell helpers
# ================================================

# mkcd — create dir and cd into it
mkcd() {
    if [[ -z "$1" ]]; then
        echo -e "\033[38;2;191;97;106mUsage: mkcd <dir>\033[0m" >&2; return 1
    fi
    mkdir -p -- "$1" && cd -- "$1" || return 1
}

# extract — unpack any archive (checks tool availability)
extract() {
    if [[ -z "$1" ]]; then
        echo -e "\033[38;2;191;97;106mUsage: extract <archive>\033[0m" >&2; return 1
    fi
    if [[ ! -f "$1" ]]; then
        echo -e "\033[38;2;191;97;106mextract: '$1' is not a valid file\033[0m" >&2; return 1
    fi
    case "$1" in
        *.tar.bz2|*.tbz2) tar xjf "$1"    ;;
        *.tar.gz|*.tgz)   tar xzf "$1"    ;;
        *.tar.xz)         tar xJf "$1"    ;;
        *.tar.zst|*.tar.zstd) tar --zstd -xf "$1" 2>/dev/null || unzstd -c "$1" | tar xf - ;;
        *.bz2)            bunzip2 "$1"    ;;
        *.gz)             gunzip "$1"     ;;
        *.tar)            tar xf "$1"     ;;
        *.zip)            unzip "$1"      ;;
        *.rar)            if command -v unrar &>/dev/null; then unrar x "$1"; else echo -e "\033[38;2;191;97;106munrar not installed: pkg install unrar\033[0m" >&2; return 1; fi ;;
        *.7z)             if command -v 7z &>/dev/null; then 7z x "$1"; else echo -e "\033[38;2;191;97;106m7z not installed: pkg install p7zip\033[0m" >&2; return 1; fi ;;
        *.zst|*.zstd)     if command -v unzstd &>/dev/null; then unzstd "$1"; else echo -e "\033[38;2;191;97;106munzstd not installed\033[0m" >&2; return 1; fi ;;
        *)                echo -e "\033[38;2;191;97;106mextract: cannot handle '$1'\033[0m" >&2; return 1 ;;
    esac
}

# search — find files by name (prefers fd, falls back to find, partial match)
search() {
    if [[ -z "$1" ]]; then echo -e "\033[38;2;191;97;106mUsage: search <pattern>\033[0m" >&2; return 1; fi
    if command -v fd &>/dev/null; then
        fd --hidden --follow --no-ignore -g "*$1*" 2>/dev/null
    else
        find . -type f -name "*$1*" 2>/dev/null
    fi
}

# biggest — largest files/dirs in current dir (fixed dotfiles bug)
biggest() {
    local n=${1:-10}
    # du -d 1 previene incluir '.' y '..' como resultados gigantes erróneos
    du -h -d 1 2>/dev/null | grep -vE '^\s*0\s' | sort -rh | head -n "$n"
}

# bak — backup file with timestamp
bak() {
    if [[ -z "$1" ]]; then echo "Usage: bak <file>" >&2; return 1; fi
    if [[ ! -e "$1" ]]; then echo -e "\033[38;2;191;97;106mbak: '$1' not found\033[0m" >&2; return 1; fi
    local dst="${1}.bak.$(date +%Y%m%d%H%M%S)"
    cp -a -- "$1" "$dst" && echo -e "\033[38;2;163;190;140m→ $dst\033[0m" # Nord Aurora Green
}

# portcheck — check if port is in use
portcheck() {
    if [[ -z "$1" ]]; then echo "Usage: portcheck <port>" >&2; return 1; fi
    if ! [[ "$1" =~ ^[0-9]+$ ]]; then echo "portcheck: port must be numeric" >&2; return 1; fi
    if ss -tulanp 2>/dev/null | grep -q ":${1}\b"; then
        ss -tulanp 2>/dev/null | grep --color=auto ":${1}\b"
    else
        echo -e "\033[38;2;163;190;140mPort $1 is free\033[0m"
    fi
}

# nordic — quick Nord palette preview
nordic() {
    local -a colors=(
        "2e3440 Polar Night 0" "3b4252 1" "434c5e 2" "4c566a 3"
        "d8dee9 Snow Storm 4" "e5e9f0 5" "eceff4 6"
        "8fbcbb Frost 7" "88c0d0 8" "81a1c1 9" "5e81ac 10"
        "bf616a Aurora 11" "d08770 12" "ebcb8b 13" "a3be8c 14" "b48ead 15"
    )
    for c in "${colors[@]}"; do
        local hex=${c%% *}
        local rest=${c#* }
        printf '\033[48;2;%d;%d;%dm  \033[0m  #%s  %s\n' "0x${hex:0:2}" "0x${hex:2:2}" "0x${hex:4:2}" "$hex" "$rest"
    done
}

# sysinfo — minimal system info (optimized for Termux speed)
sysinfo() {
    # dpkg-query es instantáneo en Termux, a diferencia de pkg list-installed
    local pkg_count=$(dpkg-query -f '.\n' -W 2>/dev/null | wc -l)
    printf '\033[38;2;136;192;208m▌ %s@%s\033[0m\n' "${USER:-$(whoami)}" "$(hostname 2>/dev/null || uname -n)"
    printf '  OS:       %s\n' "$(uname -o 2>/dev/null || uname -s) $(uname -m)"
    printf '  Uptime:   %s\n' "$(uptime -p 2>/dev/null | sed 's/up //')"
    printf '  Shell:    %s\n' "${SHELL##*/} ${ZSH_VERSION:-$BASH_VERSION}"
    printf '  Packages: %s\n' "${pkg_count:-0}"
}
