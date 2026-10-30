#!/bin/bash

set -o pipefail

# Bootstrap script for dotfiles installation
# This script clones the dotfiles repository and sets up the dotfiles command

# Use custom repo if specified, otherwise use default
DOTFILES_REPO="${DOTFILES_REPO:-omakasui/omadots}"
DOTFILES_DIR="$HOME/.cfg"

# Colors for output
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
CYAN='\e[36m'
RESET='\e[0m'

# Check if already exists .cfg folders, if yes ask to remove
if [ -d "$DOTFILES_DIR" ]; then
  echo -e "${YELLOW}\nWarning: Dotfiles directory already exists at $DOTFILES_DIR${RESET}"
  read -p $'\e[36mDo you want to remove it and re-clone? (y/N): \e[0m' choice < /dev/tty
  choice=${choice:-N}
  case "$choice" in
    y|Y ) rm -rf "$DOTFILES_DIR" ;;
    n|N ) echo -e "${YELLOW}Skipping clone. Proceeding to setup dotfiles command.${RESET}" ;;
    * ) echo -e "${RED}Invalid choice. Aborting installation.${RESET}"; exit 1 ;;
  esac
fi

# Check if git is installed
if ! command -v git &>/dev/null; then
  echo -e "${RED}\nGit is not installed. Please install Git and rerun this script.${RESET}"
  exit 1
fi

# Clone the dotfiles repository if not skipped
if [ ! -d "$DOTFILES_DIR" ]; then
  echo -e "${GREEN}\nCloning omadots from https://github.com/$DOTFILES_REPO...${RESET}"
  if git clone "https://github.com/$DOTFILES_REPO.git" "$DOTFILES_DIR" >/dev/null 2>&1; then
    echo -e "${GREEN}✓ Dotfiles cloned successfully!${RESET}"
  else
    echo -e "${RED}✗ Failed to clone dotfiles repository.${RESET}"
    exit 1
  fi
fi

# Check if it's already in PATH
if ! echo "$PATH" | grep -q "$DOTFILES_DIR/bin"; then
  # .bashrc
  if [ -f ~/.bashrc ]; then
    echo "export PATH=\"\$HOME/.cfg/bin:\$PATH\"" >> ~/.bashrc
  fi

  # .zshrc
  if [ -f ~/.zshrc ]; then
    echo "export PATH=\"\$HOME/.cfg/bin:\$PATH\"" >> ~/.zshrc
  fi

  echo -e "${GREEN}✓ Dotfiles command added to PATH!${RESET}"
else
  echo -e "${YELLOW}Dotfiles command already in PATH, skipping PATH setup.${RESET}"
fi

# Finish installation
echo -e "${GREEN}✓ Dotfiles installation completed!${RESET}"