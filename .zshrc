# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="$PATH:$HOME.local/bin"
export PATH="$HOME/.local/bin${PATH:+:${PATH}}"
export PATH="${PATH}:${HOME}/.local/bin/"

# source ~/zshplg/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/zshplg/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ~/zshplg/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/zshplg/powerlevel10k/powerlevel10k.zsh-theme


# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.


### "nvim" as manpager
export MANPAGER="nvim -c 'set ft=man' -"

alias z="zathura"
alias conn="nmcli dev wifi connect"
alias wifi="nmcli dev wifi list"
# listing
alias ll="exa -lh"
alias la="exa -lah"
alias NM="doas NetworkManager"
# Colorize grep output (good for log files)
# VIM mode
bindkey -v
export KEYTIMEOUT=1

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
