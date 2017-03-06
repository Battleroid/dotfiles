# [[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# homebrew lib
export LIBRARY_PATH=~/.homebrew/lib:$LIBRARY_PATH

# ruby/rvm
export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
export PATH=~/.homebrew/bin:/Users/cweed/.gem/ruby/2.0.0/bin:$PATH
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# python/pyenv
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
eval "$(pyenv init -)" ; eval "$(pyenv virtualenv-init -)"

# direnv hook
eval "$(direnv hook zsh)"

# misc
# keychain --timeout 360 -q

# finish
source ~/.zshrc
