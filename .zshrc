# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git python)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#
#
# General settings
export EDITOR="vim"
setopt NO_BEEP
unsetopt share_history

LOCAL_ZSH_CONFIG_FILE=~/.zshrc.local && test -f $LOCAL_ZSH_CONFIG_FILE && source $LOCAL_ZSH_CONFIG_FILE

# Tmux with right colors.
alias tmux="tmux -2"
[ -n "$TMUX" ] && export TERM=screen-256color


# Add vim opening of file while file_name:line_number
# Example: vim ~/.zshrc:33
vim_commands=(vi vim gvim)
_run_vim_wrapper() {
    local cmd
    for arg in $@; do
        cmd="$cmd \"${arg/:/\" \"+:}\""
    done
    eval $cmd
}
for cmd in $vim_commands; do
    eval "function ${cmd}_wrapper () { _run_vim_wrapper $cmd \$@}"
    alias $cmd=${cmd}_wrapper
done


cleanbranch(){
    if [ $# -ne 2 ]
    then
        echo "Usage: cleanbranch branch_to_delete base_branch"
        return;
    fi
    local branch_to_delete=$1
    local base_branch=$2
    branch_in_base=$(git branch --contains $branch_to_delete | grep -c "^* $base_branch$")
    if [ $branch_in_base -gt 0 ]
    then
        while true; do
            echo "Merged in $base_branch"
            echo "Delete $branch_to_delete?"
            read yn
            case $yn in
                [Yy]* ) git branch -D $branch_to_delete; break;;
                [Nn]* ) break;;
                * ) echo "Please answer yes or no.";;
            esac
        done
    else
        echo "Not merged in $base_branch"
    fi
}

cleanmbranch() {
    if [ $# -ne 1 ]
    then
        echo "Usage: cleanmbranch branch_to_delete"
        return;
    fi
    cleanbranch $1 "master"
}

xargcleanmbranch() {
    while read branch_name
    do
        cleanmbranch $branch_name
    done
}
