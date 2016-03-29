"
" ~/.vimrc
"

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

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

set foldmethod=syntax   " create folds based on syntax when possible
set nofoldenable        " open all folds by default

set pastetoggle=<F2>     " turn on 'paste mode' with <F2> key

set autochdir       " change current directory to currently opened file

set cursorline      "highlight current line

set visualbell              " Turn off audible system bell
set virtualedit=block       " Allow block selection beyond end of line

if version >= 703
    set colorcolumn=80   " display rule 80 characters in
    set relativenumber   " use relative line numbers
else
    set number           " line numbers
endif

" Disable text auto-wrap
set formatoptions=ql

" More ways to escape
inoremap tn <Esc>

" Flip the behavior of ; and :
nnoremap ; :
nnoremap : ;

let mapleader = ","

" Clear highlighted search results
noremap <C-l> :nohlsearch <CR>

" New tab shortcut
noremap <C-t> :tabnew <CR>

" Easier copy/paste
noremap <Leader>a ggVG  " select all
noremap <Leader>x "+x   " cut
noremap <Leader>y "+y   " copy
noremap <Leader>p "+gP  " paste

" Mac-specific copy
noremap <Leader>c :w !pbcopy<CR>

" Toggle spellcheck
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

" Shortcut for toggling spellcheck
noremap <Leader>s :call Spellcheck()<CR>

" Toggle relative line numbers
function ToggleRnu()
    if !exists("b:rnu")
        let b:rnu = 1
    endif

    if b:rnu == 1
        setlocal number
        setlocal norelativenumber
        let b:rnu = 0
    else
        setlocal nonumber
        setlocal relativenumber
        let b:rnu = 1
    endif
endfunction

" Shortcut for toggling relative line numbers
noremap <Leader>r :call ToggleRnu()<CR>

" Enable automatic text wrapping
function Wrap()
    setlocal textwidth=80
    setlocal formatoptions+=t
endfunction

" Quickly enable Markdown syntax higlighting
noremap <Leader>m :set syntax=markdown<CR>

" Use JavaScript syntax highlighting on JSON files
autocmd BufNewFile,BufRead *.json setfiletype javascript

" Sets the current indentation level
function Indent(width)
    execute "set shiftwidth=" .a:width
    execute "set tabstop="    .a:width
endfunction

" Keep text selected when in/outdenting
vmap > >gv
vmap < <gv


" Initialize Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Plugins

" Extended functionality
Plugin 'docunext/closetag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'

" Themes
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'

" Clojure
Plugin 'raymond-w-ko/vim-niji'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'

" Syntax highlighting
Plugin 'digitaltoad/vim-jade'
Plugin 'fatih/vim-go'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-markdown'
Plugin 'stephpy/vim-yaml'
Plugin 'mustache/vim-mustache-handlebars'

call vundle#end()

filetype plugin indent on

" set colorscheme
if has('gui_running')
    colorscheme solarized
    set guioptions-=T   " disable toolbar
else
    colorscheme molokai
endif

" Higlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Toggle NERDTree sidebar
noremap <Leader>t :NERDTreeToggle<CR>

" Toggle Tagbar sidebar
noremap <Leader>g :TagbarToggle<CR>

" Shortcut for CtrlP + ctags
noremap <Leader>o :CtrlPTag<CR>

" Ignore common non-project files when looking for files
" (specifically applies to ctrl-p plugin)
set wildignore+=*.swp,*.pyc,*/__pycache__/*,*/.git/*

" Shortcut for reloading Clojure modules (works with vim-fireplace)
noremap <Leader>e :Require<CR>
