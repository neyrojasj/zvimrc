let $PLUG_DIR = '$HOME/.vim/zplugins/plugged'

" PLUGIN INSTALLATION
"""""""""""""""""""""""""""
call plug#begin($PLUG_DIR)

" ── Status bar ────────────────────────────────────────────────────────────────
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ── Color Schemes ─────────────────────────────────────────────────────────────
Plug 'altercation/vim-colors-solarized'
Plug 'gosukiwi/vim-atom-dark'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'tomasiser/vim-code-dark'           " VS Code Dark+ theme
Plug 'catppuccin/vim', { 'as': 'catppuccin' }  " Catppuccin theme

" ── File navigation ───────────────────────────────────────────────────────────
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'      " Git status in file tree (VS Code-like)

" ── Multiple cursors ──────────────────────────────────────────────────────────
Plug 'mg979/vim-visual-multi', {'branch': 'master'}  " Ctrl+D select (VS Code-like)

" ── Tags / symbols ────────────────────────────────────────────────────────────
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/taglist.vim'

" ── Git integration ───────────────────────────────────────────────────────────
Plug 'airblade/vim-gitgutter'
Plug 'zivyangll/git-blame.vim'
Plug 'tpope/vim-fugitive'               " Full git: blame, diff, log, commit

" ── LSP / IntelliSense (VS Code-like) ────────────────────────────────────────
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Requires Node.js 16+

" ── Linting ───────────────────────────────────────────────────────────────────
Plug 'w0rp/ale'

" ── Syntax highlighting ───────────────────────────────────────────────────────
Plug 'sheerun/vim-polyglot'

" ── Icons ─────────────────────────────────────────────────────────────────────
Plug 'ryanoasis/vim-devicons'

" ── Start screen ──────────────────────────────────────────────────────────────
Plug 'mhinz/vim-startify'

" ── Editing helpers ───────────────────────────────────────────────────────────
Plug 'psliwka/vim-smoothie'             " Smooth scrolling
Plug 'tpope/vim-commentary'             " Toggle comments (gcc / Ctrl+/)
Plug 'tpope/vim-surround'               " Surround: quotes, brackets
Plug 'jiangmiao/auto-pairs'             " Auto-close brackets and quotes
Plug 'mbbill/undotree'                  " Undo history (VS Code timeline-like)

" ── Visual enhancements ───────────────────────────────────────────────────────
Plug 'Yggdroot/indentLine'              " Indent guide lines
Plug 'frazrepo/vim-rainbow'             " Rainbow parentheses
Plug 'RRethy/vim-illuminate'            " Highlight word under cursor (VS Code-like)

" ── AI pair programming ───────────────────────────────────────────────────────
Plug 'github/copilot.vim'

" ── Search ────────────────────────────────────────────────────────────────────
Plug 'haya14busa/incsearch.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'mileszs/ack.vim'
Plug 'google/vim-searchindex'

" ── Integrated terminal (VS Code-like) ────────────────────────────────────────
Plug 'voldikss/vim-floaterm'            " Toggle terminal (like VS Code Ctrl+`)

" ── Keybinding hints (VS Code-like command palette feel) ─────────────────────
Plug 'liuchengxu/vim-which-key'

" ── Formatting ────────────────────────────────────────────────────────────────
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" ── HTML / CSS ────────────────────────────────────────────────────────────────
Plug 'vim-scripts/HTML-AutoCloseTag'
Plug 'mattn/emmet-vim'
Plug 'itspriddle/vim-jquery'
Plug 'ap/vim-css-color'
Plug 'OmniSharp/omnisharp-vim'

" ── RST / Markdown ────────────────────────────────────────────────────────────
Plug 'Rykka/riv.vim'
Plug 'rhysd/vim-grammarous'

call plug#end()

" ──────────────────────────────────────────────────────────────────────────────
" PLUGIN CONFIGURATION (order matters)
" ──────────────────────────────────────────────────────────────────────────────

" Base settings and keybindings (load first)
source ~/.vim/zplugins/base/config.vim

" Status bar
source ~/.vim/zplugins/vim-airline/config.vim

" File search
source ~/.vim/zplugins/fzf/config.vim

" Multiple cursors
source ~/.vim/zplugins/vim-visual-multi/config.vim

" File explorer
source ~/.vim/zplugins/nerdtree/config.vim

" Git
source ~/.vim/zplugins/vim-gitgutter/config.vim
source ~/.vim/zplugins/git-blame/config.vim
source ~/.vim/zplugins/vim-fugitive/config.vim

" LSP / IntelliSense
source ~/.vim/zplugins/coc/config.vim

" Linting
source ~/.vim/zplugins/ale/config.vim

" Integrated terminal
source ~/.vim/zplugins/vim-floaterm/config.vim

" Undo tree
source ~/.vim/zplugins/undotree/config.vim

" Keybinding hints (load after all leader mappings are defined)
source ~/.vim/zplugins/vim-which-key/config.vim

" Visual
source ~/.vim/zplugins/incsearch/config.vim
source ~/.vim/zplugins/indentLine/config.vim
source ~/.vim/zplugins/devicons/config.vim
source ~/.vim/zplugins/rainbow-vim/config.vim
source ~/.vim/zplugins/vim-illuminate/config.vim

" Formatting
source ~/.vim/zplugins/vim-codefmt/config.vim

" HTML/templates
source ~/.vim/zplugins/emmet-vim/config.vim

" Tags
source ~/.vim/zplugins/tlist-vim/config.vim

" Start screen
source ~/.vim/zplugins/startify/config.vim

" AI
source ~/.vim/zplugins/copilot/config.vim
