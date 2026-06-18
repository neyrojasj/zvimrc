" ══════════════════════════════════════════════════════════════════════════════
" CoC (Conquer of Completion) — VS Code-like IntelliSense
" Requires: Node.js 16+   (run :CocInfo to verify)
" ══════════════════════════════════════════════════════════════════════════════

" Auto-install these CoC extensions on first launch
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-pyright',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-yaml',
  \ 'coc-sh',
  \ 'coc-prettier',
  \ 'coc-eslint',
  \ 'coc-snippets',
  \ 'coc-git',
  \ 'coc-highlight',
  \ 'coc-pairs',
  \ ]

" ── Completion ────────────────────────────────────────────────────────────────

" Tab: navigate completion menu / insert tab if no completion
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Enter: confirm completion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Ctrl+Space: trigger completion (VS Code default)
inoremap <silent><expr> <C-Space> coc#refresh()

" ── Navigation ────────────────────────────────────────────────────────────────

" Navigate diagnostics (F8 / [d / ]d)
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
nmap <silent> <F8> <Plug>(coc-diagnostic-next)

" Go to Definition — F12 (VS Code default)
nmap <silent> <F12>   <Plug>(coc-definition)
nmap <silent> gd      <Plug>(coc-definition)
nmap <silent> gy      <Plug>(coc-type-definition)
nmap <silent> gi      <Plug>(coc-implementation)
nmap <silent> gr      <Plug>(coc-references)

" Show references — Shift+F12 (VS Code default)
nmap <silent> <S-F12> <Plug>(coc-references)

" ── Hover documentation (VS Code: hover on K) ─────────────────────────────────
nnoremap <silent> K :call <SID>ShowDocumentation()<CR>

function! s:ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight symbol under cursor (VS Code highlights all occurrences)
autocmd CursorHold * silent call CocActionAsync('highlight')

" ── Refactoring ───────────────────────────────────────────────────────────────

" Rename symbol — F2 (VS Code default)
nmap <F2>         <Plug>(coc-rename)
nmap <leader>rn   <Plug>(coc-rename)

" Format document (Shift+Alt+F in VS Code, <leader>fmt here)
nmap <leader>fmt  :call CocAction('format')<CR>
xmap <leader>fmt  <Plug>(coc-format-selected)

" Code actions (VS Code: Ctrl+.)
nmap <leader>ca   <Plug>(coc-codeaction-cursor)
xmap <leader>ca   <Plug>(coc-codeaction-selected)

" Quick fix current line
nmap <leader>qf   <Plug>(coc-fix-current)

" ── Panels & Lists ────────────────────────────────────────────────────────────

" Outline panel (like VS Code Outline)
nnoremap <leader>co  :CocOutline<CR>

" Symbol search
nnoremap <leader>cs  :CocList symbols<CR>

" Diagnostics list
nnoremap <leader>cd  :CocList diagnostics<CR>

" CoC commands
nnoremap <leader>cc  :CocList commands<CR>

" ── Scroll float windows ──────────────────────────────────────────────────────
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" ── Snippets ──────────────────────────────────────────────────────────────────
imap <C-l> <Plug>(coc-snippets-expand)
let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'

" ── Status line integration ───────────────────────────────────────────────────
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" ── Text objects (select inside/around functions & classes) ──────────────────
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
