#!/bin/bash

echo "installing claude code"
if command -v claude >/dev/null 2>&1; then
  echo "claude already installed, skipping"
else
  echo "no claude found, installing now..."
  curl -fsSL https://claude.ai/install.sh | bash
fi

echo "linking claude code configuration"
mkdir -p ~/.claude/themes ~/.claude/rules
ln -sf ~/dotfiles/claude/settings.json ~/.claude/settings.json
ln -sf ~/dotfiles/claude/statusline.sh ~/.claude/statusline.sh
ln -sf ~/dotfiles/claude/themes/kanso.json ~/.claude/themes/kanso.json
ln -sf ~/dotfiles/claude/rules/context7.md ~/.claude/rules/context7.md
echo "done!"
