"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.local/share/dein')
  call dein#begin('~/.local/share/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('neovimhaskell/haskell-vim')

  " for auto-completion
  call dein#add('Shougo/deoplete.nvim', {
			  \ 
			  \})

  call dein#add('junegunn/fzf') " for multi-entry selection UI
  call dein#add('junegunn/fzf.vim')

  " Language-Server-Protocol Client
  call dein#add('autozimu/LanguageClient-neovim', {
			  \ 'rev': 'next',
			  \ 'build': 'sh install.sh',
			  \ })

  " status bar
  call dein#add('vim-airline/vim-airline')

  call dein#add('majutsushi/tagbar')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" Install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" ===== Start Leader key =====
nnoremap <space> <NOP>
let mapleader = "\<space>"

" just a test to ensure its working
nnoremap <leader>ww :w<CR>
" ===== End Leader key =====


" ===== Start config LanguageClient-neovim =====
" Required for operations modifying buffers like rename
set hidden

let g:LanguageClient_serverCommands = {
			\ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
			\}

nnoremap <F5> : call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" ===== End config LanguageClient-neovim =====

" ===== Start config deoplete =====
let g:deoplete#enable_at_startup = 1
" do :UpdateRemotePlugin if deoplete needs it
" ===== End config deoplete =====


" ===== Start config fzf =====
set rtp+=~/.fzf
let g:fzf_command_prefix = 'Fzf' " set a prefix for all fzf.vim command
" ===== End config fzf =====
" ===== Start config vim-airline =====
let g:airline_powerline_fonts = 1
" ===== End config vim-airline =====
" ===== Start config TagBar =====
noremap <F8> : TagbarToggle<CR>
" ===== End config TagBar =====

" ===== Start general configs =====
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

filetype plugin indent on
" all tabs are spaces
set expandtab

" set completion in command mode, with the longest matching, then selection
set wildmenu wildmode=longest:full,full

set number relativenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

language messages C
" ===== End general configs =====


" ===== Start language configs =====
" == Haskell ==
autocmd FileType haskell setlocal shiftwidth=2 softtabstop=2

" ===== Start terminal mode =====
" tnoremap: remap from terminal mode
" map the keychain to exit terminal-mode to <Esc>
tnoremap <C-s> <C-\><C-n>
" simulate i C-R in the terminal, which allows paste while in insert mode (" for previous yank, [reg] for the register, % for the current filename, / for last search, + for the X clip)
tnoremap <expr> <C-R> '<C-\><C-n>"'.nr2char(getchar()).'pi'

"tnoremap <A-h> <C-\><C-N><C-w>h
"tnoremap <A-j> <C-\><C-N><C-w>j
"tnoremap <A-k> <C-\><C-N><C-w>k
"tnoremap <A-l> <C-\><C-N><C-w>l
"inoremap <A-h> <C-\><C-N><C-w>h
"inoremap <A-j> <C-\><C-N><C-w>j
"inoremap <A-k> <C-\><C-N><C-w>k
"inoremap <A-l> <C-\><C-N><C-w>l
"nnoremap <A-h> <C-w>h
"nnoremap <A-j> <C-w>j
"nnoremap <A-k> <C-w>k
"nnoremap <A-l> <C-w>l
" ===== End terminal mode =====
