export PATH="/home/life/aconfmgr:$PATH"

# ops
setopt extended_history
setopt share_history
setopt hist_find_no_dups

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $ZDOTDIR/zinit/bin/zinit.zsh


zinit ice blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' matcher-list '' 'r:|[._-]=** r:|=**' 'm:{[:lower:]}={[:upper:]}' 'l:|=* r:|=*'
zstyle ':completion:*:*:git:*' script $ZDOTDIR/git-completion.bash
zstyle :compinstall filename '$ZDOTDIR/.zshrc'

autoload -Uz compinit
compinit -d $ZDOTDIR

zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit light zsh-users/zsh-autosuggestions
bindkey '^[[Z' autosuggest-accept

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting

#autoload -Uz promptinit
#promptinit
#prompt adam2

source $ZDOTDIR/aliases

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

