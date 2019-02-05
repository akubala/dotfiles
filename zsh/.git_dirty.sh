ZSH_THEME_GIT_PROMPT_CLEAN="%B%F{green}*%b%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%B%F{red}*%b%f"

git_dirty() {
    # If in git repo
    if (git rev-parse --is-inside-work-tree &>/dev/null); then
        # Show the marker for any uncommited changes in repo
        if ! (git diff-index --quiet HEAD &>/dev/null); then
            echo $ZSH_THEME_GIT_PROMPT_DIRTY
        # Show the marker for any untracked files in repo
        elif (git status --porcelain | grep '??' &>/dev/null); then
            echo $ZSH_THEME_GIT_PROMPT_DIRTY
        else
            echo $ZSH_THEME_GIT_PROMPT_CLEAN
        fi
    fi
}
