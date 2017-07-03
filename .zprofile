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
