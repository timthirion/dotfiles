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
  echo ''          # Nada
end

# Set PATH
set -gx PATH                    \
$HOME/.pyenv/shims              \
/opt/homebrew/bin               \
/opt/homebrew/sbin              \
/usr/local/bin                  \
/usr/local/sbin                 \
/bin                            \
/sbin                           \
/usr/bin                        \
/usr/sbin                       \
/Users/tt/.local/bin            \
$HOME/.cargo/bin                \
/Library/TeX/texbin             \
/usr/local/opt/qt5/bin          \
/opt/homebrew/opt/node@20/bin   \
/Users/tt/google-cloud-sdk/bin  \

set -gx ANDROID_HOME $HOME/Library/Android/sdk
set -gx Qt5_DIR /usr/local/Cellar/qt/5.12.3

# Gcloud key locations
set -gx GOOGLE_APPLICATION_CREDENTIALS_PRODUCTION $HOME/polycam/keys/tim-dev-prod.json
set -gx GOOGLE_APPLICATION_CREDENTIALS_STAGING $HOME/polycam/keys/tim-dev-staging.json

# Ruby (macOS only)
#switch (uname)
#  case Darwin
#    source (brew --prefix)/Cellar/chruby-fish/1.0.0/share/fish/vendor_functions.d/chruby.fish
#    source (brew --prefix)/Cellar/chruby-fish/1.0.0/share/fish/vendor_conf.d/chruby_auto.fish
#    chruby ruby-3.1.3
#end

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
#alias v "vim"

function fg; find / -name $argv 2>/dev/null; end;

# gvim
switch (uname)
    case Darwin
        function gv --wraps vim
          /usr/local/opt/macvim/bin/mvim $argv
        end;
    case Linux
        function gv --wraps vim
        gvim $argv
    end;
end;

# Remap Ctrl+D to avoid closing the shell
bind \cd delete-char

# Convenience scripts
function colors; /bin/bash ~/dotfiles/.scripts/colors.sh; end;
function rot13; tr "a-zA-Z" "n-za-mN-ZA-M" $argv; end;

# Function to search for available python virtualenvs then activate the
# selection
function activate;
    set env (ls ~/.venv/ | fzf)
    set path "$HOME/.venv/$env/bin/activate.fish"
    if test -f $path
        source $path
    end
end;

# Function to list all git branches then delete the selected branch
function trim;
    set repo_exists (git rev-parse --is-inside-work-tree 2>/dev/null)
    if test "$repo_exists" != "true"
        echo "No git repostiory found in current directory"
        return
    end
    set branch_count (git branch | grep --invert-match '\*' | count)
    if test $branch_count -eq 0
        echo "Only current branch exists"
        return
    end
    set empty (git branch |
                grep --invert-match '\*' |
                cut -c 3- |
                fzf --multi --preview="git log {} --" |
                xargs git branch --delete --force)
end;

# Use starship for prompt config
starship init fish | source

# opam configuration
source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# Start in home directory
if status is-interactive
  cd ~
end

fzf --fish | source
