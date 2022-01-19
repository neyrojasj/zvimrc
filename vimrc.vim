let $PLUG_DIR = '$HOME/.vim/zplugins/plugged'

" PLUGING INSTALLATION
"""""""""""""""""""""""""""
call plug#begin($PLUG_DIR)

" Install airline plugin
" It is a plugin that incorporates a status bar at the bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Install the color palette
Plug 'altercation/vim-colors-solarized'
Plug 'gosukiwi/vim-atom-dark'

" FZF plugin: Search files
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" vim-multiple-cursors: Multiple line selector
Plug 'terryma/vim-multiple-cursors'

"NERDTree plugin: Directory hierarchy
Plug 'scrooloose/nerdtree'

"Tag bar is a side bar that shows the functions avaialable in the file"
Plug 'majutsushi/tagbar'

"vim-gitgutter plugin: Git plugin
Plug 'airblade/vim-gitgutter'

"git blame: Plugin to execute git blame in file <leader+b>
Plug 'zivyangll/git-blame.vim'

" Asynchronous Lint Engine (ALE) plugin
Plug 'w0rp/ale'

" Indent liner: Show lines per idepention
Plug 'Yggdroot/indentLine'

" incsearch plugin: Set the cursor into the search result
" as you continue typing
Plug 'haya14busa/incsearch.vim'

" Search in all the proyect feature with CtrlSF
Plug 'dyng/ctrlsf.vim'

" Vim-CodeFmt: Autoformatter plugin
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" Vim-Searchindex: Show the index of the search
Plug 'google/vim-searchindex'

" Vim-Rainbow: It add individual colors to every
" the parenthesis
Plug 'frazrepo/vim-rainbow'

" TagList: It display the different functions in the
" current file. Open it with :Tlist or <leader>tl
" To generate the tags run this command: ctags -R .
" Commands:
"   :tag <function> => to to definition
"   Ctrl+] => go to definitiion
"   Ctrl+T => go to previuos place before jumping
Plug 'vim-scripts/taglist.vim'

" Ack is a plugin to find any pattern in the proyect
Plug 'mileszs/ack.vim'

" HTML plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Auto-close
Plug 'vim-scripts/HTML-AutoCloseTag'

" Emmet plugin for auto completing html abbreviations
Plug 'mattn/emmet-vim'

" Plugin for jquery syntax
Plug 'itspriddle/vim-jquery'

" Plug that shows the color in css attibutes
Plug 'ap/vim-css-color'

" Plug for auto-completation and add documentation to the
" functions
Plug 'OmniSharp/omnisharp-vim'

" Plugin to complete while you write code
" Plug 'valloric/youcompleteme'

" RST Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" This is a plugin to visualize ReStrcture text
Plug 'Rykka/riv.vim'

" This plugin is used to check the grammar of the current file
Plug 'rhysd/vim-grammarous'

call plug#end()

" Source the base and common configuration
source ~/.vim/zplugins/base/config.vim

" Airline plugin configuration
source ~/.vim/zplugins/vim-airline/config.vim

" FZF plugin configuration
source ~/.vim/zplugins/fzf/config.vim

" vim-multiple-cursors configuration
source ~/.vim/zplugins/vim-multiple-cursors/config.vim

" nerdtree configuration
source ~/.vim/zplugins/nerdtree/config.vim

" GitGutter configuration
source ~/.vim/zplugins/vim-gitgutter/config.vim

" GitGutter configuration
source ~/.vim/zplugins/git-blame/config.vim

" ALE configuration
source ~/.vim/zplugins/ale/config.vim

" incsearch configuration
source ~/.vim/zplugins/incsearch/config.vim

" Vim-CodeFmt: Autoformatter plugin
source ~/.vim/zplugins/vim-codefmt/config.vim

" Configuration related to Emmet
source ~/.vim/zplugins/emmet-vim/config.vim

" Configuration related to Rainbow
source ~/.vim/zplugins/rainbow-vim/config.vim

" Configuration related to TList
source ~/.vim/zplugins/tlist-vim/config.vim
