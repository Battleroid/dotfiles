# add local
export PATH="$PATH:/usr/local/bin"

# Homebrew relevant
if [ -d "$HOME/.homebrew" ]; then
    export PATH=$HOME/.homebrew/bin:$PATH
    export LIBRARY_PATH=$HOME/.homebrew/lib:$LIBRARY_PATH
fi

# Setup pyenv
if [ -d "$HOME/.pyenv" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# Setup go
if which go &>/dev/null; then
    mkdir -p "$HOME/go/bin" 2>/dev/null
    mkdir -p "$HOME/go/pkg" 2>/dev/null
    mkdir -p "$HOME/go/src" 2>/dev/null
    export GOPATH="$HOME/go"
    export PATH="$GOPATH/bin:$PATH"
fi

# Setup direnv
if which direnv &>/dev/null; then
    eval "$(direnv hook zsh)"
fi

# Add home bin
if [ -d "$HOME/bin" ]; then
    export PATH="$PATH:$HOME/bin"
fi

# if [ -f "$HOME/.kube.zsh.inc" ]; then
#     source $HOME/.kube.zsh.inc
# fi

# rust (cargo)
if which cargo &>/dev/null; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi
