" Enconding text
scriptencoding utf-8
set encoding=utf-8

" set the backspace to delete normally
set backspace=indent,eol,start

" Color schemes i liked
" murphy, slate, koehler, gruvbox, dracula, onedark, nord
set background=dark

" Enable 24-bit true colors if supported
if (has("termguicolors"))
  set termguicolors
endif

" Use gruvbox as the default color scheme (change to dracula, onedark, nord, etc.)
try
  colorscheme gruvbox
catch
  colorscheme desert
endtry

" Set contrast for gruvbox
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1

" Set the leader key
let mapleader = ","

" Map the character that are not seeing
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·

" Set list replaces the hidden characters by a special char
" For example: the space is replaced by "·"
" set list

" Add mouse integration
set mouse=a

" Change tabs by spaces
set tabstop=2 shiftwidth=2 expandtab

" Remove all trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" AUTOCOMPLETATION ENABLED
" =============================================================================
" To invoque this feature, type a base name and then: Ctrl+x and Ctrl+o
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" MARK MAX COLUMN LENGHT
" =============================================================================

" Color the 80th column and over that column
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

" Add only a line
highlight ColorColumn ctermbg=magenta

" =============================================================================

" Enable spell checking for certain files
au BufRead *.md setlocal spell
au BufRead *.markdown setlocal spell
au BufRead *.rst setlocal spell
au BufRead *.ymal setlocal spell

" Map F2 to copy the selected text into the clipboard
if has('macunix')
  map <F2> : w !pbcopy
else
  map <F2> : w !xclip -selection clipboard
endif

" turn hybrid line numbers on
" set number relativenumber
set number

" Highlight the searchs
set hlsearch

" Map a combination to delete text and send it to the null yank register

" shortcut to delete in the black hole register
vnoremap <leader>d "_d

" shortcut to paste but keeping the current register
vnoremap <leader>p "_dP

" Shorcuts to handle tabs
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
map <C-S-Left> :tabprevious<CR>

" Highlight the whole current line
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234

" CUSTOM RULES FOR NEW LINES AND LEADER KEY
" =============================================================================
" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" IDE-LIKE ENHANCEMENTS
" =============================================================================

" Enable syntax highlighting
syntax enable

" Show matching brackets
set showmatch

" Better command-line completion
set wildmenu
set wildmode=longest:full,full
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn

" Always show the signcolumn (for git gutter, etc.)
set signcolumn=yes

" Update time for better git gutter responsiveness
set updatetime=100

" Better split window behavior
set splitbelow
set splitright

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable code folding
set foldmethod=indent
set foldlevel=99
" Toggle fold with space
nnoremap <space> za

" Persistent undo
if has('persistent_undo')
  set undofile
  set undodir=$HOME/.vim/undodir
  if !isdirectory(&undodir)
    call mkdir(&undodir, 'p')
  endif
endif

" Better search settings
set ignorecase
set smartcase
set incsearch

" Show line and column in status bar
set ruler

" Show command in bottom bar
set showcmd

" Redraw only when needed (performance)
set lazyredraw

" Better scrolling
set scrolloff=8
set sidescrolloff=8

" Show absolute line number on current line, relative on others (optional)
" Uncomment below to enable relative line numbers
" set relativenumber
" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

" Improve performance for large files
set synmaxcol=200

" Clipboard integration (use system clipboard)
if has('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif
