
" Ctrl+P — Quick Open files (VS Code default)
nnoremap <C-p> :Files<CR>

" <leader>/ — search files (FZF)
map <Leader>/ :Files<CR>

" <leader>. — open buffers
map <Leader>. :Buffers<CR>

" <leader><leader> — recently opened files
map <Leader><Leader> :History<CR>

" <leader>rg — ripgrep search in project (VS Code Ctrl+Shift+F)
nnoremap <leader>rg :Rg<CR>

" <leader>L — search lines in current buffer
nnoremap <leader>L :BLines<CR>

" <leader>m — search marks
nnoremap <leader>M :Marks<CR>

" Show FZF at the bottom, 40% height
let g:fzf_layout = { 'down': '~40%' }

" Allow opening files in new tab/split from FZF
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" Preview window (requires bat or cat)
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Hidden buffers for switching between open files
set hidden

" Match FZF colors to the current colorscheme
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Use ripgrep when available (faster + respects .gitignore)
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview(), <bang>0)
endif
