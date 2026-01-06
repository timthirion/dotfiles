function trim --description "List all git branches then delete the selected branch"
    set repo_exists (git rev-parse --is-inside-work-tree 2>/dev/null)
    if test "$repo_exists" != "true"
        echo "No git repostiory found in current directory"
        return
    end
    set branch_count (git branch | grep --invert-match '\*' | count)
    if test $branch_count -eq 0
        echo "Only current branch exists"
        return
    end
    set empty (git branch |
                grep --invert-match '\*' |
                cut -c 3- |
                fzf --multi --preview="git log {} --" |
                xargs git branch --delete --force)
end