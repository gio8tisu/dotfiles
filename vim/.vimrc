set nocompatible
set wildmenu

syntax on
set autoindent

set number
set relativenumber

set splitright
set splitbelow

set smartcase
set hlsearch
set incsearch

set mouse=a

" python settings
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 expandtab

"keymappings
nnoremap Y y$

"netrw explorer
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
