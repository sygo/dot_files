# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify correctall
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit

#-- exports --#
export EDITOR="vim"
export BROWSER="chromium"
export PATH=$PATH:$HOME/scripts:/usr/local/bin:
export SB_REMOVE_BEL=yes
export HISTCONTROL="ignoredupes"
export COMMAND_ORIENTED_HISTORY=1

#-- colored man pages --#
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#-- sourcing prettyness --#
source ~/.zsh/le_prompt.zsh
source ~/.zsh/aliases.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
