export PYTHONSTARTUP="$HOME/.pythonrc.py"

# pyenv
export PATH="$HOME/.pyenv/bin:$HOME/.local/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# go
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# js, ugh
# export NPM_PACKAGES=$HOME/.npm-packages
# export PATH=$PATH:$NPM_PACKAGES
export NPM_PACKAGES="/home/casey/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules${NODE_PATH:+:$NODE_PATH}"
export PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"


# ruby
export PATH=$PATH:$HOME/.gem/ruby/2.3.0/bin

# finally
export PATH=$PATH:$HOME/bin

# aliases
source ~/.zaliases

# funcs
lxckill() {
	if [ -z "$1" ]; then
		echo "Need a container name"
		return 0
	fi

	# stop and erase the container
	lxc-stop -n $1
	lxc-destroy -n $1
}
