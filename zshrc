export PATH=/usr/local/cuda/bin:$PATH
export DYLD_LIBRARY_PATH=/usr/local/cuda/lib:$DYLD_LIBRARY_PATH

case $(uname) in
	Darwin)
		alias ll="ls -Gla"
	;;
esac

[[ -z "$TMUX" ]] && exec tmux
