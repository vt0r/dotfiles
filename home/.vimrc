set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Powerline specific
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set t_Co=256
let g:Powerline_symbols = 'fancy'
set guifont=Input\ Mono\ Narrow\ 9

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My Bundles here:
"
" original repos on github
Plugin 'saltstack/salt-vim'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'stephenmckinney/vim-solarized-powerline'
Plugin 'fatih/vim-go'
Plugin 't9md/vim-chef'

let g:Powerline_colorscheme='solarized256_dark'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""" BEGIN Sal Stuff

" New global Powerline installation method (using pip)
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" Highlight syntax
syntax enable

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

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Always show current position
set ruler

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Show the cool space dots like Brooke has
set nolist listchars=tab:→\ ,trail:·
set list

" Toggle Whitespace Display
nnoremap <S-F11> :set list!<CR>

" Toggle Indenting Behavior
nnoremap <S-F10> :call ToggleTabIndent()<CR>
function ToggleTabIndent()
    if &expandtab
        set tabstop=4
        set shiftwidth=4
        set softtabstop=4
        set expandtab!
    else
        set tabstop=2
        set shiftwidth=2
        set softtabstop=2
        set expandtab
    endif
endfunction

" Colorify the space trail
:highlight ExtraWhitespace ctermbg=darkred guibg=darkred
:match ExtraWhitespace /\s\+$\| \+\ze\t/

" Diff between current buffer and saved file
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

""" END Sal Stuff
