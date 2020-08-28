:let mapleader = "-" "leader key
set nocompatible              " be iMproved, required
filetype off                  " required
set number                     " Show current line number
set relativenumber             " Show relative line numbers
set encoding=UTF-8
let g:airline_powerline_fonts = 1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd! VimEnter * NERDTree | wincmd w
set autoread " for reloading dir when files change
au FocusGained * :checktime
set rtp+=/usr/local/opt/fzf
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree' "file browser
Plug 'tomasiser/vim-code-dark' "vscode theme
Plug 'neoclide/coc.nvim', {'branch': 'release'} "typescipt autocomplete
Plug 'junegunn/fzf.vim' "fuzzy searching for files
Plug 'jiangmiao/auto-pairs' "autocomplete brackets
Plug 'ryanoasis/vim-devicons' "devicons for nerdtree

" Formatting
Plug 'alvan/vim-closetag' "autocomplete html close tag
Plug 'preservim/nerdcommenter' "toggle comment select
Plug 'mg979/vim-visual-multi' "multi-line cursor
" Initialize plugin system
call plug#end()

colorscheme codedark "set colorscheme to be vscode like
filetype plugin indent on    " required
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufWritePre * :%s/\s\+$//e
nnoremap <C-p> :<C-u>:Files<CR>
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab

" dev icons config
let g:webdevicons_enable_nerdtree = 1 "dev icons for NERDTree
set guifont=:h
set guifont=DroidSansMono_Nerd_Font:h11
