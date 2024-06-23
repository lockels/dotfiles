if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load syntax highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load auto suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/completion.zsh

# Remaps / Upgrades 
alias vim="nvim"
alias py="python3"
alias top="gotop"
alias cat="bat"
alias tree="tree -C"
alias tldr="tldr -C"
alias ls="eza --color=always --icons"
alias lt="eza --color=always --tree --level 2 --icons --git"
alias lt+="eza --color=always --tree --level 2 --long --icons --git"

bindkey "^Ø" clear-screen

# environment variables xdg
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_RUNTIME_DIR="/run/user/$UID"

# VIM mode
bindkey -v
export KEYTIMEOUT=1

export PATH="$PATH:/Users/idris/.ghcup/bin/"
export PATH="$PATH:/Users/idris/.spicetify"
export PATH="$PATH:/Users/idris/.cargo/bin"

######## Functions and custom utils ######## 

# Search and directly go into programming files using fzf/tmux
function fcd() {
  local dir
  dir=$(fd --type d --max-depth 2 --exclude .git '' ~/Desktop/Programming | fzf-tmux -p --reverse --header='Select a Directory')
  if [[ -n "$dir" ]]; then
    cd "$dir" && clear
    tmux send-keys Enter
  fi
}
zle -N fcd
bindkey '^P' fcd

# Search and open files with nvim using fzf/tmux
function ffs() {
  fd --type f --hidden --exclude .git | fzf-tmux -p --reverse --header="Open file with neovim" | xargs nvim
}
zle -N ffs
bindkey '^O' ffs

# Search configuration files
function cnf() {
  local dir
  dir=$(fd --type d --max-depth 2 --exclude .git '' ~/.config| fzf-tmux -p --reverse --header='📁 Select a configuration directory')
  if [[ -n "$dir" ]]; then
    cd "$dir"
  fi
}

# Change theme of bat command
export BAT_THEME="Catppuccin Frappe"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


## Change color of fzf to preferences
export FZF_DEFAULT_OPTS=" \
--color=spinner:#f5e0dc,hl:#cba6f7 \
--color=fg:#cdd6f4,header:#209fb5,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#cba6f7"

source ~/.config/powerlevel10k/powerlevel10k.zsh-theme

# -- the fuck -- #
eval $(thefuck --alias)

# zoxide
eval "$(zoxide init zsh)"

