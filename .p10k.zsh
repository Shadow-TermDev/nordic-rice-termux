# Nordic Powerlevel10k config — minimal, clean
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

  # Prompt segments — minimal
  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    dir                     # current directory
    vcs                     # git status
    newline
    prompt_char             # prompt symbol
  )

  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status                  # exit code
    command_execution_time  # duration
    background_jobs         # background jobs
  )

  # Nord colors
  typeset -g POWERLEVEL9K_MODE='nerdfont-v3'

  # Prompt layout
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%240F╭─'
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX='%240F─╮'
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%240F╰─'
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX='%240F─╯'
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR=' '
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND=240

  # Separators — powerline
  typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='%244F\uE0B1'
  typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B0'
  typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='%244F\uE0B3'
  typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B2'
  typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'
  typeset -g POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'

  # dir — Nord8 (frost blue)
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=109
  typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=66
  typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=109
  typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
  typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
  typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=v3

  # vcs (git) — Nord14 (green)
  typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=145
  typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=180
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=109

  # prompt_char — Nord9 (frost)
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=109
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=131
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='❯'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true

  # status — Nord11 (red) on error
  typeset -g POWERLEVEL9K_STATUS_OK=false
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE=true
  typeset -g POWERLEVEL9K_STATUS_ERROR=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=131

  # command_execution_time — Nord13 (yellow)
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=180

  # background_jobs — Nord7 (cyan)
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=109

  # Context (user@host) — only in SSH
  typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=139
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=131
  typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_FOREGROUND=139
  typeset -g POWERLEVEL9K_CONTEXT模板_FOREGROUND=66
  typeset -g POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=false

  # Transient prompt
  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=same-dir

  # Instant prompt
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose

  (( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
  'builtin' 'unset' 'p10k_config_opts'
}

(( ! ${+functions[p10k]} )) || p10k reload
