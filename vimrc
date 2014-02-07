set nocompatible
"filetype off
"syntax on
"colorscheme jellybeans "best before
"colorscheme inkpot
"colorscheme solarized
colorscheme zenburn
set t_Co=256
"call pathogen#infect()
"call pathogen#helptags()
"filetype plugin indent on

" https://robertmassaioli.wordpress.com/2010/06/16/haskellmode-guide-awesome-haskell-with-vim/
set shell=/bin/sh
filetype plugin on
filetype indent on
syntax on
au BufEnter *.hs compiler ghc
let g:haddock_browser = "/usr/bin/firefox"
let g:ghc = "/usr/bin/ghc"
let g:haddock_docdir = "/usr/share/doc/ghc-doc/html/"
execute pathogen#infect()
autocmd FileType haskell nnoremap <buffer> <F3> :GhcModLint<CR>
autocmd FileType haskell nnoremap <buffer> <F4> :GhcModCheck<CR>
autocmd FileType haskell nnoremap <buffer> <F5> :HdevtoolsType<CR>
autocmd FileType haskell nnoremap <buffer> <F6> :HdevtoolsClear<CR>

set tabstop=8                   "A tab is 8 spaces
set expandtab                   "Always uses spaces instead of tabs
set softtabstop=4               "Insert 4 spaces when tab is pressed
set shiftwidth=4                "An indent is 4 spaces
set smarttab                    "Indent instead of tab at start of line
set shiftround                  "Round spaces to nearest shiftwidth multiple
set nojoinspaces                "Don't convert spaces to tabs
" ENDE
set noerrorbells
set incsearch
set novisualbell
"set number
set ruler
set showcmd
set ignorecase
"set paste
:imap jk <Esc>
":imap ` <Esc> " basically the key below the real Escape
" :imap ii <Esc> i insert ii command mode

" to see changes in a file open since last save (:q wont work) call :DiffSaved
" to get out call :diffoff
" alternatively just call :w !diff % - (if diff is installed of course ^^)
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
