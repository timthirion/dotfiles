" Backups and swap
set swapfile
set directory^=~/.vim/swap//
" Protect against crashes during write
set writebackup
" But do not persist backup after a successful write
set nobackup
" Use rename-and-write-new method whenever safe
set backupcopy=auto
set backupdir^=~/.vim/backup//
"Persist the undo tree for each file
set undofile
set undodir^=/.vim/undo//
