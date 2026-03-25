#!/bin/sh

# appearance

# remove press and hold key for accent
defaults write -g ApplePressAndHoldEnabled 0


# set dock to autohide
defaults write com.apple.Dock autohide -bool true; killall Dock
