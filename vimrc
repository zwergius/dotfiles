
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

"linting
Plug 'vim-syntastic/syntastic'
Plug 'mtscout6/syntastic-local-eslint.vim'

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
"set omnifunc=syntaxcomplete#Complete
""let mapleader = "<\space>"
set nocp paste nu hid ssl sm wmnu noerrorbells visualbell t_vb="" ch=2 ls=0 so=2 wim=longest,list,full mouse=a mousemodel=extend
set autoread
set noautochdir
set clipboard=unnamed
"runtime macros/matchit.vim
"let g:netrw_cursorline=0

" https://www.sitepoint.com/getting-started-vim/
set encoding=utf-8
set showcmd                     " display incomplete commands
" Whitespace
set list
set listchars=""                      " reset
set listchars=tab:→\ 
set listchars+=trail:·
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2 expandtab     " a tab is two spaces (or set this to 4)
set backspace=indent,eol,start  " backspace through everything in insert mode
set autoindent
set smartindent
set noshiftround
"split behaviour
set splitbelow
set splitright
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

"linting
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"my mappings

"vimrc helpers
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
"split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
