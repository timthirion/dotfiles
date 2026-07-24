function clang-format --description 'Prefer the repo-pinned @polycam/clang-tools clang-format (matches CI) when inside a git checkout that has it'
    set -l repo_root (git rev-parse --show-toplevel 2>/dev/null)
    set -l pinned "$repo_root/node_modules/.bin/clang-format"
    if test -n "$repo_root"; and test -x "$pinned"
        command "$pinned" $argv
    else
        # Fall back to the first clang-format on PATH (e.g. Homebrew) outside a pinned checkout.
        command clang-format $argv
    end
end
