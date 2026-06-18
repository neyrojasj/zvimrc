" ══════════════════════════════════════════════════════════════════════════════
" vim-floaterm — Integrated terminal (VS Code Ctrl+` feel)
" ══════════════════════════════════════════════════════════════════════════════

" Terminal appearance
let g:floaterm_title      = ' Terminal ($1/$2) '
let g:floaterm_borderchars = '─│─│╭╮╯╰'

" Use a horizontal split at the bottom (most reliable across terminals)
let g:floaterm_wintype    = 'split'
let g:floaterm_position   = 'botright'
let g:floaterm_height     = 0.30

" Auto-close when process exits cleanly
let g:floaterm_autoclose  = 2

" Change to the git root when opening
let g:floaterm_rootmarkers = ['.git', 'package.json', 'Makefile', 'setup.py', 'go.mod']

" ── Key maps ──────────────────────────────────────────────────────────────────

" F4: toggle terminal (works in all terminals — like VS Code Ctrl+`)
let g:floaterm_keymap_toggle = '<F4>'

" Normal mode shortcuts
nnoremap <silent> <leader>tt  :FloatermToggle<CR>
nnoremap <silent> <leader>tn  :FloatermNew<CR>
nnoremap <silent> <leader>tk  :FloatermKill<CR>
nnoremap <silent> <leader>tp  :FloatermPrev<CR>
nnoremap <silent> <leader>tx  :FloatermNext<CR>

" Terminal mode: Esc returns to normal mode; F4 hides the terminal
tnoremap <Esc>  <C-\><C-n>
tnoremap <F4>   <C-\><C-n>:FloatermToggle<CR>
