#!/bin/sh

# appearance
# set system accent color to red
defaults write .GlobalPreferences AppleAccentColor -int 0

# remove press and hold key for accent
defaults write -g ApplePressAndHoldEnabled 0


# defaults write .GlobalPreferences AppleHighlightColor -string "1.000000 0.733333 0.721569 Red"



# set dock to autohide
defaults write com.apple.Dock autohide-delay -float 0.001; killall Dock
