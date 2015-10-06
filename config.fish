# No text on startup
set fish_greeting ""

# Set PATH
set -gx PATH                      \
/usr/local/bin                    \
/usr/local/sbin                   \
/bin                              \
/sbin                             \
/usr/bin                          \
/usr/sbin                         \
/usr/texbin                       \
/opt/X11/bin                      \
/usr/local/go/bin                 \
/usr/local/android-sdk/tools      \
/usr/local/android-ndk            \
/Applications/Racket\ v6.1.1/bin  \

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

# Set path to clang library (libclang.[so|dylib])
switch (uname)
  case Darwin
    set -gx CLANG_LIBRARY_PATH (dirname (xcrun -find clang))/../lib
  case Linux
    # To do
end

# Useful navigation functions
function ~;     cd ~; end
function ..;    cd ..; end
function ...;   cd ../..; end
function ....;  cd ../../..; end
function .....; cd ../../../..; end

function md; mkdir -p $argv; end

function l1; tree --dirsfirst -ChFL 1 $argv; end;
function l2; tree --dirsfirst -ChFL 2 $argv; end;
function l3; tree --dirsfirst -ChFL 3 $argv; end;
function l4; tree --dirsfirst -ChFL 4 $argv; end;
function l5; tree --dirsfirst -ChFL 5 $argv; end;
function l6; tree --dirsfirst -ChFL 6 $argv; end;

function ll1; tree --dirsfirst -ChFupDaL 1 $argv; end;
function ll2; tree --dirsfirst -ChFupDaL 2 $argv; end;
function ll3; tree --dirsfirst -ChFupDaL 3 $argv; end;
function ll4; tree --dirsfirst -ChFupDaL 4 $argv; end;
function ll5; tree --dirsfirst -ChFupDaL 5 $argv; end;
function ll6; tree --dirsfirst -ChFupDaL 6 $argv; end;

function l; l1 $argv; end
function ll; ll1 $argv; end

function emacs; /usr/local/bin/emacs $argv; end;

# One letter aliases
function a; ack $argv; end;
function e; emacs $argv; end;
function f; find . -name "*$argv*"; end;
function fg; find / -name $argv 2>/dev/null; end;
function g; git $argv; end;
function gv;
  switch (uname)
    case Darwin
      mvim $argv
    case Linux
      gvim $argv
  end;
end;
function m; make -j $CPUS_PLUS_ONE; end;
function n; ninja; end;
function v; vim $argv; end;

# Convenience scripts
function colors; /bin/bash ~/dotfiles/colors.sh; end;
function rot13; tr "a-zA-Z" "n-za-mN-ZA-M" $argv; end;

# Show git branch status
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

# Python path
set -gx PYTHONPATH                                \
~/Kitware/build/VTK/Debug                         \
~/Kitware/build/VTK/Debug/Wrapping/Python         \
~/Kitware/build/VTK/Debug/Wrapping/Python/vtk     \
~/Kitware/build/VTK/Debug/lib                     \
~/Kitware/build/ParaView/Debug/lib                \
~/Kitware/build/ParaView/Debug/lib/site-packages  \
~/Kitware/Cinema                                  \
~/Kitware/Cinema/cinema_python                    \
~/Kitware/Cinema/cinema_python/cinema_python      \

# Start tmux
tmux
