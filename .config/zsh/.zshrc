# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' matcher-list '' 'r:|[._-]=** r:|=**' 'm:{[:lower:]}={[:upper:]}' 'l:|=* r:|=*'
zstyle :compinstall filename '/home/life/.zshrc'

autoload -Uz compinit
compinit -d $ZDOTDIR
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=$ZDOTFILE
HISTSIZE=10000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install

source $ZDOTDIR/aliases

autoload -Uz promptinit
promptinit
prompt adam2
