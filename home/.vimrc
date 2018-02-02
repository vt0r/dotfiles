" Vundle stuff below
set nocompatible "Break vi
set backspace=2 "Hopefully works on Linux
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Powerline specific
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set t_Co=256
let g:airline_powerline_fonts = 1
set guifont=Input\ Mono\ Narrow\ 9
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" My bundles here
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fatih/vim-go'
Plugin 'dougireton/vim-chef'
Plugin 'chrisbra/csv.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Raimondi/delimitMate'
Plugin 'nathanaelkane/vim-indent-guides'
" Syntastic stuff
Plugin 'scrooloose/syntastic'
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
set hlsearch
set ignorecase
set smartcase
set ruler
set confirm
set expandtab "Use spaces
set smarttab "Be smart about tabs
set shiftwidth=2
set tabstop=2
set ai
set si
set wrap
set lazyredraw "SPEED
set ffs=unix,dos,mac "Default to UNIX format

" Make tabs super obvious
set nolist listchars=tab:→\ ,trail:·
set list

" Add golint support (requires installing golint to the $GOPATH)
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

" Nice theme for dark terminals - solarized dark
let g:solarized_termcolors = 256
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

" GUI-only shit
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
endif

" Colorify the space trail
:highlight ExtraWhitespace ctermbg=darkred guibg=darkred
:match ExtraWhitespace /\s\+$\| \+\ze\t/
