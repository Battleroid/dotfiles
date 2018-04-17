source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
    zgen oh-my-zsh
    # zgen oh-my-zsh themes/clean
    zgen oh-my-zsh themes/clean-simple

    zgen save
fi

[ -f ~/.zprofile ] && source ~/.zprofile
[ -f ~/.zaliases ] && source ~/.zaliases

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
