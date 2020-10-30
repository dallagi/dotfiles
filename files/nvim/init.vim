set nocompatible " Don't be compatible with vi
filetype off

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'ap/vim-buftabline'
Plug 'itchyny/lightline.vim'
Plug 'janko/vim-test'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'luochen1990/rainbow'
Plug 'mhinz/vim-signify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'

" Initialize plugin system
call plug#end()

" turn hybrid line numbers on
:set number relativenumber
:set nu rnu

set lazyredraw

" Enable indent-based code folding
" zc to close, zo to open
set foldmethod=indent
set foldlevelstart=99

" Allow hidden buffers
set hidden

" Allow up to three symbols (e.g., linter errors) in sign column
set signcolumn=auto:3

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

" Setup lightline and bufferline
let g:lightline                  = {'colorscheme': 'one'}
set showtabline=2

" Keep indentation for new lines
set autoindent

" Show matching patterns while typing search term
set incsearch

" Ignore case when search term is lowercase
set ignorecase
set smartcase

" " Use <C-L> to clear the highlighting of :set hlsearch.
" if maparg('<C-L>', 'n') ==# ''
"   nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
" endif

" This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Do now wrap long lines
set nowrap

" When scrolling at end of screen, keep 5 lines/columns after cursor
set scrolloff=5
set sidescrolloff=5

" Git gutter
let g:signify_vcs_list = [ 'git' ] " Only consider git as VCS
set updatetime=100 " update time in ms

" Colors
set background=dark

" Change Working Directory to that of the current file
cmap cwd lcd %:p:h

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" NERDTree
map <C-e> :NERDTreeToggle<CR> " Toggle on ctrl-e
map <leader>f :NERDTreeFind<CR> " Toggle in find mode
let NERDTreeQuitOnOpen=1 " Hide after selection
let NERDTreeShowHidden=1 " Show hidden files

" Use ctrl-{h, j, k, l} to move across splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open split buffers below and right
set splitbelow
set splitright

" (Uncomment to) Open a NERDTree automatically when vim starts up if no files were specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Improve UI
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" NERDCommenter
nmap <C-_> <Plug>NERDCommenterToggle " Map to ctrl-/
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv " Mapping for visual mode

let g:NERDDefaultAlign = 'left' " Align comments on the left side
let g:NERDSpaceDelims = 1 " Add space after comment


" ==== Appearance ====

" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
" If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
" (see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
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
colorscheme onedark
set background=dark


" ==== COC stuff ====

" Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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


" Mappings for vim-test
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" C-o to exit terminal insert mode (hence allowing scrolling of test results)
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

" Fuzzy finding / grepping with FZF
map <C-p> :FZF --layout=reverse-list<CR>
map <leader>g :RG <CR>
map <leader>b :Buffers<CR>

" FZF in a floating window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo', 'border': 'rounded'} }

" Always enable preview window on the top with 60% width
let g:fzf_preview_window = 'right:40%'

" For FZF, consider all files that respect .gitignore (including hidden files)
" except for .git/
let $FZF_DEFAULT_COMMAND = 'rg --hidden --files --iglob !.git'

" RG to match with Ripgrep instead of FZF
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case --hidden --iglob !.git %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Highlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Search for selected text in visual mode, forwards or backwards, with * and #.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
