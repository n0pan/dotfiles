#!/bin/sh
# based off of: https://github.com/ulwlu/dotfiles/blob/master/system/macos.sh

# system preferences

## general

### set appearance to dark mode
defaults delete .GlobalPreferences AppleInterfaceStyleSwitchesAutomatically > /dev/null 2>&1
defaults write .GlobalPreferences AppleInterfaceStyle -string "Dark"

### set system accent color to red
defaults write .GlobalPreferences AppleAccentColor -int 0

### set highlight color to red
defaults write .GlobalPreferences AppleHighlightColor -string "1.000000 0.733333 0.721569 Red"

### close windows when quitting an app
defaults write .GlobalPreferences NSQuitAlwaysKeepsWindows -bool false

### allow handoff
defaults -currentHost write com.apple.coreservices.useractivityd.plist ActivityReceivingAllowed -bool true
defaults -currentHost write com.apple.coreservices.useractivityd.plist ActivityAdvertisingAllowed -bool true

# ----------------------------------------------------------

## dock & menu bar

### set dock size
defaults write com.apple.dock tilesize -int 20

### remove magnification
defaults delete com.apple.dock magnification

### minimize using genie
defaults write com.apple.dock mineffect -string "genie"

### animate opening applications
defaults write com.apple.dock launchanim -bool true

### automatically hide/show the dock
defaults write com.apple.dock autohide -bool true

### don't show recent applications in dock
defaults write com.apple.dock show-recents -bool false

### automatically hide/show the menu bar
defaults write .GlobalPreferences _HIHideMenuBar -bool true

# ----------------------------------------------------------

## mission control

### don't automatically rearrange spaces
defaults write com.apple.dock mru-spaces -bool false

### switch to a space with open windows for the app
defaults write .GlobalPreferences AppleSpacesSwitchOnActivate -bool true

### don't group windows by application
defaults write com.apple.dock expose-group-apps -bool false

### displays have separate spaces
defaults write com.apple.spaces spans-displays -bool true

# ----------------------------------------------------------

## siri

### disable siri
defaults write com.apple.assistant.support.plist "Assistant Enabled" -bool false

# ----------------------------------------------------------

## spotlight

### disable spotlight in menu bar
defaults write ~/Library/Preferences/ByHost/com.apple.Spotlight MenuItemHidden -bool false

# ----------------------------------------------------------

## language/region

### set to 24-hour time format
defaults delete .GlobalPreferences AppleICUForce12HourTime

### set temperature to celsius
defaults write .GlobalPreferences AppleTemperatureUnit -string "Celsius"

# ----------------------------------------------------------

## keyboard

### set key repeat to fastest
defaults write .GlobalPreferences InitialKeyRepeat -int 15

### set delay until repeat to fastest
defaults write .GlobalPreferences KeyRepeat -int 2

# ----------------------------------------------------------

## finder

### don't show hard disks on desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false

### open folders in tabs
defaults write com.apple.finder FinderSpawnTab -bool true

### new finder show home
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

### show filename extensions
defaults write -g AppleShowAllExtensions -bool true

### show as list
defaults write com.apple.Finder FXPreferredViewStyle -string Flwv

### show path bar
defaults write com.apple.finder ShowPathbar -bool true

### show status bar
defaults write com.apple.finder ShowStatusBar -bool true

### show hidden files
defaults write com.apple.finder AppleShowAllFiles true

# ----------------------------------------------------------

### remove all persistent-apps on dock
defaults delete com.apple.dock persistent-apps

### kill preferences and dock
killall cfprefsd
killall Dock

### clear cache
for app in \
  "cfprefsd" \
  "Activity Monitor" "Address Book" "Calendar" \
  "Contacts" "Dock" "Finder" "Mail" "Messages" \
  "SystemUIServer" "Terminal" "Transmission" "iCal"; do
  killall "${app}"
done
