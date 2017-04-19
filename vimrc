
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'
"
" " Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"
" " Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
" " On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
" " Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"
" Color themes
Plug 'w0ng/vim-hybrid'
" Plug 'fatih/vim-go', { 'tag': '*' }

" Language pack, https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'

" JS syntax highligting
"Plug 'jelera/vim-javascript-syntax'
" JS code completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
"
" Fuzzy search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" " Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'
"
" " Initialize plugin system
call plug#end()

"julien's minimum stuff
"syntax off
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
"let mapleader = "<\space>"
set nocp paste acd is scs nu hid ssl sm wmnu ar noerrorbells visualbell t_vb="" sw=2 ch=2 ls=0 so=2 wim=longest,list,full mouse=a mousemodel=extend
set noautochdir
"runtime macros/matchit.vim
"let g:netrw_cursorline=0

" https://www.sitepoint.com/getting-started-vim/
set nocompatible                " choose no compatibility with legacy vi
set encoding=utf-8
set showcmd                     " display incomplete commands
"filetype plugin indent on       " load file type plugins + indentation
"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set autoindent
set smartindent

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
syntax on
set t_Co=256
"let g:solarized_termcolors=256 
set background=dark
colorscheme hybrid 

" autocompletes
ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O
