set expandtab
set tabstop=2
set number
set ruler
set sw=2
set foldcolumn=1
set autoindent

set hidden

set backspace=2

syntax on

set encoding=utf-8
set fileformat=unix
set fileformats=unix,dos

set autoindent

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 

highlight FoldColumn ctermbg=NONE

if has('gui_running')
  colorscheme desert
endif
