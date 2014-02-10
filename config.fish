set fish_greeting ""

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

function v; vim $argv; end;
function g; git $argv; end;

function colors; /bin/bash colors.sh; end;
function rot13; tr "a-zA-Z" "n-za-mN-ZA-M" $argv; end;

set RGI_ABI ios
set DEPENDENCY_PATH /Users/tim/wrap/deps/$RGI_ABI
set P4CLIENT mac-mini
set P4USER tthirion
set STUDIO_HOME /Users/tim/wrap
set WRAP_HOME "$STUDIO_HOME/trunk"
set TRUNK "$WRAP_HOME"
set WRAP $WRAP_HOME/..

tmux
