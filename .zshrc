export PATH="$PATH:/home/bishr/.local/bin"
export PATH="$PATH:/home/bishr/Scripts"
export PATH="$HOME/.local/bin${PATH:+:${PATH}}"
export PATH="${PATH}:${HOME}/.local/bin/"
export PATH="$PATH:/home/bishr/.local/share/gem/ruby/3.0.0/bin"
export PATH="$PATH:${HOME}/.emacs.d/bin"

# source ~/zshplg/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/zshplg/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/zshplg/zsh-autosuggestions/zsh-autosuggestions.zsh
# source zshplg/zsh-git-prompt/zshrc.sh
# source ~/zshplg/powerlevel10k/powerlevel10k.zsh-theme
source $HOME/.oh-my-zsh/custom/plugins/zsh-histdb/sqlite-history.zsh

autoload -Uz add-zsh-hook

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

### "nvim" as manpager
export MANPAGER="nvimpager"
export EDITOR="nvim"

# Network
alias hack="doas wifite --clients-only --new-hs -m"
alias conn="nmcli dev wifi connect"
alias connh="nmcli dev wifi connect <ssid> password <passwd> hidden yes"
alias wifi="nmcli dev wifi list"
alias hotspot="nmcli dev wifi hotspot ifname wlo1 ssid Bishr password 18273645"
alias png3="ping -c 3 google.com"
alias hotspotd="nmcli device disconnect wlo1"
alias S="doas pacman -S"
alias vpnc="doas protonvpn c -f"
alias vpnd="doas protonvpn d"

# listing
alias l="ls -lh"
alias la="exa -lah --icons"
alias NM="doas NetworkManager"

# clipbloard
alias clp="xclip -selection c"
alias pclp="xclip -selection c -o"

# VIM mode
bindkey -v
export KEYTIMEOUT=1

# GIT
alias ga="git add"
alias gs="git status"
alias gr="git reset"
alias grh="git reset --hard"
alias gbl="git branch"
alias gb="git checkout"
alias gbn="git checkout -b"
alias gm="git checkout master"
alias gpu="git push"
alias gpl="git pull"
alias gcl="git clone"
alias gc="git commit"
alias gcm="git commit -m "
alias gl="git log"

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
eval "$(lua /home/bishr/z.lua/z.lua --init zsh)"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' %b'
 
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%F{#dfdfdf}${PWD/#$HOME/~} %F{#4db5bd}${vcs_info_msg_0_}> %F{#ffffff}'
# export PROMPT="%F{#dfdfdf}%~ %F{#ff6c6b} ${vcs_info_msg_0_}> "


# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
