# Dotfiles Setup Guide

(made by Claude)
RPI case -> [Argon ONE](https://github.com/okunze/Argon40-ArgonOne-Script)
## Setup Instructions

### 1. Install Core Tools

Ubuntu:
```bash
sudo apt update
sudo apt install -y zsh git curl stow wget zstd fontconfig
```

macOS:
```bash
brew install zsh git curl stow wget zstd
```

### 2. Install required tools

**Oh-My-Zsh**
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

**Oh-My-Zsh Plugins**
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

**Starship**
```bash
curl -sS https://starship.rs/install.sh | sh
```

**Zoxide**
```bash
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
```

**JetBrains Mono Nerd Font**

Linux:
```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip
rm JetBrainsMono.zip
fc-cache -fv
```

macOS:
```bash
brew install font-jetbrains-mono-nerd-font
```

### 3. Optional stuff

**uv**
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

**Miniconda:**

Linux:
```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
```

macOS:
```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh
bash Miniconda3-latest-MacOSX-arm64.sh
```
Dont forget to NOT add conda initialization to `.zshrc` directly, as it's already in `.zshrc.end`, being user agnostic.

**SDKMAN:**
```bash
curl -s "https://get.sdkman.io" | bash
```
SDKMAN initialization is already included in `.zshrc.end`


### 4. Clone Dotfiles and GNU Stow
```bash
cd ~
git clone https://github.com/brenodupin/dotfiles.git
cd dotfiles
stow --adopt .
```

