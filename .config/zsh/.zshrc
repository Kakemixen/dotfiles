# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $ZDOTDIR/zinit/bin/zinit.zsh

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' matcher-list '' 'r:|[._-]=** r:|=**' 'm:{[:lower:]}={[:upper:]}' 'l:|=* r:|=*'
zstyle ':completion:*:*:git:*' script $ZDOTDIR/git-completion.bash
zstyle :compinstall filename '$ZDOTDIR/.zshrc'

autoload -Uz compinit
compinit -d $ZDOTDIR
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=$ZDOTFILE
HISTSIZE=10000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install


zinit ice depth=1; zinit light romkatv/powerlevel10k

#autoload -Uz promptinit
#promptinit
#prompt adam2

source $ZDOTDIR/aliases

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
