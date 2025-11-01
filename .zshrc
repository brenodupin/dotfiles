# Oh-My-Zsh
export ZSH="$HOME/.oh-my-zsh"

# Conditional keychain plugin for non-macOS systems
if [[ "$OSTYPE" != "darwin"* ]]; then
  plugins=(git zsh-autosuggestions zsh-syntax-highlighting keychain)
  zstyle :omz:plugins:keychain agents ssh
  zstyle :omz:plugins:keychain identities id_rsa
else
  plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
fi

source $ZSH/oh-my-zsh.sh
# Path
export PATH="$PATH:$HOME/.local/bin"

# Starship prompt
eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init zsh --cmd cd)"

# Source local tools (optional)
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Source end machine-specific config
[[ -f ~/.zshrc.end ]] && source ~/.zshrc.end
