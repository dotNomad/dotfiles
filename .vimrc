" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Configure vim-plug
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
call plug#end()

" Set true color if supported
" https://gist.github.com/XVilka/8346728
if exists("$COLORTERM")
    set termguicolors
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
else
    let g:gruvbox_termcolors=16
endif

" Setup colorscheme
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection=0
let g:gruvbox_italic=1

" Tabs to spaces
set expandtab
set smarttab
set tabstop=4
set shiftwidth=0

" Enable syntax highlighting
syntax on

" Highlight search patterns
set hlsearch

" Enable backspace in insert mode
set backspace=indent,eol,start

" Show cursor position
set ruler

" Ignore case while searching
set ignorecase
set smartcase

" Split to the right and below
set splitright
set splitbelow

" Highlight the current line
set cursorline

" Keep 6 lines visible when scrolling
set scrolloff=6

" Escape insert mode with jk
inoremap jk <ESC>
" Optionally force jk to be used to escape
" inoremap <ESC> <NOP>

" Set leader key
let mapleader = ","

" Easily open NERDTree
nnoremap <leader>f :NERDTreeToggle<CR>

" Enable scrolling in iTerm
" set mouse=a
