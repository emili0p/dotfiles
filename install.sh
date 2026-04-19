#!/usr/bin/env bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

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

echo "Listo"
