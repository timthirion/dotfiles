# Path
export PATH=/usr/local/cuda/bin:$PATH
export DYLD_LIBRARY_PATH=/usr/local/cuda/lib:$DYLD_LIBRARY_PATH
export DESKTOP=/cygdrive/c/users/tthirion/desktop

# Aliases
alias ll="ls -Gla --color"

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
        export PEGASUS=/cygdrive/c/wrap/v2014/distributionVS2010/Pegasus/x64/Debug
    ;;
esac
