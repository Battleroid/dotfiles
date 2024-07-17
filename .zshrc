source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
    zgen oh-my-zsh
    zgen oh-my-zsh themes/clean

    zgen save
fi

[ -f ~/.zprofile ] && source ~/.zprofile
[ -f ~/.zaliases ] && source ~/.zaliases
