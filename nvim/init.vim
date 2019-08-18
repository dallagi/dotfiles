set nocompatible " Don't be compatible with vi
filetype off

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'bling/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'luochen1990/rainbow'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wsdjeg/FlyGrep.vim'
Plug 'joshdick/onedark.vim'
Plug 'airblade/vim-gitgutter'

" Initialize plugin system
call plug#end()

set number
set lazyredraw

" Allow hidden buffers
set hidden

" Sane tab default
set smarttab
set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2

" Backspace through anything in insert mode
set backspace=indent,eol,start

" Underline current line
set cursorline

" Commands history (default was 10k)
set history=1000

" Status line
set laststatus=2 " Alwsays show status line
set noshowmode " Do not show mode in separate line (it is already in status line)
let g:airline#extensions#tabline#enabled = 1 " List buffers on top
let g:airline_theme='onedark'

" Keep indentation for new lines
set autoindent

" Show matching patterns while typing search term
set incsearch

" Ignore case when search term is lowercase
set ignorecase
set smartcase

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Do now wrap long lines
set nowrap

" When scrolling at end of screen, keep 5 lines/columns after cursor
set scrolloff=5
set sidescrolloff=5

" Persist undos
set undofile

" Colors
set background=dark

" Change Working Directory to that of the current file
cmap cwd lcd %:p:h

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Fuzzy-find file with Ctrl-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" exclude gitignored and .git/ files
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" NERDTree
map <C-e> :NERDTreeToggle<CR> " Toggle on ctrl-e
map <leader>f :NERDTreeFind<CR> " Toggle in find mode
let NERDTreeQuitOnOpen=1 " Hide after selection
let NERDTreeShowHidden=1 " Show hidden files
" Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Improve UI
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


" ==== Appearance ====

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax enable
let g:onedark_terminal_italics=1
let g:airline_powerline_fonts = 1
colorscheme onedark
set background=dark


" ==== COC stuff ====

" Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Make <cr> confirm the first completion when no item has been selected
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Allow up to three symbols (e.g., linter errors) in sign column
set signcolumn=auto:3

" Use `lp` and `ln` for navigate diagnostics
nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>lt <Plug>(coc-type-definition)
nmap <silent> <leader>li <Plug>(coc-implementation)
nmap <silent> <leader>lf <Plug>(coc-references)

" Remap for rename current word
nmap <leader>lr <Plug>(coc-rename)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

