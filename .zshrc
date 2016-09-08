# OMZ
export ZSH=/home/casey/.oh-my-zsh
export EDITOR=vim
ZSH_THEME="clean"
plugins=(git)

# Python
export PATH="$HOME/.local/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# Go
# export GOROOT=/usr/local/go
# export GOPATH=$HOME/go
# export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Ruby
# export PATH=$PATH:$HOME/.gem/ruby/2.3.0/bin

# Lastly
opt_dir=(/opt/*/bin/*.sh)
opt_path=$(printf "%s:" "${opt_dir[@]}")
export PATH="${opt_path}/sbin/:${PATH}"
source ~/.zaliases
source $ZSH/oh-my-zsh.sh
