# Pre install
## Install brew

'''
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
'''

## Install [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#macos)

'''
brew install zsh
'''

## Install [o-my-zsh](https://arc.net/l/quote/atxgknrq)

'''
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
'''

# stow

stow nvim
stow tmux
stow zsh
stow 

# Iterm2
Open iTerm2 settings (⌘,) and go to General > Preferences. Enable both of the options, and specify the folder where you want to save them:

Save iTerm2 Settings

- Specify the preferences directory
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/.dotfiles/System/iTerm/settings"

- Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
