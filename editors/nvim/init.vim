" the list of whitespaces to show with which char
"space:␣,eol:¬,tab:>-,trail:~
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,space:·
" display the list of chars from listchars
set list
" set the length of a tab
set tabstop=4
" set the changes made through > and <, at 0 it equals the tabstop
set shiftwidth=0
" highlight mode
color desert

" tnoremap: remap from terminal mode
" map the keychain to exit terminal-mode to <Esc>
tnoremap <Esc> <C-\><C-n>
" simulate i C-R in the terminal, which allows paste while in insert mode (" for previous yank, [reg] for the register, % for the current filename, / for last search, + for the X clip)
tnoremap <expr> <C-R> '<C-\><C-n>"'.nr2char(getchar()).'pi'

tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
