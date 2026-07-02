#!/bin/bash

echo "installing claude code configuration"
mkdir -p ~/.claude/themes ~/.claude/rules
ln -sf ~/dotfiles/claude/settings.json ~/.claude/settings.json
ln -sf ~/dotfiles/claude/statusline.sh ~/.claude/statusline.sh
ln -sf ~/dotfiles/claude/themes/kanso.json ~/.claude/themes/kanso.json
ln -sf ~/dotfiles/claude/rules/context7.md ~/.claude/rules/context7.md
echo "done!"
