" Vim-devicons configuration for file icons

" Enable folder/directory icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" Show file icons in NERDTree
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

" Use double-width glyphs
let g:WebDevIconsUnicodeGlyphDoubleWidth = 0

" Add custom icons for specific file extensions
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vim'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['py'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ts'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['json'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''

" Show folder icon
let g:DevIconsEnableFoldersOpenClose = 1
