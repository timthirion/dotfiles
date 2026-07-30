# Temporary bridge, added 2026-07-24.
#
# Homebrew upgraded tmux to 3.7b while a tmux 3.5a server was still running on
# the default socket (up since Apr 7). The two share a protocol version, so a
# 3.7b client connects far enough for commands like `tmux ls` to work, but the
# client-flag bits moved between the versions, so the old server misreads
# CLIENT_TERMINAL and rejects anything that needs a terminal with:
#
#     open terminal failed: not a terminal
#
# This picks a client binary matching whichever server is actually running.
# Once that old server is gone it stops doing anything, so it's safe to leave
# in place -- and equally safe to just delete this file.
function tmux --wraps tmux --description 'Use a tmux client matching the running server'
    set -l real (command -v tmux)
    if test -z "$real"
        echo "tmux: no tmux binary on PATH" >&2
        return 127
    end

    set -l client ($real -V | string replace 'tmux ' '')
    set -l server ($real display-message -p '#{version}' 2>/dev/null)

    if test -n "$server" -a "$server" != "$client"
        set -l bridge $HOME/.local/bin/tmux$server
        if test -x $bridge
            $bridge $argv
            return $status
        end
        echo "tmux: server is $server but client is $client, and $bridge is missing." >&2
        echo "      Old sessions are unreachable until a $server client exists." >&2
        return 1
    end

    $real $argv
end
