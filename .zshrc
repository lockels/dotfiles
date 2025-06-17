# external plugins
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export EDITOR='nvim'

# Aliases
alias py="python3"
alias p="printf '\e[5 q]'"
alias c="cdi"
alias ya="yazi"
alias cat="bat"
alias top="btop"
alias code="codium"
alias ls="eza --icons"
alias lt="eza --color=always --tree --level 2 --icons --git"
alias vimdiff="nvim -d"

bindkey -v

export PATH=$PATH:/Users/ef/.spicetify

function fcd() {
  local dir
  dir=$(fd --type d --max-depth 3 --exclude .git '' ~/Programming | fzf-tmux -p --reverse --header='Select a Directory')
  if [[ -n "$dir" ]]; then
    cd "$dir" && clear
    tmux send-keys Enter
  fi
}
zle -N fcd
bindkey '^P' fcd

## configure fzf colors
export FZF_DEFAULT_OPTS=" \
--color=spinner:#f5e0dc,hl:#cba6f7 \
--color=fg:#cdd6f4,header:#9ccfd8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#cba6f7"

eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"

[ -f "/Users/ef/.ghcup/env" ] && . "/Users/ef/.ghcup/env" # ghcup-env

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Cursor shape thind
printf '\e[5 q'

# pnpm
export PNPM_HOME="/Users/ef/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#

# mactex
export PATH="/opt/homebrew/opt/texlive/bin:$PATH"
