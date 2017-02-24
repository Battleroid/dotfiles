# zplug
export ZPLUG_HOME=/Users/cweed/.homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", use:zsh-syntax-highlighting.zsh, defer:3
zplug "zsh-users/zsh-completions", use:zsh-completions.zsh
zplug "zsh-users/zsh-autosuggestions", use:zsh-autosuggestions.zsh
zplug "zsh-users/zsh-history-substring-search", use:zsh-history-substring-search.zsh, defer:3

# theme and omz libs come last to fix theme issues
zplug "themes/clean", from:oh-my-zsh, as:theme

# required from omz to make themes and other omz stuff no spaz out
zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"

# just install via homebrew or pkg manager
# zplug "peco/peco", as:command, from:gh-r, rename-to:peco

if ! zplug check; then
    zplug clean
    zplug install
    zplug load --verbose
    autoload -U compinit && compinit
else
    zplug load
fi

# final, rvm needs to be at end, why is rvm so particular and annoying?
source ~/.zaliases
export PATH="$HOME/.rvm/bin:$PATH"
