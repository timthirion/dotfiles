" Hide the status line but make it showable
let s:hidden_status = 0
function! ToggleStatusLine()
    if s:hidden_status == 0
        let s:hidden_status = 1
        set noshowmode noruler laststatus=0 noshowcmd
    else
        let s:hidden_status = 0
        set showmode ruler laststatus=2 showcmd
    endif
endfunction
autocmd VimEnter * call ToggleStatusLine()
