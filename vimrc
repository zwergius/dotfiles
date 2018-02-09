
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
Plug 'w0rp/ale'
""Plug 'vim-syntastic/syntastic'
""Plug 'mtscout6/syntastic-local-eslint.vim'

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
"set omnifunc=syntaxcomplete#Complete
let mapleader = "\<Space>"
set nocp nu hid ssl sm wmnu noerrorbells visualbell t_vb="" ch=2 ls=0 so=2 wim=longest,list,full mouse=a mousemodel=extend
set autoread
set noautochdir
set clipboard=unnamed
"runtime macros/matchit.vim
""let g:netrw_cursorline=0
let g:netrw_liststyle=3

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
" clear searched text on enter
nnoremap <silent> <CR> :noh<CR><CR>
syntax on
set t_Co=256
"let g:solarized_termcolors=256 
set background=dark
colorscheme hybrid 
" autocompletes
inoremap " ""<left>
inoremap ' ''<left>
inoremap ` ``<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap `<CR> `<CR>`<ESC>O
inoremap [<CR> [<CR>]<ESC>O
inoremap (<CR> (<CR>)<ESC>O

"linting 
let g:ale_statusline_format = ['⬥ %d', '⚠ %d', '✓']
let g:ale_linters = {'html':[], 'javascript.jsx': ['eslint']}
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
" Console log from insert mode; Puts focus inside parentheses
inoremap cll console.log()<Esc>==f(a
"vimrc helpers
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
"split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"pretty print json
nnoremap <leader>j :%!python -m json.tool<cr>
"search files
nnoremap <leader>p :Files<cr>
nnoremap <leader>f :Find 
"move lines ALT-j and ALT-k"
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv 
vnoremap ˚ :m '<-2<CR>gv=gv 
"autoclose html tags 
inoremap ><Tab> ><Esc>F<lyt>o</<C-r>"><Esc>O<Space>
""inoremap ><Tab> ><Esc>?<[a-z]<CR>lyiwo</<C-r>"><Esc>:noh<CR><Esc>O
"autoclose html tags INLINE
inoremap >> ><Esc>F<lyt>f>a</<C-r>"><Esc>F<i
""inoremap >> ><Esc>?<[a-z]<CR>lyiwh/[^%]><CR>la</<C-r>"><Esc>:noh<CR><Esc>F<i
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
" Status Line"
" cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" format markers:
"   %< truncation point
"   %n buffer number
"   %f relative path to file
"   %m modified flag [+] (modified), [-] (unmodifiable) or nothing
"   %r readonly flag [RO]
"   %y filetype [ruby]
"   %= split point for left and right justification
"   %-35. width specification
"   %l current line number
"   %L number of lines in buffer
"   %c current column number
"   %V current virtual column number (-n), if different from %c
"   %P percentage through buffer
"   %) end of width specification
set statusline=%<\ %n:%f\ %m%r%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%{ALEGetStatusLine()})%)

" Remove trailing whitespace from .js files"
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre *.js* :call <SID>StripTrailingWhitespaces()
