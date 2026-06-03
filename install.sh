#!/usr/bin/env bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# check for git
if ! command -v git &>/dev/null; then
  echo "Error: git no está instalado"
  exit 1
fi

echo "Instalando configs..."

mkdir -p "$HOME/.config"

for dir in "$DOTFILES_DIR/config"/*; do
  name=$(basename "$dir")
  rm -rf "$HOME/.config/$name"
  ln -s "$dir" "$HOME/.config/$name"
  echo "-> $name"
done

for file in "$DOTFILES_DIR/shell"/.*; do
  name=$(basename "$file")

  [[ "$name" == "." || "$name" == ".." ]] && continue

  rm -f "$HOME/$name"
  ln -s "$file" "$HOME/$name"
  echo "-> $name"
done

# omz
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Instalando Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# p10k
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
fi

#  plugins omz
plugins_dir="$ZSH_CUSTOM/plugins"
[ ! -d "$plugins_dir/zsh-autosuggestions" ] && git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git "$plugins_dir/zsh-autosuggestions"
[ ! -d "$plugins_dir/zsh-syntax-highlighting" ] && git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$plugins_dir/zsh-syntax-highlighting"
[ ! -d "$plugins_dir/zsh-completions" ] && git clone --depth=1 https://github.com/zsh-users/zsh-completions.git "$plugins_dir/zsh-completions"
[ ! -d "$plugins_dir/history-substring-search" ] && git clone --depth=1 https://github.com/zsh-users/zsh-history-substring-search.git "$plugins_dir/history-substring-search"
[ ! -d "$plugins_dir/fzf-tab" ] && git clone --depth=1 https://github.com/Aloxaf/fzf-tab.git "$plugins_dir/fzf-tab"

# fzf
if ! command -v fzf &>/dev/null; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --all --no-bash --no-fish
fi

echo "Listo"
