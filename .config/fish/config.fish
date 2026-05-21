# No text on startup
set fish_greeting ""

# Let fish control terminal titles, not Claude
set -gx CLAUDE_CODE_DISABLE_TERMINAL_TITLE 1

# Set a fun term title
functions -q fish_title;
function fish_title
  # Choose one
  #echo "ᕙ(⇀‸↼‶)ᕗ" # Flex
  #echo "[¬º-°]¬"  # Zombie
  #echo 'ᕕ( ᐛ )ᕗ'  # Strut
  #echo ''        # Apple
  #echo 'ಠ_ಠ'      # Disapproval
  #echo ''          # Nada
  #echo (status current-command) $PWD
  # $argv contains the command when running, empty at prompt
  if test -n "$argv"
    echo $argv (string replace $HOME '~' $PWD)
  else
    echo (prompt_pwd)
  end
end


# Set PATH
set -gx PATH                    \
$HOME/.fzf/bin                  \
$HOME/.pyenv/shims              \
/opt/homebrew/bin               \
/opt/homebrew/sbin              \
/opt/homebrew/opt/node@20/bin   \
/usr/local/bin                  \
/usr/local/sbin                 \
/bin                            \
/sbin                           \
/usr/bin                        \
/usr/sbin                       \
$HOME/.local/bin                \
$HOME/.cargo/bin                \
/Library/TeX/texbin             \
$HOME/google-cloud-sdk/bin      \

set -gx ANDROID_HOME $HOME/Library/Android/sdk

# Gcloud key locations
set -gx GOOGLE_APPLICATION_CREDENTIALS_PRODUCTION $HOME/polycam/keys/tim-dev-prod.json
set -gx GOOGLE_APPLICATION_CREDENTIALS_STAGING $HOME/polycam/keys/tim-dev-staging.json

# Ruby
status --is-interactive; and rbenv init - fish | source

# Aliases
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."
alias a "ack"
alias c "bat"
alias cat "bat"
alias d "git diff"
alias du "dust"
alias e "emacs"
alias f "fzf"
alias g "git"
alias grep "rg"
alias hexdump "hexyl"
alias l "eza -lF --group-directories-first"
alias ll "eza -alF --group-directories-first"
alias less "bat"
alias m "make -j $CPUS_PLUS_ONE"
alias md "mkdir -p"
alias n "ninja"
alias uuid "uuidgen"
alias v "nvim"

# Modern CLI extras (cross-platform; guarded so a missing tool never breaks the shell).
# Ubuntu's apt ships fd/bat under different binary names than Homebrew does.
if not type -q fd; and type -q fdfind
  alias fd fdfind
end
if not type -q bat; and type -q batcat
  alias bat batcat
end
type -q lazygit; and alias lg lazygit
type -q btop; and alias top btop

# Remap Ctrl+D to avoid closing the shell
bind \cd delete-char

# Use starship for prompt config
starship init fish | source

# opam configuration
source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# Symlink platform and machine-specific Ghostty configs
if status is-interactive
  set -l os (uname -s)
  set -l host (hostname -s)

  switch $os
    case "Linux"
      # Linux uses config.linux directly (font size baked in)
      ln -snf ~/.config/ghostty/config.linux ~/.config/ghostty/config.local
    case "Darwin"
      # macOS uses config.macos which then loads machine-specific settings
      ln -snf ~/.config/ghostty/config.macos ~/.config/ghostty/config.local
      switch $host
        case "tt-mini"
          ln -snf ~/.config/ghostty/config.desktop ~/.config/ghostty/config.macos.machine
        case "tt-macbook"
          ln -snf ~/.config/ghostty/config.laptop ~/.config/ghostty/config.macos.machine
      end
  end
end

fzf --fish | source

# zoxide: frecency-based cd  ->  `z <partial>` jumps, `zi` for an interactive pick
type -q zoxide; and zoxide init fish | source

# atuin: searchable/syncable shell history on Ctrl-R (loaded after fzf so it owns Ctrl-R;
# up-arrow left as fish's default prefix search to avoid surprises)
type -q atuin; and atuin init fish --disable-up-arrow | source

# yazi: `y` opens the file manager and cd's to wherever you quit it
if type -q yazi
  function y
    set -l tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd < "$tmp"; and test -n "$cwd"; and test "$cwd" != "$PWD"
      builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
  end
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/polycam/google-cloud-sdk/path.fish.inc" ]; . "$HOME/polycam/google-cloud-sdk/path.fish.inc"; end
