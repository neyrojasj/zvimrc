" IndentLine configuration for better code indentation visualization

" Character to use for indent line
let g:indentLine_char = '│'
" let g:indentLine_char = '┊'
" let g:indentLine_char = '▏'

" First level indent character (optional)
let g:indentLine_first_char = '│'

" Show first level indent
let g:indentLine_showFirstIndentLevel = 1

" Color settings
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#504945'

" Enable/disable by file type
let g:indentLine_fileTypeExclude = ['text', 'markdown', 'json', 'help', 'startify']

" Conceal settings (prevents issues with quotes in JSON)
let g:indentLine_setConceal = 1
let g:indentLine_concealcursor = ""
let g:indentLine_conceallevel = 2

" Enable plugin
let g:indentLine_enabled = 1

" Toggle indent lines with <leader>il
nnoremap <leader>il :IndentLinesToggle<CR>
