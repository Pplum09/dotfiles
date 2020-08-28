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
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "colors for dev icons
Plug 'tomasiser/vim-code-dark' "vscode theme
Plug 'neoclide/coc.nvim', {'branch': 'release'} "typescipt autocomplete
Plug 'junegunn/fzf.vim' "fuzzy searching for files
Plug 'ryanoasis/vim-devicons' "devicons for nerdtree
Plug 'vim-scripts/scratch.vim'
" Formatting
Plug 'alvan/vim-closetag' "autocomplete html close tag
Plug 'preservim/nerdcommenter' "toggle comment select
Plug 'terryma/vim-multiple-cursors' "multi cursors"
Plug 'APZelos/blamer.nvim'
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

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-angular',
  \ ]

" NERDTree config
let NERDTreeIgnore = ['\.pyc$', '.git', 'node_modules', 'venv']

" fzf ignore files defined in .gitignore
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" gitlens to see who committed the line
let g:blamer_enabled = 1
