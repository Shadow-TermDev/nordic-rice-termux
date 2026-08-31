#!/data/data/com.termux/files/usr/bin/bash
# ================================================
#  Nordic RICE · Aliases
#  Arctic-themed shell aliases
# ================================================

# -----------------------------------------------
# zoxide (shell-aware)
# -----------------------------------------------
if command -v zoxide &>/dev/null; then
    if [[ -n "${ZSH_VERSION:-}" ]]; then
        eval "$(zoxide init zsh)"
    else
        eval "$(zoxide init bash)"
    fi
    alias cd="z"
    alias cdi="zi"
fi

# -----------------------------------------------
# ls -> eza (fallback to ls)
# -----------------------------------------------
if command -v eza &>/dev/null; then
    alias ls='eza --icons --group-directories-first --time-style=long-iso'
    alias ll='eza -lah --icons --group-directories-first --git'
    alias la='eza -a --icons --group-directories-first'
    alias l='eza -lh --icons --group-directories-first'
    alias lt='eza -T --icons --group-directories-first --level=2'
    alias lta='eza -Ta --icons --group-directories-first'
else
    alias ll='ls -lah --color=auto'
    alias la='ls -A --color=auto'
    alias l='ls -lh --color=auto'
fi

# -----------------------------------------------
# cat -> bat
# -----------------------------------------------
if command -v bat &>/dev/null; then
    alias cat='bat --paging=never --plain'
    alias catp='bat --paging=always'
    alias bathelp='bat --plain --language=help'
fi

# -----------------------------------------------
# Navigation
# -----------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'

# -----------------------------------------------
# System
# -----------------------------------------------
alias update='pkg update && pkg upgrade'
alias clean='pkg clean && pkg autoclean'
alias myip='curl -fsSL --max-time 5 ifconfig.me || curl -fsSL --max-time 5 ipinfo.io/ip'
alias c='clear'
alias cls='clear'
alias h='history'
alias hg='history | grep --color=auto'
alias x='exit'
alias ports='ss -tulanp 2>/dev/null || netstat -tulanp 2>/dev/null || echo "ss/netstat not available"'
alias localip='ip -brief addr 2>/dev/null || ifconfig 2>/dev/null'
alias mkdir='mkdir -pv'
alias df='df -h'
alias du='du -h'
alias free='free -h 2>/dev/null || vmstat 2>/dev/null'
alias path='echo $PATH | tr ":" "\n"'

# -----------------------------------------------
# Safety (prompt before overwrite)
# -----------------------------------------------
alias rm='rm -i'
alias cp='cp -iv'
alias mv='mv -iv'
alias ln='ln -iv'

# -----------------------------------------------
# Git
# -----------------------------------------------
alias gs='git status -sb'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
alias gca='git commit -am'
alias gam='git commit --amend'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpl='git pull'
alias gpr='git pull --rebase'
alias gl='git log --oneline --graph --decorate -20'
alias gll='git log --graph --pretty=format:"%C(yellow)%h%Creset %C(cyan)%ad%Creset | %s %C(green)[%an]%Creset %C(red)%d%Creset" --date=short'
alias gd='git diff'
alias gds='git diff --staged'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gsw='git switch'
alias gswc='git switch -c'
alias gb='git branch -a'
alias gm='git merge'
alias gr='git remote -v'
alias gst='git stash'
alias gstp='git stash pop'
alias gsta='git stash apply'
alias gundo='git reset --soft HEAD~1'
alias gclean='git clean -fdx'

# -----------------------------------------------
# Python
# -----------------------------------------------
alias py='python3'
alias python='python3'
alias pip='pip3'
alias venv='python3 -m venv'
alias activate='source venv/bin/activate 2>/dev/null || source .venv/bin/activate 2>/dev/null || echo "No venv found (venv/.venv)"'
alias pipup='pip install --upgrade pip'
alias pipreq='pip install -r requirements.txt'
alias pyserver='python3 -m http.server 8000'

# -----------------------------------------------
# Quick edit / reload
# -----------------------------------------------
alias zshrc='${EDITOR:-nano} ~/.zshrc'
alias p10krc='${EDITOR:-nano} ~/.p10k.zsh'
alias nanorc='${EDITOR:-nano} ~/.nanorc'
alias reload='source ~/.zshrc 2>/dev/null || source ~/.bashrc 2>/dev/null; echo "✓ reloaded"'
alias rice-reload='source ~/.shadow-setup/active_rice.sh 2>/dev/null && echo "✓ rice reloaded"'

# -----------------------------------------------
# Nordic shortcuts
# -----------------------------------------------
alias nf='nordic-fetch'
alias nfetch='nordic-fetch'
# wttr.in with Nord fallback; 3 = one-line, 1 = compact
alias weather='curl -fsSL --max-time 5 "wttr.in/?format=3" 2>/dev/null || echo "weather unavailable"'
alias weather-full='curl -fsSL --max-time 5 "wttr.in/?format=v2" 2>/dev/null'
