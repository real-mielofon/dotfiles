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
