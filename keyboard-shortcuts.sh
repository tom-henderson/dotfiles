#!/bin/bash

# System Preferences Keyboard Shortcuts

# @ = Command
# $ = Shift
# ~ = Alt
# ^ = Ctrl

# Specify submenus like Format->Indentation->Increase as \033Format\033Indentation\033Increase

# Disable a shortcut by assigning \u200b (ZERO WIDTH SPACE)

defaults write -g NSUserKeyEquivalents '{
	"Minimize"="\u200b";
	"Minimize All"="\u200b";
	"Show Help menu"="@/";
	"Save as PDF…"="@P";
	"System Preferences..."="$@,";
}'

defaults write -app Chrome NSUserKeyEquivalents '{
	"Print Using System Dialog..."="@P";
}'
