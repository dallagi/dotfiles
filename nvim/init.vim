set nocompatible " Don't be compatible with vi
filetype off

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'iCyMind/NeoSolarized'
Plug 'bling/vim-airline'
Plug 'Lokaltog/vim-easymotion'

" Initialize plugin system
call plug#end()

" Set solarized-dark colorscheme
set termguicolors
colorscheme NeoSolarized
set background=dark

syntax enable
set number

" highlight tabs
set list
set listchars=tab:>-
" set file options
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set shiftround " rounds indent to a multiple of shiftwidth

au FileType py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
au FileType yaml set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au FileType json set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
" for go, use tabs and don't highlight them
au FileType go set noexpandtab nolist

" don't outdent hashes
inoremap # # 

