function activate --description "Search for available python virtualenvs then activate the selection"
    set env (ls ~/.venv/ | fzf)
    set path "$HOME/.venv/$env/bin/activate.fish"
    if test -f $path
        source $path
    end
end