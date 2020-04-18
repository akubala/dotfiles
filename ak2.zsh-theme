function virtualenv_prompt_info(){
  [[ -n ${VIRTUAL_ENV} ]] || return
  echo "${ZSH_THEME_VIRTUALENV_PREFIX:=[}${VIRTUAL_ENV:t}${ZSH_THEME_VIRTUALENV_SUFFIX:=]}"
}

export VIRTUAL_ENV_DISABLE_PROMPT=1

PROMPT='
%{$fg_bold[cyan]%}%c%{$reset_color%} $(git_prompt_info)$(virtualenv_prompt_info) 
$ '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} *"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} *"
