""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle                                                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible       
filetype off            

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'scrooloose/nerdtree'
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'notpratheek/vim-luna'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme                                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme luna "

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Bindings                                                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    
" Open matching braces, parenthesis, ...
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>

" delete without yanking
nnoremap dd "_dd
vnoremap d "_d

" replace currently selected text with default register
" without yanking it
vnoremap p "_dP

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Preferences                                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set expandtab       " Use spaces instead of tabs
set tabstop=4       " 1 tab := 4 spaces
set shiftwidth=4    " Use 4 spaces for indentation
set softtabstop=4   " Backspace removes 4 spaces
set encoding=utf8   " Use UTF-8 as default encoding
set number          " Show line numbers
set numberwidth=3   " Width of numbers column
set colorcolumn=80
syntax enable
