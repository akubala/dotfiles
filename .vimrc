" Set syntax on
syntax enable

" Enable paste with no mess
set pastetoggle=<F2>

" Show line numbers
set number

" Break lines at word [requires Wrap lines]
set linebreak

" Wrap-broken line prefix
set showbreak=+++

" Line wrap [number of cols]
set textwidth=100

" Highlight matching brace
set showmatch

" Highlight all search results
set hlsearch

" Enable smart-case search
set smartcase

" Always case-insensitive
set ignorecase

" Searches for strings incrementally
set incsearch

" Auto-indent new lines
set autoindent

" Number of auto-indent spaces
set shiftwidth=4

" Enable smart-indent
set smartindent

" Number of spaces per Tab
set softtabstop=0
set tabstop=4

" Tabs are spaces
set expandtab

" Show row and column ruler information
set ruler

" Number of undo levels
set undolevels=1000

" Backspace behaviour
set backspace=indent,eol,start

" Show command in bottom bar
set showcmd

" Visual autocomplete for command menu
set wildmenu

" Fat cursor line
set cursorline
hi CursorLine term=bold cterm=bold 
