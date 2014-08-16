#!/bin/bash

# System Preferences Keyboard Shortcuts

# @ = Command
# $ = Shift
# ~ = Alt
# ^ = Ctrl

# Specify submenus like Format->Indentation->Increase as \033Format\033Indentation\033Increase

# Disable a shortcut by assigning \u200b (ZERO WIDTH SPACE)

defaults write -g NSUserKeyEquivalents '{
}'

defaults write -app Google\ Chrome NSUserKeyEquivalents '{
}'
