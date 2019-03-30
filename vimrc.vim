let $PLUG_DIR = '$HOME/.zplugins/plugged'

" PLUGING INSTALLATION
"""""""""""""""""""""""""""
call plug#begin($PLUG_DIR)
" Lightline plugin
Plug 'itchyny/lightline.vim'

" FZF plugin: Search files 
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

" Source the base and common configuration
source ~/.zplugins/base/config.vim

" Lightline plugin configuration
source ~/.zplugins/lightline/config.vim

" FZF plugin configuration
source ~/.zplugins/fzf/config.vim


