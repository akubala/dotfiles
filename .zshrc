##########
# Colors #
##########

# Support for 256 colors
export TERM=xterm-256color

# Load colors
autoload -U colors && colors

###########
# History #
###########

# History file
HISTFILE="$HOME/.zsh_history"

# The maximum number of events stored in history memory list
HISTSIZE=50000

# The maximum number of history events to save in the history file
SAVEHIST=10000

# Record timestamp of command in HISTFILE
setopt extended_history

# Delete duplicates first
setopt hist_expire_dups_first

# Ignore duplicated commands history list
setopt hist_ignore_dups

# Ignore commands that start with space
setopt hist_ignore_space

# Show command with history expansion to user before running it
setopt hist_verify

# Add commands to HISTFILE in order of execution
setopt inc_append_history

# Share command history data
setopt share_history

# Remove blank lines from history
setopt hist_reduce_blanks

##############
# Completion #
##############

# Completion init
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

# Include hidden files in completions
# _comp_options+=(globdots)

# Gimme nice tab selection
zstyle ':completion:*:*:*:*:*' menu select

# Completion insensitive to case and hyphens/underscores
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'

# Complete . and .. special directories
zstyle ':completion:*' special-dirs true

# Enable ls colors
eval "$(dircolors -b)"
ls --color -d . &>/dev/null && alias ls='ls --color=tty' || { ls -G . &>/dev/null && alias ls='ls -G' }

# Colors for completions
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Use cache for fast completion
zstyle ':completion::complete:*' use-cache 1

# Cache path
zstyle ':completion::complete:*' cache-path "$HOME/.cache/zsh"

# cd without cd
setopt auto_cd

# Do not autoselect the first completion entry
unsetopt menu_complete

# Show completion menu on successive tab press
setopt auto_menu

# Do not set cursor to the end of the word if completion is started
setopt complete_in_word

# If a completion is performed with the cursor within a word, and a full completion
# is inserted, the cursor is moved to the end of the word 
setopt always_to_end

# Print job notifications in the long format by default
setopt long_list_jobs

# Allow comments even in interactive shells
setopt interactivecomments

# Fancy tees and cats
setopt multios

# Make cd push the old directory onto the directory stack
setopt auto_pushd

# Do not push multiple copies of the same directory onto the directory stack
setopt pushd_ignore_dups

# Exchanges the meanings of '+' and '-'' when used with a number to specify a directory
# in the stack
setopt pushdminus

###########
# Aliases #
###########

alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
alias ...='../..'
alias ....='../../..'
alias l='ls -lah'
alias ll='ls -lah'
alias grep='grep --color=auto'
alias xclip='xclip -selection c'
alias s="cd $HOME/Sandbox"
alias w="cd $HOME/Work"
alias md='mkdir -p'
alias rd='rmdir'

########
# Keys #
########

# Emacs mode
bindkey -e

# Edit command in vim with ctrl-v
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line

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
bindkey  '^[[H' beginning-of-line

# [End] - Go to end of line
bindkey  '^[[F' end-of-line

# FIXME
# [Ctrl-r] - Search backward incrementally for a specified string
bindkey '^r' history-incremental-search-backward

#########
# Theme #
#########

# Colors for theme
blue="%F{075}"
pink="%F{170}"
yellow="%F{214}"
grey="%F{014}"

# PROMPT substitution helper
setopt prompt_subst

# Autoload vcs_info function (-U) for zsh (z)
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=(precmd_vcs_info)

# Current branch display style
zstyle ':vcs_info:git:*' formats "(%{$grey%}%b%f)"

# Enable VCS systems you use
zstyle ':vcs_info:*' enable git

# Python Virtual Environment helper
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Python Virtual Env function
function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('%F{blue}`basename $VIRTUAL_ENV`%f') '
}

# Full PROMPT
PROMPT='
%{$pink%}%n%f at %{$blue%}%m%f in %{$yellow%}%~%f $vcs_info_msg_0_$(virtualenv_info)
$ '

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Antibody
source <(antibody init)
antibody bundle < ~/.zsh_plugins
