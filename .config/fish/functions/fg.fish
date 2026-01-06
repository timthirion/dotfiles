function fg --description "Find files globally by name"
    find / -name $argv 2>/dev/null
end