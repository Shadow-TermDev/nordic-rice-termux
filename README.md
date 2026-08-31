# Nordic RICE for Shadow-SetUp ❄️

Nord-inspired terminal theme for Termux — Polar Night, Snow Storm, Frost & Aurora.

![Nord](https://img.shields.io/badge/palette-Nord-88c0d0?style=flat-square)
![Termux](https://img.shields.io/badge/Termux-000000?style=flat-square&logo=android)
![License](https://img.shields.io/badge/license-MIT-5e81ac?style=flat-square)

## Features

- **Nord palette** — Polar Night `#2e3440` + Snow Storm `#eceff4` + Frost `#88c0d0` + Aurora
- **Minimal p10k prompt** — dir + git + frost `❯`, Nord-colored, fast (no instant wizard spam)
- **Neofetch / fastfetch** — Nordic `nordic-fetch` wrapper, auto-detects backend
- **Frost startup animation** — `The north awaits` in `#88c0d0`, respects `NO_ANIM=1` and non-TTY
- **Time-aware TTS** — Good morning/afternoon/evening + `Nordic terminal ready` (en-US)
- **Termux extras** — Nord `colors.properties`, compact 2-row extra-keys, bar cursor, 5k scrollback
- **Smart aliases & functions** — eza/bat/zoxide auto-detect, `mkcd`, `extract`, `nordic` palette preview, `sysinfo`

## Installation

```bash
# Via Shadow-SetUp
sw rice install https://github.com/Shadow-TermDev/nordic-rice-termux.git
sw rice set nordic

# Manual
git clone https://github.com/Shadow-TermDev/nordic-rice-termux ~/.shadow-setup/dotfiles/rices/nordic
sw rice set nordic
```

Restart terminal: `exec zsh` or reopen Termux → `termux-reload-settings` is auto-run.

## What's Included

| File | Destination | Purpose |
|------|-------------|---------|
| `manifest.json` | — | Metadata, deps, file mappings |
| `rice.sh` | `~/.shadow-setup/active_rice.sh` | Animation, TTS, `NORD0-15`, neofetch |
| `setup.sh` | — | One-time setup (dirs, chmod, hints) |
| `aliases.sh` | `~/.shadow-setup/aliases.sh` | Shell aliases (eza/bat/zsh-aware) |
| `functions.sh` | `~/.shadow-setup/functions.sh` | `mkcd`, `extract`, `search`, `nordic`, `sysinfo` |
| `colors.properties` | `~/.termux/colors.properties` | Nord 16-color scheme |
| `termux.properties` | `~/.termux/termux.properties` | Cursor, scrollback, extra-keys |
| `.p10k.zsh` | `~/.p10k.zsh` | Powerlevel10k — Nord frost theme |
| `neofetch.conf` | `~/.config/neofetch/config.conf` | Minimal neofetch layout |
| `nordic-fetch` | `~/.local/bin/nordic-fetch` | Wrapper — neofetch → fastfetch fallback, args passthrough |

## Commands

```bash
nf / nordic-fetch        # neofetch with Nord config (passes args)
nfetch --help
nordic                   # preview Nord palette in terminal
sysinfo                  # minimal system info without neofetch
weather / weather-full   # wttr.in (one-line / full)
mkcd my/project          # mkdir -p && cd
extract archive.tar.gz   # unpack any format
bak file.txt             # timestamped backup
portcheck 8080           # is port free?
```

## Customization

Edit `rice.sh` variables before `sw rice set nordic`:

```bash
SHADOW_STARTUP_MSG="Stay frosty"
SHADOW_STARTUP_ANIM=true   # false to disable
SHADOW_TTS_ENABLED=true
SHADOW_TTS_LANG="en-US"
SHADOW_TTS_RATE="1.0"
SHADOW_TTS_MSG="Nordic terminal ready"
NO_ANIM=1                  # env var to skip animation once
```

Colors: `NORD0`–`NORD15` are exported — use in scripts as `$NORD8` etc.

## Requirements

- Termux + `zsh` + `oh-my-zsh` + `powerlevel10k` (via Shadow-SetUp `sw install shell`)
- Optional but recommended: `eza`, `bat`, `zoxide`, `fd`, `fzf`, Nerd Font (JetBrainsMono Nerd)
- `neofetch` auto-installed via manifest; `fastfetch` works as fallback

```bash
pkg install eza bat zoxide fd fzf neofetch
# Nerd Font
sw install fonts
```

## Uninstall / Reset

```bash
sw rice reset              # back to default
sw rice delete nordic      # remove rice files (not active rice)
```

## Palette

| Polar Night | Snow Storm | Frost | Aurora |
|-------------|------------|-------|--------|
| `#2e3440` `#3b4252` `#434c5e` `#4c566a` | `#d8dee9` `#e5e9f0` `#eceff4` | `#8fbcbb` `#88c0d0` `#81a1c1` `#5e81ac` | `#bf616a` `#d08770` `#ebcb8b` `#a3be8c` `#b48ead` |

Ref: [nordtheme.com](https://www.nordtheme.com/docs/colors-and-palettes)

## Author

Shadow-TermDev — MIT License
