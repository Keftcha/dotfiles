filetype off

if has("syntax")
  syntax on
endif

if has("autocmd")
  filetype plugin indent on
endif

set background=dark
set showmatch
set ignorecase
set smartcase
set autowrite
set mouse=n
set nocp
set foldmethod=marker
set nocompatible
set number
set clipboard=unnamed
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set textwidth=79
set hlsearch
set completeopt=longest,menuone

au BufNewFile,BufRead *.processconf2 set filetype=perl
au BufNewFile,BufRead *.owl set filetype=perl
au BufNewFile,BufRead *.lowl set filetype=lowl

autocmd Filetype python set tabstop=4
autocmd Filetype python set shiftwidth=4
autocmd Filetype python set textwidth=79
autocmd Filetype python set softtabstop=4
autocmd Filetype python set completeopt=menu

au BufNewFile,BufRead *.md set filetype=markdown

autocmd Filetype lua set textwidth=79

" Don't remove useless spaces in this list of filetype
let blacklisk_unwanted_spaces = ["markdown"]
autocmd BufWritePre * if index(blacklisk_unwanted_spaces, &ft) < 0 | :%s/\s\+$//e

map <C-w>s :split<CR>
map <C-w>v :vsplit<CR>
map <C-w>t :tabnew<CR>
map <C-n> :NERDTreeToggle<CR>

" Python mode options
let g:pymode_lint = 0
let g:pymode_lint_on_write = 0
let g:pymode_rope = 0
