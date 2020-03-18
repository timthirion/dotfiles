# No text on startup
set fish_greeting ""

# Set PATH
set -gx PATH                            \
/anaconda3/bin                          \
/usr/local/bin                          \
/usr/local/sbin                         \
/bin                                    \
/sbin                                   \
/usr/bin                                \
/usr/sbin                               \
/Users/tt/.fastlane/bin                 \
/Users/tt/.cargo/bin/                   \

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
alias l "exa -l"
alias ll "exa -la"
alias less "bat"
alias m "make -j $CPUS_PLUS_ONE"
alias md "mkdir -p"
alias n "ninja"
alias v "/usr/bin/vim"

function fg; find / -name $argv 2>/dev/null; end;
function gv;
  switch (uname)
    case Darwin
      /usr/local/opt/macvim/bin/mvim $argv
    case Linux
      gvim $argv
  end;
end;

# Convenience scripts
function colors; /bin/bash ~/dotfiles/colors.sh; end;
function rot13; tr "a-zA-Z" "n-za-mN-ZA-M" $argv; end;

# Show git branch status
set fish_color_cwd purple
set fish_git_dirty_color red
set fish_git_not_dirty_color green

function parse_git_branch
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_diff (git diff)

  if test -n "$git_diff"
    echo (set_color $fish_git_dirty_color)$branch(set_color normal)
  else
    echo (set_color $fish_git_not_dirty_color)$branch(set_color normal)
  end
end

function fish_prompt
  if test -d .git
    printf '%s@%s %s%s%s:%s> ' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (parse_git_branch)
  else
    printf '%s@%s %s%s%s> ' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
  end
end

