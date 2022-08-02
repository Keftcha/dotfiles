" Turn off filetype detection (to avoid errors)
filetype off

" Turn on color syntax
if has("syntax")
  syntax on
endif

" Load plugins, indent, and filetype of the opened file
if has("autocmd")
  filetype plugin indent on
endif

" Set options
set autowrite                      " Save file on some command, see `:help autowrite` for further details
set background=dark                " Use colors that look good on a dark background
set clipboard=unnamed              " Unnamed register is the same as `"*` regiter (the X11 primary selection)
set completeopt=longest,menuone    " Completion for longest match even if there is only one choice
set expandtab                      " Replace tabs with space
set foldlevelstart=99              " Open all folds when opening a file
set foldmethod=indent              " Fold with indentation levels
set hlsearch                       " Highlight search matches
set ignorecase                     " Insensitive search
set mouse=n                        " Enable mouse only in Normal and Terminal modes
set nocompatible                   " Set vim no compatible with Vi
set number                         " Display line numbers
set softtabstop=4                  " A tab is 4 spaces
set shiftwidth=4                   " Spaces used for each step of auto-indent
set showmatch                      " Highlight the matching parenthesis, bracket, or brace when the cursor is over one
set smartcase                      " Ignore 'ignorecase' option if the search pattern contains upper case characters
set tabstop=4                      " Make tab take 4 column
set textwidth=140                  " Set line length
set wildmenu                       " Show completion menu for command-line mode
"""

" Python settings
autocmd BufWritePre *.py Black
autocmd Filetype python set textwidth=79
"""

" Markdown settings
autocmd BufNewFile,BufRead *.md set filetype=markdown    " Set filetype to `markdown` on file with the .md extension
"""

" Don't remove useless spaces in this list of filetype
let blacklisk_unwanted_spaces = ["markdown"]
autocmd BufWritePre * if index(blacklisk_unwanted_spaces, &ft) < 0 | :%s/\s\+$//e | endif

" Delete trailing empty lines at end of file
autocmd BufWritePre * :%s/\($\n\s*\)\+\%$//e

" Some keybind
map <C-w>s :split<CR>
map <C-w>v :vsplit<CR>
map <C-w>t :tabnew<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-t> :tab term<CR>
"""

" vim-markdown options
let g:vim_markdown_folding_disabled=1
"""
