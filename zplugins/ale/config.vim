
" ALE — linting only (completion handled by CoC)
" Disable ALE completion to avoid conflict with CoC
let g:ale_completion_enabled = 0

" Only run linters that are explicitly configured
let g:ale_linters_explicit = 0

" Linter configuration per language
let g:ale_linters = {
  \ 'python':     ['flake8', 'pylint'],
  \ 'javascript': ['eslint'],
  \ 'typescript': ['eslint', 'tsserver'],
  \ 'go':         ['golint', 'go vet'],
  \ 'sh':         ['shellcheck'],
  \ 'vim':        ['vimls'],
  \ }

" Fixer configuration (auto-fix on save)
let g:ale_fixers = {
  \ '*':          ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['prettier', 'eslint'],
  \ 'typescript': ['prettier', 'eslint'],
  \ 'python':     ['black', 'isort'],
  \ 'css':        ['prettier'],
  \ 'html':       ['prettier'],
  \ 'json':       ['prettier'],
  \ }

" Auto-fix on save
let g:ale_fix_on_save = 1

" Appearance
let g:ale_sign_error   = '✘'
let g:ale_sign_warning = '▲'
let g:ale_sign_info    = '●'

" Virtual text (inline error messages — VS Code-like)
let g:ale_virtualtext_cursor = 'current'

" Don't lint while typing — only on save and insert-leave
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save         = 1

" Go to definition via ALE (fallback when CoC unavailable)
map <leader>go :ALEGoToDefinition<CR>

" Navigate errors
nmap <silent> <leader>aj :ALENext<CR>
nmap <silent> <leader>ak :ALEPrevious<CR>

" Show details for error under cursor
nmap <leader>ad :ALEDetail<CR>
