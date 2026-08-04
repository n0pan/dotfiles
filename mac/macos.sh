#!/bin/sh
# based off of: https://github.com/ulwlu/dotfiles/blob/master/system/macos.sh

# system preferences

## general

### set appearance to dark mode
defaults delete .GlobalPreferences AppleInterfaceStyleSwitchesAutomatically > /dev/null 2>&1
defaults write .GlobalPreferences AppleInterfaceStyle -string "Dark"

### unset accent color (multicolor)
defaults delete .GlobalPreferences AppleAccentColor 2>/dev/null || true

### set highlight color to red
defaults write .GlobalPreferences AppleHighlightColor -string "1.000000 0.733333 0.721569 Red"

### close windows when quitting an app
defaults write .GlobalPreferences NSQuitAlwaysKeepsWindows -bool false

### allow handoff
### note: ByHost prefs are keyed to the machine's hardware UUID, so these must be
### re-applied after a migration or logic board swap
defaults -currentHost write com.apple.coreservices.useractivityd ActivityReceivingAllowed -bool true
defaults -currentHost write com.apple.coreservices.useractivityd ActivityAdvertisingAllowed -bool true

# ----------------------------------------------------------

## dock & menu bar

### set dock size
defaults write com.apple.dock tilesize -int 62

### remove magnification
defaults delete com.apple.dock magnification 2>/dev/null || true

### minimize using genie
defaults write com.apple.dock mineffect -string "genie"

### animate opening applications
defaults write com.apple.dock launchanim -bool true

### automatically hide/show the dock
defaults write com.apple.dock autohide -bool true

### no delay before the dock slides back in
defaults write com.apple.dock autohide-delay -float 0

### show recent applications in dock
defaults write com.apple.dock show-recents -bool true

### don't automatically hide/show the menu bar
defaults write .GlobalPreferences _HIHideMenuBar -bool false

### bottom-right hot corner opens quick note
defaults write com.apple.dock wvous-br-corner -int 14
defaults delete com.apple.dock wvous-br-modifier 2>/dev/null || true

# ----------------------------------------------------------

## mission control

### don't automatically rearrange spaces
defaults write com.apple.dock mru-spaces -bool false

### switch to a space with open windows for the app
defaults write .GlobalPreferences AppleSpacesSwitchOnActivate -bool true

### don't group windows by application
defaults write com.apple.dock expose-group-apps -bool false

### displays have separate spaces
defaults write com.apple.spaces spans-displays -bool false

# ----------------------------------------------------------

## siri

### enable siri
defaults write com.apple.assistant.support "Assistant Enabled" -bool true

### keep siri out of the menu bar
defaults write com.apple.Siri StatusMenuVisible -bool false

### disable the "hey siri" voice trigger
defaults write com.apple.Siri VoiceTriggerUserEnabled -bool false

# ----------------------------------------------------------

## spotlight

### disable spotlight in menu bar
defaults -currentHost write com.apple.Spotlight MenuItemHidden -bool true

# ----------------------------------------------------------

## language/region

### set to 24-hour time format
defaults write .GlobalPreferences AppleICUForce12HourTime -bool false

### set temperature to celsius
defaults write .GlobalPreferences AppleTemperatureUnit -string "Celsius"

### menu bar clock: show the day, flash the time separators, no seconds
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool true
defaults write com.apple.menuextra.clock FlashDateSeparators -bool true
defaults write com.apple.menuextra.clock ShowSeconds -bool false

# ----------------------------------------------------------

## keyboard

### set key repeat to fastest
defaults write .GlobalPreferences InitialKeyRepeat -int 12

### set delay until repeat to fastest
defaults write .GlobalPreferences KeyRepeat -int 2

### holding a key repeats it instead of showing the accent picker
defaults write .GlobalPreferences ApplePressAndHoldEnabled -bool false

### keep autocapitalize and the double-space period shortcut
defaults write .GlobalPreferences NSAutomaticCapitalizationEnabled -bool true
defaults write .GlobalPreferences NSAutomaticPeriodSubstitutionEnabled -bool true

# ----------------------------------------------------------

## finder

### don't show disks or removable media on desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

### open folders in tabs
defaults write com.apple.finder FinderSpawnTab -bool true

### new finder windows show recents
### note: NewWindowTarget takes precedence; NewWindowTargetPath only applies when it is PfLo
defaults write com.apple.finder NewWindowTarget -string "PfAF"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

### show filename extensions
defaults write -g AppleShowAllExtensions -bool true

### show as list
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

### sort folders above files
defaults write com.apple.finder _FXSortFoldersFirst -bool true

### show path bar
defaults write com.apple.finder ShowPathbar -bool true

### show status bar
defaults write com.apple.finder ShowStatusBar -bool true

### show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

### remove items from the trash after 30 days
defaults write com.apple.finder FXRemoveOldTrashItems -bool true

# ----------------------------------------------------------

## dock contents

dock_app() {
  defaults write com.apple.dock persistent-apps -array-add "<dict>
    <key>tile-data</key><dict>
      <key>file-data</key><dict>
        <key>_CFURLString</key><string>${1}</string>
        <key>_CFURLStringType</key><integer>0</integer>
      </dict>
    </dict>
  </dict>"
}

dock_folder() {
  defaults write com.apple.dock persistent-others -array-add "<dict>
    <key>tile-data</key><dict>
      <key>file-data</key><dict>
        <key>_CFURLString</key><string>${1}</string>
        <key>_CFURLStringType</key><integer>0</integer>
      </dict>
      <key>file-type</key><integer>2</integer>
    </dict>
    <key>tile-type</key><string>directory-tile</string>
  </dict>"
}

### rebuild the dock from scratch
defaults delete com.apple.dock persistent-apps 2>/dev/null || true
defaults delete com.apple.dock persistent-others 2>/dev/null || true

dock_app "file:///Applications/Fantastical.app/"
dock_app "file:///Applications/Firefox%20Developer%20Edition.app/"
dock_app "file:///Applications/kitty.app/"
dock_app "file:///System/Applications/Siri%20AI.app/"

dock_folder "file://${HOME}/Downloads/"

# ----------------------------------------------------------

### kill preferences and dock
killall cfprefsd 2>/dev/null
killall Dock 2>/dev/null

### clear cache
for app in \
  "cfprefsd" \
  "Activity Monitor" "Address Book" "Calendar" \
  "Contacts" "Dock" "Finder" "Mail" "Messages" \
  "SystemUIServer" "Terminal" "Transmission" "iCal"; do
  killall "${app}" 2>/dev/null
done
