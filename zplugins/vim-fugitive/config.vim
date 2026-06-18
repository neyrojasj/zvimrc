" ══════════════════════════════════════════════════════════════════════════════
" vim-fugitive — Full Git integration (like VS Code Source Control panel)
" ══════════════════════════════════════════════════════════════════════════════

" Git status (equivalent to VS Code's Source Control panel)
nnoremap <leader>gs  :Git status<CR>

" Git diff (current file vs HEAD)
nnoremap <leader>gd  :Git diff<CR>

" Git diff staged
nnoremap <leader>gD  :Git diff --staged<CR>

" Git blame — annotate every line (VS Code GitLens-like)
nnoremap <leader>gb  :Git blame<CR>

" Git log (one-line graph)
nnoremap <leader>gl  :Git log --oneline --graph --decorate<CR>

" Git commit
nnoremap <leader>gc  :Git commit<CR>

" Git add current file (stage)
nnoremap <leader>gw  :Gwrite<CR>

" Git checkout current file (discard changes)
nnoremap <leader>gr  :Gread<CR>

" Git push
nnoremap <leader>gp  :Git push<CR>

" Git pull
nnoremap <leader>gP  :Git pull<CR>

" Git fetch
nnoremap <leader>gf  :Git fetch<CR>

" Open vertical diff split for merge conflicts
nnoremap <leader>gm  :Gdiffsplit!<CR>

" Keep left (ours) / right (theirs) in a merge conflict
nnoremap <leader>ghl :diffget //2<CR>
nnoremap <leader>ghr :diffget //3<CR>
