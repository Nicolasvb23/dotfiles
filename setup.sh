#!/bin/sh

echo "Setting up your Mac..."

echo "installing Oh My Zsh..."
# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

echo "installing Homebrew..."
# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "Generating symlinks..."

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -sw $HOME/dotfiles/.zshrc $HOME/.zshrc

rm -rf $HOME/.config/nvim
ln -sw $HOME/dotfiles/nvim $HOME/.config/nvim

rm -rf $HOME/.gitconfig
ln -sw $HOME/dotfiles/.gitconfig $HOME/.gitconfig

rm -rf $HOME/.gitignore
ln -sw $HOME/dotfiles/.gitignore $HOME/.gitignore

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
echo "Installing brew formulas..."
brew tap homebrew/bundle
brew bundle --file ./Brewfile

# Create directories
mkdir $HOME/Desktop/Work
mkdir $HOME/Desktop/Personal
