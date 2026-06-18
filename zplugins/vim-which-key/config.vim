" ══════════════════════════════════════════════════════════════════════════════
" liuchengxu/vim-which-key — Keybinding hints (like VS Code keyboard cheat sheet)
" Press <leader> and wait to see all available bindings
" ══════════════════════════════════════════════════════════════════════════════

" Show the popup after 400 ms (increase if too fast)
set timeoutlen=500

" Open the which-key popup when you press <leader>
nnoremap <silent> <leader>      :<c-u>WhichKey ','<CR>
vnoremap <silent> <leader>      :<c-u>WhichKeyVisual ','<CR>

" Optional: show for the g prefix too
nnoremap <silent> g             :<c-u>WhichKey 'g'<CR>

" ── Define the leader map ─────────────────────────────────────────────────────
let g:which_key_map = {}

" Top-level single-key bindings
let g:which_key_map['/'] = 'search files (FZF)'
let g:which_key_map['.'] = 'open buffers'
let g:which_key_map['n'] = 'file explorer'
let g:which_key_map['b'] = 'git blame (inline)'
let g:which_key_map['u'] = 'undo tree'
let g:which_key_map['o'] = 'new line below'
let g:which_key_map['O'] = 'new line above'
let g:which_key_map['d'] = 'delete to black-hole'
let g:which_key_map['p'] = 'paste (keep register)'

" Code group  (<leader>c*)
let g:which_key_map['c'] = {
  \ 'name': '+code / CoC',
  \ 'a': 'code actions',
  \ 'c': 'CoC commands',
  \ 'd': 'diagnostics list',
  \ 'e': 'copilot enable',
  \ 'p': 'copilot panel',
  \ 'o': 'outline',
  \ 's': 'symbol search',
  \ }

" Git group  (<leader>g*)
let g:which_key_map['g'] = {
  \ 'name': '+git (fugitive)',
  \ 's': 'status',
  \ 'd': 'diff',
  \ 'D': 'diff staged',
  \ 'b': 'blame',
  \ 'l': 'log',
  \ 'c': 'commit',
  \ 'w': 'stage file',
  \ 'r': 'checkout file',
  \ 'p': 'push',
  \ 'P': 'pull',
  \ 'f': 'fetch',
  \ 'm': 'merge diff split',
  \ }

" Tab group  (<leader>t*)
let g:which_key_map['t'] = {
  \ 'name': '+tabs / terminal',
  \ 'n': 'new tab / terminal',
  \ 'c': 'close tab',
  \ 'f': 'next tab',
  \ 'b': 'prev tab',
  \ 't': 'toggle terminal',
  \ 'k': 'kill terminal',
  \ 'p': 'prev terminal',
  \ 'x': 'next terminal',
  \ '1': 'tab 1', '2': 'tab 2', '3': 'tab 3',
  \ '4': 'tab 4', '5': 'tab 5',
  \ }

" Rename / refactor  (<leader>r*)
let g:which_key_map['r'] = {
  \ 'name': '+rename / format',
  \ 'n': 'rename symbol (CoC)',
  \ }

" Format  (<leader>f*)
let g:which_key_map['f'] = {
  \ 'name': '+format',
  \ 'm': 'format document',
  \ 't': 'format selected',
  \ }

" Select all  (<leader>s*)
let g:which_key_map['s'] = {
  \ 'name': '+select',
  \ 'a': 'select all occurrences',
  \ }

" Quick-fix
let g:which_key_map['q'] = { 'name': '+quickfix', 'f': 'quick fix' }

" IndentLine toggle
let g:which_key_map['i'] = { 'name': '+indent', 'l': 'toggle indent lines' }

" NERDTree find
let g:which_key_map['nf'] = 'find file in explorer'

" Register the map
call which_key#register(',', "g:which_key_map")
