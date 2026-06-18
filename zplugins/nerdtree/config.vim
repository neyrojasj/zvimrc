" Ctrl+B — toggle NERDTree (VS Code sidebar shortcut)
map <C-b>     :NERDTreeToggle<CR>
map <leader>n :NERDTreeToggle<CR>

" Find current file in tree
map <leader>nf :NERDTreeFind<CR>

" NERDTree appearance
let NERDTreeShowHidden    = 1
let NERDTreeShowBookmarks = 1
let NERDTreeMinimalUI     = 1
let NERDTreeWinSize       = 35
let NERDTreeShowLineNumbers = 0
let NERDTreeQuitOnOpen    = 0

" Ignore common noise
let NERDTreeIgnore = ['\.pyc$','__pycache__','\.git$','\.swp$','\.DS_Store$','node_modules']

" Folder arrows
let g:NERDTreeDirArrowExpandable  = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" ── nerdtree-git-plugin: VS Code-style git status icons ──────────────────────
let g:NERDTreeGitStatusIndicatorMapCustom = {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Deleted'   : '✖',
  \ 'Dirty'     : '✗',
  \ 'Ignored'   : '☒',
  \ 'Clean'     : '✔︎',
  \ 'Unknown'   : '?',
  \ }

" Show ignored files (toggle with I inside NERDTree)
let g:NERDTreeGitStatusShowIgnored = 1

" Show untracked files in parent directories too
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'

" ── Auto-open / auto-close behavior ──────────────────────────────────────────

" Always open NERDTree on startup, focus stays in the editor window
autocmd VimEnter * NERDTree | wincmd p

" Close vim if NERDTree is the only window left
autocmd BufEnter * if winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree() | q | endif

