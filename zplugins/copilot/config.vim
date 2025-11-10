
" GitHub Copilot Configuration
" ==============================

" Enable Copilot for specific filetypes
" Copilot is enabled by default for all filetypes
" Uncomment and modify if you want to disable it for specific filetypes:
" let g:copilot_filetypes = {
"     \ 'gitcommit': v:false,
"     \ 'markdown': v:false,
"     \ }

" Node.js version check
" Copilot requires Node.js 16 or higher
" You can specify a custom node path if needed:
" let g:copilot_node_command = "/path/to/node"

" Key mappings for Copilot
" -------------------------

" Accept suggestion: Tab (default) or Ctrl+J
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" Use Tab for accepting suggestions
imap <expr> <Tab> copilot#Accept("\<Tab>")

" Navigate through suggestions
" Next suggestion: Alt+]
" Previous suggestion: Alt+[
imap <M-]> <Plug>(copilot-next)
imap <M-[> <Plug>(copilot-previous)

" Dismiss suggestion: Ctrl+]
imap <C-]> <Plug>(copilot-dismiss)

" Suggest alternatives: Ctrl+\
imap <C-\> <Plug>(copilot-suggest)

" Copilot panel commands
" ----------------------
" :Copilot enable - Enable Copilot
" :Copilot disable - Disable Copilot
" :Copilot status - Check Copilot status
" :Copilot setup - Run Copilot setup and authentication
" :Copilot panel - Open Copilot panel to view all suggestions

" Leader key mapping to toggle Copilot
nnoremap <leader>cp :Copilot panel<CR>
nnoremap <leader>ce :Copilot enable<CR>
nnoremap <leader>cd :Copilot disable<CR>
nnoremap <leader>cs :Copilot status<CR>

" Auto-trigger Copilot on insert mode (default behavior)
" To disable auto-triggering, uncomment:
" let g:copilot_enabled = v:false

" Copilot will show suggestions automatically as you type
" Press Tab or Ctrl+J to accept the suggestion
" Press Ctrl+] to dismiss the suggestion
" Press Alt+] or Alt+[ to navigate through multiple suggestions
