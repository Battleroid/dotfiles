export PYTHONSTARTUP="$HOME/.pythonrc.py"

# pyenv
export PATH="$HOME/.pyenv/bin:$HOME/.local/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# go
# export GOROOT=/usr/local/go
# export GOPATH=$HOME/go
# export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# ruby
export PATH=$PATH:$HOME/.gem/ruby/2.3.0/bin

# finally
export PATH=$PATH:$HOME/bin

# aliases
source ~/.zaliases
