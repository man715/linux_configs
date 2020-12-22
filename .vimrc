" This is my vimrc based off of parrotos and https://chrisyeh96.github.io/2017/12/18/vimrc.html

"Basic behavior
set number              " turn on line numbers
set encoding=UTF8       
set mouse=a             " enable mouse support
set showmatch           " highlight matching parens and brackets
set laststatus=2        " always show statusline
set ruler               " show line and column number of the cursor on right side of statusline

"""""Tab/indent settings
set autoindent          " copy indent from current line when starting a new line
set smartindent         " auto indents after '{'
set softtabstop=4       " backsapcing after hitting tab will delete this many spaces
set shiftwidth=4        " number of spaces to use for each step of (auto)indent
set tabstop=4           " width that a <TAB> displays as
set expandtab           " convert <TAB> to spaces

""""""Search settings

" turn off search highlight with carrage return
nnoremap <CR> :nohlsearch<CR><CR> 
set incsearch           " search as characters are entered
set hlsearch            " highlight search matches

" use filtetype based syntax highlighting
syntax enable
filetype plugin indent on

colorscheme elflord

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'tmsvg/pear-tree'
call plug#end()
