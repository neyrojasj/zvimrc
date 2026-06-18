" ══════════════════════════════════════════════════════════════════════════════
" mbbill/undotree — Visual undo history (VS Code Timeline-like)
" ══════════════════════════════════════════════════════════════════════════════

" Toggle undo tree
nnoremap <leader>u   :UndotreeToggle<CR>
nnoremap <F5>        :UndotreeToggle<CR>

" Focus the undo tree window when opened
let g:undotree_SetFocusWhenToggle = 1

" Layout: diff panel below undo panel
let g:undotree_WindowLayout = 2

" Diff panel height
let g:undotree_DiffpanelHeight = 10

" Use shorter time indicators
let g:undotree_ShortIndicators = 1

" Width of the undo tree panel
let g:undotree_SplitWidth = 30

" Relative timestamps
let g:undotree_RelativeTimestamp = 1
