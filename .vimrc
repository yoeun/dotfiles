" Vim settings

filetype on
filetype off

set nocompatible              " be iMproved, required
filetype off                  " required
 
" ====================

" Vundle (see `:h vundle`)
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()                 " or, `call vundle#begin('~/path/to/plugins')` for custom path
 
Plugin 'gmarik/Vundle.vim'          " required
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'tomasr/molokai'
 
call vundle#end()
filetype plugin indent on           " or use `filetype plugin on` to ignore plugin indent changes

" ====================

syntax on         " enable syntax coloring
set number        " show line numbers
set ruler         " show line number and column of cursor at bottom of screen

set smartindent   " auto indent code blocks
set tabstop=4     " 1 tab = 4 spaces
set shiftwidth=4  " indent using 4 spaces
set expandtab     " use spaces instead of tabs

set hlsearch      " highlight search results

" ====================

let g:molokai_original = 1
