source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
    zgen oh-my-zsh
    zgen oh-my-zsh themes/clean

    zgen save
fi

export CLICOLOR=1
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
export EDITOR=vim
export CASE_SENSITIVE="false"

# just for osx
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.zprofile ] && source ~/.zprofile
[ -f ~/.zaliases ] && source ~/.zaliases
