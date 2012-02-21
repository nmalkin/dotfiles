"
" ~/.vimrc
"
" This is your Vim initialization file. It is read on Vim startup.
"
" Change this file to customize your Vim settings.
" 
" Vim treats lines beginning with " as comments.
"
" EXAMPLES are available in /usr/local/doc/startups.
"

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Load and call Pathogen
source ~/.vim/bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Have Vim load indentation rules according to the detected filetype. Per
" default Debian Vim only load filetype specific plugins.
if has("autocmd")
  filetype indent on
endif

set showcmd            " Show (partial) command in status line.
set showmatch          " Show matching brackets.
set ignorecase         " Do case insensitive matching
set smartcase          " Do smart case matching
set incsearch          " Incremental search
set hlsearch           " Highlight all search matches
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


if version > 730
    "set relativenumber  " changes Vim’s line number column to display how far away each line is from the current one
    "set undofile        " tells Vim to create <FILENAME>.un~ files so you can undo previous actions even after you close and reopen a file.
    set colorcolumn=80   " display rule 80 characters in
endif

set gdefault        " applies substitutions globally on lines

filetype plugin indent on

if has('gui_running')
    colorscheme solarized 
else
    "colorscheme evening
endif

inoremap jj <Esc>
nnoremap ; :
nnoremap : ;

"set formatoptions-=tcro
"set formatoptions-=t
"set formatoptions-=c
"set formatoptions-=r
"set formatoptions-=o
"set formatoptions+=l
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
