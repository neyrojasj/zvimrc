" Encoding
scriptencoding utf-8
set encoding=utf-8

" Normal backspace behaviour
set backspace=indent,eol,start

" 24-bit true-color support
if (has("termguicolors"))
  set termguicolors
endif

set background=dark

" ── Theme ─────────────────────────────────────────────────────────────────────
" Default: VS Code Dark+ (codedark). Switch below as you like:
"   gruvbox | dracula | onedark | nord | catppuccin_mocha
try
  colorscheme codedark
catch
  try
    colorscheme onedark
  catch
    colorscheme desert
  endtry
endtry

" Gruvbox fine-tuning (used when switching manually)
let g:gruvbox_contrast_dark    = 'medium'
let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1

" OneDark italic comments
let g:onedark_terminal_italics = 1

" Leader key
let mapleader = ","

" Map the character that are not seeing
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·

" Mouse support
set mouse=a

" Tabs → 2 spaces (web dev default; override per filetype if needed)
set tabstop=2 shiftwidth=2 expandtab

" Strip trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Filetype-based omni-completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" 80-column guide
highlight ColorColumn ctermbg=magenta
set colorcolumn=80

" Spell checking for prose files
au BufRead *.md,*.markdown,*.rst,*.txt setlocal spell

" Clipboard (system clipboard)
if has('macunix')
  map <F2> :w !pbcopy<CR>
else
  map <F2> :w !xclip -selection clipboard<CR>
endif
if has('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

" Line numbers
set number

" Highlight search results
set hlsearch

" ── VS Code-like keybindings ──────────────────────────────────────────────────

" Ctrl+P — Quick Open (search files)  → handled in fzf/config.vim

" Ctrl+B — Toggle sidebar / NERDTree (VS Code default)
nnoremap <C-b> :NERDTreeToggle<CR>

" Ctrl+/ — Toggle comment on current line (VS Code default)
" Note: <C-_> is how most terminals see Ctrl+/
nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>

" gcc also works (vim-commentary native)

" Alt+Up / Alt+Down — Move line/selection (VS Code default)
nnoremap <A-Up>   :m .-2<CR>==
nnoremap <A-Down> :m .+1<CR>==
vnoremap <A-Up>   :m '<-2<CR>gv=gv
vnoremap <A-Down> :m '>+1<CR>gv=gv

" ── Split navigation (Ctrl+Arrow) ─────────────────────────────────────────────
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ── Tab navigation ────────────────────────────────────────────────────────────
map <Leader>tn :tabnew<CR>
map <Leader>tc :tabclose<CR>
map <Leader>tf :tabnext<CR>
map <Leader>tb :tabprevious<CR>
map <Leader>t1 1gt
map <Leader>t2 2gt
map <Leader>t3 3gt
map <Leader>t4 4gt
map <Leader>t5 5gt
map <Leader>t6 6gt
map <Leader>t7 7gt
map <Leader>t8 8gt
map <Leader>t9 9gt

map <C-S-Right> :tabnext<CR>
map <C-S-Left>  :tabprevious<CR>

" ── Cursor line highlight ──────────────────────────────────────────────────────
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234

" ── Leader convenience maps ───────────────────────────────────────────────────
" Insert empty lines without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" Delete to black-hole register (no clipboard pollution)
vnoremap <leader>d "_d

" Paste without losing register
vnoremap <leader>p "_dP

" ── IDE defaults ──────────────────────────────────────────────────────────────
syntax enable
set showmatch                    " flash matching bracket
set wildmenu
set wildmode=longest:full,full
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn

" Always show sign column (git gutter, CoC diagnostics)
set signcolumn=yes

" Faster update for git gutter / CoC
set updatetime=100

" Splits open below and to the right (VS Code-like)
set splitbelow
set splitright

" Code folding (Space to toggle)
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Persistent undo
if has('persistent_undo')
  set undofile
  set undodir=$HOME/.vim/undodir
  if !isdirectory(&undodir)
    call mkdir(&undodir, 'p')
  endif
endif

" Search
set ignorecase
set smartcase
set incsearch

" Status / command bar
set ruler
set showcmd
set lazyredraw

" Keep context around cursor
set scrolloff=8
set sidescrolloff=8

" Performance
set synmaxcol=200
