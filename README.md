# dotfiles
<img width="1270" height="929" alt="image" src="https://github.com/user-attachments/assets/4429320c-a2cf-4e14-8695-cb8695e4867d" />


## Installation

This repo contains configuration files that can be used to setup a new Mac.

```bash
git clone git@github.com:n0pan/dotfiles.git ~/dotfiles
cd ~/dotfiles
sh install.sh
```

Neovim plugins are installed automatically via lazy.nvim on first launch.

## Notes

- The `workfiles` submodule requires SSH access to `git@github.com:n0pan/workfiles.git`
- [PragmataPro Mono Liga](https://fsd.it/shop/fonts/pragmatapro/) (primary Kitty font) is a paid font and must be installed manually
- `bettermouse/settings.plist` is a BetterMouse settings export (the app's own `bm_cfg_<ver>.plist`, renamed) holding the MX Master button/wheel config and per-app button mappings. `install.sh` does not restore it — after the cask installs, import it from within BetterMouse's own settings. It mirrors the `com.naotanhaocan.BetterMouse` defaults domain, but don't `defaults import` it wholesale: the live domain also holds license and auto-update keys that the export omits

