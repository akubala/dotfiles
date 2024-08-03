# SECTIONS:
#   MISC
#   COMPLETIONS
#   HISTORY
#   KEYS
#   THEME
#   ALIASES
#   TOOLS

########
# MISC #
########

# PATH
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Lang
export LANG="en_US.UTF-8"

# Editor
export EDITOR="vim"

###############
# COMPLETIONS #
###############

# Load
autoload -Uz compinit && compinit

# Include hidden files in completions
_comp_options+=(globdots)

# Add Tab selector
zstyle ':completion:*:*:*:*:*' menu select

# Completions insensitive to case and hyphens/underscores
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'

# Complete . and .. special directories
zstyle ':completion:*' special-dirs true

# Colors for completions
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Use cache for fast completions
zstyle ':completion::complete:*' use-cache 1

# Cache path
zstyle ':completion::complete:*' cache-path "$HOME/.cache/zsh"

# Do not autoselect the first completion entry
unsetopt menu_complete

# Show completion menu on successive tab press
setopt auto_menu

# If a completion is performed with the cursor within a word, and a full completion
# is inserted, the cursor is moved to the end of the word
setopt always_to_end

# Print job notifications in the long format by default
setopt long_list_jobs

# Allow comments even in interactive shells
setopt interactivecomments

# kubectl
source <(kubectl completion zsh)

# docker
source <(docker completion zsh)

###########
# HISTORY #
###########

# History file
export HISTFILE="$HOME/.zsh_history"

# The maximum number of events stored in history memory list
export HISTSIZE=20000

# The maximum number of history events to save in the history file
export SAVEHIST=20000

# Record timestamp of command in HISTFILE
setopt extended_history

# Delete duplicates first
setopt hist_expire_dups_first

# Remove blank lines from history
setopt hist_reduce_blanks

# Ignore commands that start with space
setopt hist_ignore_space

# Share command history data
setopt share_history

########
# KEYS #
########

# Emacs mode
bindkey -e

# [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5C' forward-word

# [Ctrl-LeftArrow] - move backward one word
bindkey '^[[1;5D' backward-word

# [Shift-Tab] - move through the completion menu backwards
bindkey '${terminfo[kcbt]}' reverse-menu-complete

# [Backspace] - delete backward
bindkey '^?' backward-delete-char

# [Delete] - delete forward
bindkey '^[[3~' delete-char

# [Home] - Go to beginning of line
bindkey '^[[H' beginning-of-line

# [End] - Go to end of line
bindkey '^[[F' end-of-line

#########
# THEME #
#########

# Support for 256 colors
export TERM="xterm-256color"
autoload -U colors && colors

# PROMPT substitution helper
setopt prompt_subst

# Git
source $HOME/.git_dirty.sh

# Autoload vcs_info function (-U) for zsh (z)
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=(precmd_vcs_info)

# Enable VCS systems you use
zstyle ':vcs_info:*' enable git

# Current branch display style
zstyle ':vcs_info:git:*' formats "%{%F{blue}%}%b%f"

# Python
function virtual_env_prompt_info() {
    [[ -n ${VIRTUAL_ENV} ]] || return
    echo "[${VIRTUAL_ENV:t}]"
}

# PROMPT
export PROMPT='
%B%F{cyan}%1~%f $vcs_info_msg_0_%b $(git_dirty) $(virtual_env_prompt_info)
$ '

###########
# ALIASES #
###########

# Paths
alias ..="cd .."
alias ww="cd $HOME/Work"
alias a="cd $HOME/Apps"
alias s="cd $HOME/Sandbox"

# Native commands
alias l="ls -lah"
alias ll="ls -lah"
alias grep="grep --color=auto"
alias md="mkdir -p"
alias rd="rmdir"

# Tools
alias xclip="xclip -selection clipboard"
alias bat="bat --paging=never --style=rule"
alias dps='docker ps --format "table{{.ID}}\t{{.Names}}\t{{.Image}}\t{{.RunningFor}}\t{{.Status}}"'

#########
# TOOLS #
#########

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
