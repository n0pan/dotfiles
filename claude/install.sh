#!/bin/bash

echo "installing claude code configuration"
mkdir -p ~/.claude/themes
ln -sf ~/dotfiles/claude/themes/kanso.json ~/.claude/themes/kanso.json
echo "done!"
