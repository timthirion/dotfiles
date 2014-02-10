# Path
export PATH=/usr/local/cuda/bin:$PATH
export DYLD_LIBRARY_PATH=/usr/local/cuda/lib:$DYLD_LIBRARY_PATH
export DESKTOP=/cygdrive/c/users/tthirion/desktop

autoload -U compinit
compinit
autoload -U colors
colors

#
# Keybindings
#
bindkey -v
typeset -g -A key
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '^?' backward-delete-char
bindkey '^[[1~' beginning-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[3~' delete-char
bindkey '^[[4~' end-of-line
bindkey '^[[6~' down-line-or-history
bindkey '^[[A' up-line-or-search
bindkey '^[[D' backward-char
bindkey '^[[B' down-line-or-search
bindkey '^[[C' forward-char

#
# Colored manuals
#
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# Directory functions
..() { cd .. }
...() { cd ../.. }
....() { cd ../../.. }
.....() { cd ../../../.. }

md() { mkdir -p $@ }

l1() { tree --dirsfirst -ChFL 1 $@ }
l2() { tree --dirsfirst -ChFL 2 $@ }
l3() { tree --dirsfirst -ChFL 3 $@ }
l4() { tree --dirsfirst -ChFL 4 $@ }
l5() { tree --dirsfirst -ChFL 5 $@ }
l6() { tree --dirsfirst -ChFL 6 $@ }

ll1() { tree --dirsfirst -ChFupDaL 1 $@ }
ll2() { tree --dirsfirst -ChFupDaL 2 $@ }
ll3() { tree --dirsfirst -ChFupDaL 3 $@ }
ll4() { tree --dirsfirst -ChFupDaL 4 $@ }
ll5() { tree --dirsfirst -ChFupDaL 5 $@ }
ll6() { tree --dirsfirst -ChFupDaL 6 $@ }

l() { l1 $@ }
ll() { ll1 $@ }

#
# Aliases
#
v() { vim $@ }
g() { git $@ }

#
# Prompt
#
PROMPT="
%{$fg[red]%}%n%{$reset_color%} at %{$fg[blue]%}%m%{$reset_color%} in %{$fg_bold[green]%}%3d%{$reset_color%}
%{$reset_color%}%# "
#RPROMPT="[%{$fg_no_bold[yellow]%}%?%{$reset_color%}]"

#
# Platform-specific initialization
#
case $(uname) in
    Darwin)
        [[ -z "$TMUX" ]] && exec tmux
    ;;
    Linux)
        [[ -z "$TMUX" ]] && exec tmux
    ;;
    *)
        export DESKTOP=/cygdrive/c/users/tthirion/desktop/
        export WRAP=/cygdrive/c/wrap/geosource/
        export PEGASUS=/cygdrive/c/wrap/v2014/distributionVS2010/Pegasus/x64/Debug/
        export SCRATCH=/cygdrive/s/
    ;;
esac
