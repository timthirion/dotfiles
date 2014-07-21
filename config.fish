set fish_greeting ""

set CORES (sysctl hw.ncpu | awk '{print $2}')
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

tmux
