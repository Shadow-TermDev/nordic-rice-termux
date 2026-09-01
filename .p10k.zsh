# Nordic Powerlevel10k config — minimal, Nord palette
# Generated for Shadow-SetUp Nordic RICE

'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
  emulate -L zsh -o extended_glob
  unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'
  [[ $ZSH_VERSION == (5.<1->*|<6->.*) ]] || return

  # ── Prompt segments ────────────────────────────────────────
  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    dir
    vcs
    newline
    prompt_char
  )

  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status
    command_execution_time
    background_jobs
    time
  )

  # ── General ────────────────────────────────────────────────
  typeset -g POWERLEVEL9K_MODE='nerdfont-v3'
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose

  # Multiline frame — 2 líneas con marco superior e inferior — Nord palette Nord3 (polar night lightest)
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%110F╭─'  # Nord Frost #88c0d0 accent
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX='%110F─╮'  # #88c0d0
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%110F╰─'  # Nord Frost
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX='%110F─╯'
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR=' '
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND=110  # Frost #88c0d0 on Polar Night #3b4252/#2e3440

  # Separators — powerline
  typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='%244F\uE0B1'
  typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B0'
  typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='%244F\uE0B3'
  typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B2'
  typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'
  typeset -g POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=''
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'

  # ── dir — Nord8 frost (88c0d0) ────────────────────────────
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=110        # #88c0d0 Nord Frost (primary accent)
  typeset -g POWERLEVEL9K_DIR_BACKGROUND=237        # #3b4252 Polar Night (bloques/marcos)
  typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=109
  typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=110
  typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
  typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_unique"
  typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=40
  typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=v3
  typeset -g POWERLEVEL9K_DIR_HYPERLINK=true

  # ── vcs (git) — Nord14 / Nord13 / Nord8 ───────────────────
  typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=108        # a3be8c
  typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND=236      # #2e3440 Polar Night
  typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=236   # #2e3440
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=236  # #2e3440
  typeset -g POWERLEVEL9K_VCS_CONFLICTED_BACKGROUND=236 # #2e3440
  typeset -g POWERLEVEL9K_VCS_LOADING_BACKGROUND=236    # #2e3440
  typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=222     # ebcb8b
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=110    # 88c0d0
  typeset -g POWERLEVEL9K_VCS_CONFLICTED_FOREGROUND=167   # bf616a
  typeset -g POWERLEVEL9K_VCS_LOADING_FOREGROUND=66
  # Show branch + status, compact
  typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=' '
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='?'
  typeset -g POWERLEVEL9K_VCS_MAX_SYNC_LATENCY_SECONDS=0.2

  # ── prompt_char — Nord9 frost / Nord11 red on error ──────
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=110
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=167
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='❯'  # símbolo comando segunda línea
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true

  # ── status — only error ───────────────────────────────────
  typeset -g POWERLEVEL9K_STATUS_OK=false
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE=true
  typeset -g POWERLEVEL9K_STATUS_ERROR=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=167
  typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='✘'

  # ── command_execution_time — Nord13 ───────────────────────
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=222
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'

  # ── background_jobs — Nord7 ───────────────────────────────
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=109
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false

  # ── time — Nord Frost #88c0d0 on Polar Night #2e3440/#3b4252 (hora a la derecha línea 1) ─
  typeset -g POWERLEVEL9K_TIME_FOREGROUND=110           # #88c0d0 primary accent
  typeset -g POWERLEVEL9K_TIME_BACKGROUND=236           # #2e3440 Polar Night
  typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'    # hora a la derecha
  typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=false

  # ── context — only SSH / root ─────────────────────────────
  typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=109
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=167
  typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_FOREGROUND=109
  typeset -g POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=false
  typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n@%m'

  (( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
  'builtin' 'unset' 'p10k_config_opts'
}

(( ! ${+functions[p10k]} )) || p10k reload
