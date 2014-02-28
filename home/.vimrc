""" BEGIN Sal Stuff

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" Highlight syntax
syntax enable
set nocompatible               " be iMproved
filetype off                   " required!

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

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
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
        set tabstop=2
        set shiftwidth=2
        set softtabstop=2
        set expandtab!
    else
        set tabstop=4
        set shiftwidth=4
        set softtabstop=4
        set expandtab
    endif
endfunction

" Colorify the space trail
:highlight ExtraWhitespace ctermbg=darkred guibg=darkred
:match ExtraWhitespace /\s\+$\| \+\ze\t/

""" END Sal Stuff

" Vundle/Powerline stuff
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Powerline specific
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set t_Co=256
let g:Powerline_symbols = 'fancy'
set guifont=Droid\ Sans\ Mono\ Slashed\ for\ Powerline\ 11

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'Lokaltog/vim-powerline'
Bundle 'saltstack/salt-vim'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'stephenmckinney/vim-solarized-powerline'

let g:Powerline_colorscheme='solarized256_dark'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
