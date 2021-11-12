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
set -gx PATH                                 \
/anaconda3/bin                               \
/usr/local/bin                               \
/usr/local/sbin                              \
/bin                                         \
/sbin                                        \
/usr/bin                                     \
/usr/sbin                                    \
/Users/tt/.fastlane/bin                      \
/Users/tt/.cargo/bin/                        \
/Library/TeX/texbin/                         \
/Users/tt/kw/Intuitive/depot_tools           \
/Users/tt/Library/Android/sdk/platform-tools \
/Users/tt/Library/Android/sdk/tools          \
/usr/local/opt/qt5/bin                       \
/Users/tt/kw/build/itk/bin

set -gx Qt5_DIR /usr/local/Cellar/qt/5.12.3

# Determine number of processor cores available
switch (uname)
  case Darwin
    set CPUS (sysctl -n hw.ncpu)
  case Linux
    set CPUS (cat /proc/cpuinfo | grep processor | wc -l)
    set CORES_PER_CPU (cat /proc/cpuinfo | grep cores | head -1 | awk '{print $4}')
    set TOTAL_CORES (echo "$PROCESSORS * $CORES_PER_PROCESSOR" | bc -l)
end
set CPUS_PLUS_ONE (math $CPUS + 1)

# Aliases
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."
alias a "ack"
alias c "bat"
alias cat "bat"
alias du "dust"
alias e "emacs"
alias emacs "/usr/local/bin/emacs"
alias f "fzf"
alias g "git"
alias grep "rg"
alias hexdump "hexyl"
alias l "exa -lF --group-directories-first"
alias ll "exa -alF --group-directories-first"
alias less "bat"
alias m "make -j $CPUS_PLUS_ONE"
alias md "mkdir -p"
alias n "ninja"
alias v "/usr/bin/vim"

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
function colors; /bin/bash ~/dotfiles/colors.sh; end;
function rot13; tr "a-zA-Z" "n-za-mN-ZA-M" $argv; end;

# Use starship for prompt config
starship init fish | source
