#!/bin/bash

brew install git
brew install stow
brew install zsh-syntax-highlighting powerlevel10k fzf zoxide thefuck fd eza
brew install iterm2 tmux 
brew install neovim

git clone https://github.com/junegunn/fzf-git.sh.git
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
