"
" ~/.vimrc
"

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Load and call Pathogen
source ~/.vim/bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Enables syntax highlighting by default.
syntax on
" Using a dark background within the editing area and syntax highlighting
set background=dark

" Have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Have Vim load indentation rules according to the detected filetype.
if has("autocmd")
  filetype indent on
endif

set showcmd            " Show (partial) command in status line.
set showmatch          " Show matching brackets.

set ignorecase         " Do case insensitive matching
set smartcase          " Do smart case matching
set incsearch          " Incremental search
set hlsearch           " Highlight all search matches
set gdefault           " Apply substitutions globally on lines

set autowrite          " Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a            " Enable mouse usage (all modes) in terminals

set number          " line numbers

set expandtab       " tabs to spaces
set tabstop=4       " tab=4 spaces
set shiftwidth=4    " indent with 4 spaces

set wrap        " lines longer than the width of the window will wrap
set linebreak   " wrap long lines at a character in 'breakat' 
set wildmode=longest,list,full " file auto-completion

set autoindent
set encoding=utf-8

set textwidth=0

set shortmess+=I    " don't give the intro message when starting Vim

set nofoldenable    " disable (automatic) code folding

set pastetoggle=<F2>     " turn on 'paste mode' with <F2> key

set autochdir       " change current directory to currently opened file


if version > 730
    set colorcolumn=80   " display rule 80 characters in
endif


filetype plugin indent on

if has('gui_running')
    colorscheme solarized 
else
    colorscheme default
endif

inoremap jj <Esc>
inoremap jk <Esc>
nnoremap ; :
nnoremap : ;

set formatoptions=ql

noremap <C-l> :nohlsearch <CR>

noremap <Leader>a ggVG  " select all
noremap <Leader>x "+x   " cut
noremap <Leader>y "+y   " copy
noremap <Leader>p "+gP  " paste

function Spellcheck()
    if !exists("b:spell")
        let b:spell = 0
    endif

    if b:spell == 1
        setlocal nospell
        let b:spell = 0
    else
        setlocal spell spelllang=en_us
        let b:spell = 1
    endif
endfunction

noremap <Leader>s :call Spellcheck()<CR>  " toggle spellcheck
