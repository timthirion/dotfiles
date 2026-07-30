# Brewfile — macOS terminal toolchain.
#   brew bundle --file=~/dotfiles/Brewfile
# Idempotent: brew skips anything already installed.

# Shell + prompt
brew "fish"
brew "starship"
brew "tmux"

# Editors
brew "neovim"

# Navigation / search / listing
brew "fzf"
brew "ripgrep"
brew "fd"
brew "eza"
brew "bat"
brew "zoxide"

# History, git, monitor, files, fetch
brew "atuin"
brew "lazygit"
brew "btop"
brew "yazi"
brew "fastfetch"

# Diffs
brew "difftastic"

# Terminal
cask "ghostty"

# No font cask: SpaceMono Nerd Font lives in .assets/fonts and is installed by
# hand into ~/Library/Fonts. The cask can't coexist with those files -- it
# aborts on "existing Font is different" because it ships a newer release than
# the copies committed here.
