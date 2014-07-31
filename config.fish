set fish_greeting ""

switch (uname)
  case Darwin
    set CORES (sysctl hw.ncpu | awk '{print $2}')
  case Linux
    set PROCESSORS (cat /proc/cpuinfo | grep processor | wc -l)
    set CORES_PER_PROCESSOR (cat /proc/cpuinfo | grep cores | head -1 | awk '{print $4}')
    set CORES (echo "$PROCESSORS * $CORES_PER_PROCESSOR" | bc -l)
end

set CORES_PLUS_ONE (math $CORES + 1)

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

function a; ack $argv; end;
function f; find . -name $argv; end;
function fg; find / -name $argv 2>/dev/null; end;
function g; git $argv; end;
function m; make -j $CORES_PLUS_ONE; end;
function n; ninja; end;
function v;
  switch (uname)
    case Darwin
      mvim $argv
    case Linux
      gvim $argv
  end;
end;

function colors; /bin/bash colors.sh; end;
function rot13; tr "a-zA-Z" "n-za-mN-ZA-M" $argv; end;

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

set VTK ~/Kitware/VTK
set PARAVIEW ~/Kitware/ParaView

set BUILD ~/Kitware/build
set VTK_DEBUG_BUILD         ~/Kitware/build/VTK/Debug/
set VTK_RELEASE_BUILD       ~/Kitware/build/VTK/Release/
set PARAVIEW_DEBUG_BUILD    ~/Kitware/build/ParaView/Debug/bin
set PARAVIEW_RELEASE_BUILD  ~/Kitware/build/ParaView/Release/bin
set RGG_DEBUG_BUILD         ~/Kitware/build/cmbnuclear/Debug/bin
set RGG_RELEASE_BUILD       ~/Kitware/build/cmbnuclear/Release/bin

tmux
