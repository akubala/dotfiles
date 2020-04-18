" Set syntax on
syntax enable

" Enable Ctrl + Shift + V paste
set paste

" Show line numbers
set number

" Break lines at word (requires Wrap lines)
set linebreak

" Wrap-broken line prefix
set showbreak=+++

" Line wrap (number of cols)
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

" Enable smart-tabs
set smarttab

" Number of spaces per Tab
set softtabstop=4

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

" Set vertical line
" set colorcolumn=80

" Sugar for vertical line
" highlight ColorColumn ctermbg=0 guibg=lightgrey

" Visual autocomplete for command menu
set wildmenu

" Show ALL white space characters
"set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
"set list

" Cursor line
set cursorline
hi CursorLine term=bold cterm=bold 
