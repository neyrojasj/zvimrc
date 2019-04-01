let $PLUG_DIR = '$HOME/.zplugins/plugged'

" PLUGING INSTALLATION
"""""""""""""""""""""""""""
call plug#begin($PLUG_DIR)
" Lightline plugin
Plug 'itchyny/lightline.vim'

" FZF plugin: Search files
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" vim-multiple-cursors: Multiple line selector
Plug 'terryma/vim-multiple-cursors'

"NERDTree plugin: Directory hierarchy
Plug 'scrooloose/nerdtree'

"vim-gitgutter plugin: Git plugin
Plug 'airblade/vim-gitgutter'

" Asynchronous Lint Engine (ALE) plugin
Plug 'w0rp/ale'

" Indent liner: Show lines per idepention
Plug 'Yggdroot/indentLine'
call plug#end()

" Source the base and common configuration
source ~/.zplugins/base/config.vim

" Lightline plugin configuration
source ~/.zplugins/lightline/config.vim

" FZF plugin configuration
source ~/.zplugins/fzf/config.vim

" vim-multiple-cursors configuration
source ~/.zplugins/vim-multiple-cursors/config.vim

" nerdtree configuration
source ~/.zplugins/nerdtree/config.vim

" GitGutter configuration
source ~/.zplugins/vim-gitgutter/config.vim

" ALE configuration
source ~/.zplugins/ale/config.vim

" indentLine configuration
source ~/.zplugins/vim-indent-guides/config.vim
