# No text on startup
set fish_greeting ""

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
    echo $argv
  else
    echo (prompt_pwd)
  end
end

# Set PATH
set -gx PATH                    \
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

source "$HOME/.cargo/env.fish"

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

# Remap Ctrl+D to avoid closing the shell
bind \cd delete-char

# Use starship for prompt config
starship init fish | source

# opam configuration
source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# Start in home directory
if status is-interactive
  cd ~
end

fzf --fish | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/polycam/google-cloud-sdk/path.fish.inc" ]; . "$HOME/polycam/google-cloud-sdk/path.fish.inc"; end
