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

set fish_greeting ""

set RGI_ABI darwin64-gcc-4.0
set DEPENDENCY_PATH /Users/tim/src/deps/darwin64-gcc-4.0
set P4CLIENT mac-mini
set P4USER tthirion
set STUDIO_HOME /Users/tim/src
set WRAP_HOME "$STUDIO_HOME/trunk"

tmux
