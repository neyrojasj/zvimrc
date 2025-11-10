" Map the shortcut <leader>n to the nerdtree pluging
map <leader>n :NERDTreeToggle<CR>

" Find current file in NERDTree
map <leader>nf :NERDTreeFind<CR>

" NERDTree settings for better IDE experience
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc$', '__pycache__', '\.git$', '\.swp$', '\.DS_Store$', 'node_modules']

" Show line numbers in NERDTree
let NERDTreeShowLineNumbers=0

" Automatically close NERDTree when opening a file
let NERDTreeQuitOnOpen=0

" Show bookmarks by default
let NERDTreeShowBookmarks=1

" Minimal UI
let NERDTreeMinimalUI=1

" Change arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Window size
let NERDTreeWinSize=35

" Auto-open NERDTree when vim starts with a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Close vim if NERDTree is the only window remaining
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

