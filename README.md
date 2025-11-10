# Vim IDE Configuration

A comprehensive, beautiful, and productive Vim configuration that transforms Vim into a modern, full-featured IDE with excellent visual appearance and powerful development tools.

![Vim Version](https://img.shields.io/badge/vim-8.0+-green.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

---

## Table of Contents

- [Quick Start](#quick-start)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Post-Installation Setup](#post-installation-setup)
- [Keyboard Shortcuts Reference](#keyboard-shortcuts-reference)
- [Plugin Configuration](#plugin-configuration)
- [Customization Guide](#customization-guide)
- [Plugin List](#plugin-list)
- [Tips & Best Practices](#tips--best-practices)
- [Troubleshooting](#troubleshooting)

---

## Quick Start

```bash
# 1. Clone the repository
git clone https://github.com/neyrojasj/zvimrc.git ~/.vim/zvimrc

# 2. Run setup script (installs dependencies and creates symlinks)
cd ~/.vim/zvimrc
./setup.sh $HOME

# 3. Create symlink to vimrc
ln -sf ~/.vim/zvimrc/vimrc.vim ~/.vimrc

# 4. Open Vim and install plugins
vim +PlugInstall +qall

# 5. (Optional) Install Powerline fonts for best visuals
sudo apt-get install fonts-powerline  # Ubuntu/Debian
# or
brew install font-hack-nerd-font      # macOS

# 6. (Optional) Setup GitHub Copilot
vim
# In Vim, run: :Copilot setup
```

**That's it!** Open Vim and enjoy your new IDE setup.

---

## Features

### 🎨 Beautiful Visual Appearance

- **Modern Color Schemes**: Gruvbox (default), Dracula, OneDark, Nord, Solarized, Atom-Dark
- **24-bit True Colors**: Rich color palette support for modern terminals
- **Powerline Status Bar**: Beautiful status line with icons, git branch, and file info
- **File Type Icons**: Visual indicators for different file types in NERDTree and status bar
- **Fancy Start Screen**: Welcome screen showing recent files, bookmarks, and quick commands
- **Syntax Highlighting**: Enhanced syntax support for 100+ programming languages
- **Visual Indent Guides**: Clear indentation lines for better code structure visualization
- **Rainbow Parentheses**: Color-coded nested brackets, braces, and parentheses
- **Smooth Scrolling**: Animated smooth scrolling for better navigation experience
- **Custom Cursor Line**: Highlighted current line with customizable colors

### 🚀 Powerful IDE Features

#### File Management & Navigation
- **NERDTree**: Feature-rich file explorer with icons and git status
- **FZF**: Lightning-fast fuzzy file finder (Ctrl+P)
- **Startify**: Beautiful start screen with recent files and sessions
- **File Bookmarks**: Quick access to frequently used files
- **Auto Directory Switching**: Automatically change to project root

#### Code Intelligence & Editing
- **GitHub Copilot**: AI-powered code completion and suggestions
- **ALE (Asynchronous Lint Engine)**: Real-time linting and error checking
- **Tagbar**: Code structure overview showing functions, classes, variables
- **Auto-completion**: Built-in omnifunc completion for multiple languages
- **Auto-pairs**: Intelligent auto-closing of brackets, quotes, and tags
- **Multiple Cursors**: Edit multiple locations simultaneously
- **Code Folding**: Fold/unfold code blocks with space bar
- **Smart Indentation**: Automatic indentation based on file type

#### Git Integration
- **GitGutter**: Real-time git diff indicators in the sign column
- **Git Blame**: View git blame information inline
- **Branch Display**: Current git branch shown in status bar
- **Hunk Navigation**: Jump between git changes

#### Search & Replace
- **FZF Search**: Fuzzy file and content search
- **CtrlSF**: Project-wide search with preview
- **Ack**: Fast pattern searching across files
- **Incsearch**: Enhanced incremental search with highlights
- **Search Index**: Shows match count (e.g., "3/12")
- **Smart Case**: Intelligent case-sensitive/insensitive search

#### Code Formatting & Tools
- **Vim-CodeFmt**: Auto-formatting for multiple languages
- **Emmet**: HTML/CSS abbreviation expansion (essential for web dev)
- **Commentary**: Quick commenting/uncommenting of code
- **Surround**: Easily change surrounding quotes, brackets, tags
- **HTML Auto-close**: Automatic HTML tag closing
- **CSS Color Preview**: See color values directly in your code

#### Productivity Enhancements
- **Persistent Undo**: Undo history survives between sessions
- **System Clipboard**: Seamless integration with OS clipboard
- **Split Windows**: Easy window management and navigation
- **Tab Management**: Full tab support with quick shortcuts
- **Spell Checking**: Automatic spell check for documentation files
- **Auto-save Formatting**: Remove trailing whitespace on save

---

## Prerequisites

Before installation, ensure you have the following:

### Required
- **Vim 8.0+** or **Neovim 0.4+**
  ```bash
  vim --version | head -1
  ```
- **Git** (for plugin management)
  ```bash
  git --version
  ```
- **curl** (for downloading plugins)
  ```bash
  curl --version
  ```

### Recommended
- **Node.js 16+ & npm/yarn** (required for GitHub Copilot, optional for CoC)
  ```bash
  node --version  # Should be 16.x or higher for Copilot
  npm --version
  ```
- **Python 3** (for some plugins)
  ```bash
  python3 --version
  ```
- **Powerline Fonts** or **Nerd Fonts** (for icons and symbols)
- **A modern terminal** with true color support (iTerm2, Alacritty, Kitty, Gnome Terminal, etc.)

### Optional (Language-specific)
- **ctags** or **universal-ctags** (for Tagbar and code navigation)
  ```bash
  sudo apt-get install universal-ctags  # Ubuntu/Debian
  brew install universal-ctags          # macOS
  ```
- **ripgrep** or **ag** (for faster searching)
  ```bash
  sudo apt-get install ripgrep          # Ubuntu/Debian
  brew install ripgrep                  # macOS
  ```
- **Language linters** (for ALE):
  - Python: `pip install pylint flake8 black`
  - JavaScript: `npm install -g eslint prettier`
  - Other languages: Install respective linters

---

## Installation

### Method 1: Automated Setup (Recommended)

```bash
# 1. Clone this repository
git clone https://github.com/neyrojasj/zvimrc.git ~/.vim/zvimrc

# 2. Navigate to the directory
cd ~/.vim/zvimrc

# 3. Make setup script executable
chmod +x setup.sh

# 4. Run setup script (automatically installs vim-plug, creates symlinks, and dependencies)
./setup.sh $HOME

# 5. Create symbolic link to your vimrc
ln -sf ~/.vim/zvimrc/vimrc.vim ~/.vimrc

# 6. Open Vim and install all plugins
vim +PlugInstall +qall

# 7. Restart Vim
vim
```

### Method 2: Manual Setup

If you prefer manual installation or the script doesn't work:

```bash
# 1. Install Vim-Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 2. Clone this repository
git clone https://github.com/neyrojasj/zvimrc.git ~/.vim/zvimrc

# 3. Link the vimrc file
ln -sf ~/.vim/zvimrc/vimrc.vim ~/.vimrc

# 4. Link plugin configurations
mkdir -p ~/.vim
ln -sf ~/.vim/zvimrc/zplugins ~/.vim/zplugins

# 5. Install Node.js and Yarn (if needed)
# Ubuntu/Debian:
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs yarn

# macOS:
brew install node yarn

# 6. Install system dependencies
# Ubuntu/Debian:
sudo apt-get install -y xclip universal-ctags ripgrep

# macOS:
brew install universal-ctags ripgrep

# 7. Open Vim and install plugins
vim
# Inside Vim, run:
:PlugInstall
```

### What the Setup Script Does

The `setup.sh` script automatically:
1. Detects your operating system (Linux/macOS)
2. Installs `curl` if not present
3. Downloads and installs Vim-Plug
4. **Creates symlinks for all plugin configurations** (including Copilot)
5. Installs Node.js and Yarn
6. Installs system utilities (xclip, prettier)
7. Downloads LanguageTool for grammar checking
8. Creates necessary directories

---

## Post-Installation Setup

### 1. Install Powerline Fonts (Highly Recommended)

For the best visual experience with icons and symbols:

#### Ubuntu/Debian
```bash
sudo apt-get install fonts-powerline
```

#### macOS
```bash
# Using Homebrew
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
brew install font-fira-code-nerd-font
brew install font-meslo-lg-nerd-font
```

#### Manual Installation (All OS)
```bash
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
```

#### Nerd Fonts (Recommended for best icons)
```bash
git clone https://github.com/ryanoasis/nerd-fonts.git --depth=1
cd nerd-fonts
./install.sh Hack
cd ..
rm -rf nerd-fonts
```

### 2. Configure Your Terminal

After installing fonts:
1. Open your terminal settings/preferences
2. Change the font to one of:
   - Hack Nerd Font
   - Fira Code Nerd Font
   - Meslo LG Nerd Font
   - Any Powerline-patched font
3. Enable 24-bit true colors (most modern terminals support this by default)

#### For tmux users:
Add to your `~/.tmux.conf`:
```bash
set -g default-terminal "screen-256color"
set -ga terminal-overrides ",xterm-256color:Tc"
```

### 3. Install Language Linters (Optional but Recommended)

For real-time error checking with ALE:

```bash
# Python
pip install pylint flake8 black autopep8

# JavaScript/TypeScript
npm install -g eslint prettier typescript

# Shell scripts
sudo apt-get install shellcheck  # Ubuntu/Debian
brew install shellcheck          # macOS

# YAML
pip install yamllint

# Docker
npm install -g dockerfile-lint

# JSON
npm install -g jsonlint

# CSS/SCSS
npm install -g stylelint

# Go
go install golang.org/x/lint/golint@latest

# Rust
rustup component add clippy
```

### 4. First Time Setup in Vim

Open Vim and run these commands:

```vim
" Install all plugins
:PlugInstall

" Update all plugins (optional)
:PlugUpdate

" Clean up unused plugins (optional)
:PlugClean

" Check plugin status
:PlugStatus

" Check ALE linter status
:ALEInfo
```

### 5. GitHub Copilot Setup (Optional)

If you have a GitHub Copilot subscription:

1. **Ensure Node.js 16+ is installed**:
   ```bash
   node --version  # Should be 16.x or higher
   ```

2. **Open Vim and authenticate**:
   ```vim
   :Copilot setup
   ```

3. **Follow the authentication flow**:
   - A browser window will open
   - Log in to your GitHub account
   - Authorize GitHub Copilot for Vim
   - Enter the provided code

4. **Verify Copilot is working**:
   ```vim
   :Copilot status
   ```

5. **Start coding**: Copilot will automatically suggest completions as you type
   - Press `Tab` to accept suggestions
   - Press `Alt+]` to see alternative suggestions
   - Press `Ctrl+]` to dismiss suggestions

**Note**: GitHub Copilot requires an active subscription. Visit [github.com/features/copilot](https://github.com/features/copilot) for pricing and plans.

---

## Keyboard Shortcuts Reference

### Essential Information
- **Leader Key**: `,` (comma)
- **Local Leader**: `\` (backslash) - for language-specific mappings
- Most commands work in NORMAL mode unless specified otherwise

---

### File Management & Navigation

| Shortcut | Mode | Action | Plugin |
|----------|------|--------|--------|
| `,n` | Normal | Toggle NERDTree file explorer | NERDTree |
| `,nf` | Normal | Find and reveal current file in NERDTree | NERDTree |
| `Ctrl+p` | Normal | Open FZF fuzzy file finder | FZF |
| `:Files` | Command | FZF file search in current directory | FZF |
| `:Buffers` | Command | FZF buffer list | FZF |
| `:History` | Command | Recently opened files | FZF |
| `F8` | Normal | Toggle Tagbar (code structure) | Tagbar |
| `:Tlist` | Command | Open TagList | TagList |
| `,tl` | Normal | Toggle TagList | TagList |

**NERDTree Navigation** (when NERDTree is open):
| Key | Action |
|-----|--------|
| `Enter` | Open file/expand directory |
| `o` | Open file in split |
| `i` | Open file in vertical split |
| `s` | Open file in new tab |
| `m` | Show menu (add/delete/move files) |
| `R` | Refresh file tree |
| `I` | Toggle hidden files |
| `B` | Toggle bookmarks |
| `?` | Show help |

---

### Tab Management

| Shortcut | Mode | Action |
|----------|------|--------|
| `,tn` | Normal | Create new tab |
| `,tc` | Normal | Close current tab |
| `,tf` | Normal | Go to next tab |
| `,tb` | Normal | Go to previous tab |
| `,t1` to `,t9` | Normal | Jump to tab 1-9 |
| `Ctrl+Shift+Right` | Normal | Next tab (alternative) |
| `Ctrl+Shift+Left` | Normal | Previous tab (alternative) |
| `gt` | Normal | Next tab (default Vim) |
| `gT` | Normal | Previous tab (default Vim) |
| `:tabnew` | Command | New tab |
| `:tabclose` | Command | Close tab |

---

### Window/Split Management

| Shortcut | Mode | Action |
|----------|------|--------|
| `Ctrl+j` | Normal | Move to window below |
| `Ctrl+k` | Normal | Move to window above |
| `Ctrl+h` | Normal | Move to window left |
| `Ctrl+l` | Normal | Move to window right |
| `Ctrl+w v` | Normal | Vertical split |
| `Ctrl+w s` | Normal | Horizontal split |
| `Ctrl+w q` | Normal | Close window |
| `Ctrl+w =` | Normal | Equalize window sizes |
| `Ctrl+w _` | Normal | Maximize height |
| `Ctrl+w |` | Normal | Maximize width |

---

### Code Editing

| Shortcut | Mode | Action | Plugin |
|----------|------|--------|--------|
| `,o` | Normal | Insert blank line below (stay in normal mode) | Built-in |
| `,O` | Normal | Insert blank line above (stay in normal mode) | Built-in |
| `Space` | Normal | Toggle code fold at cursor | Built-in |
| `za` | Normal | Toggle fold (default Vim) | Built-in |
| `zR` | Normal | Open all folds | Built-in |
| `zM` | Normal | Close all folds | Built-in |
| `gc` | Visual | Toggle comment on selection | Commentary |
| `gcc` | Normal | Toggle comment on current line | Commentary |
| `gcap` | Normal | Comment a paragraph | Commentary |
| `,d` | Visual | Delete to black hole register (preserves yank) | Built-in |
| `,p` | Visual | Paste without yanking replaced text | Built-in |
| `>>` | Normal/Visual | Indent right | Built-in |
| `<<` | Normal/Visual | Indent left | Built-in |
| `=` | Visual | Auto-indent selection | Built-in |
| `==` | Normal | Auto-indent current line | Built-in |

---

### Surround Plugin (Change surrounding characters)

| Shortcut | Mode | Action | Example |
|----------|------|--------|---------|
| `cs"'` | Normal | Change surrounding " to ' | `"hello"` → `'hello'` |
| `cs'<q>` | Normal | Change ' to `<q>` tags | `'hello'` → `<q>hello</q>` |
| `cst"` | Normal | Change tag to " | `<q>hello</q>` → `"hello"` |
| `ds"` | Normal | Delete surrounding " | `"hello"` → `hello` |
| `ysiw]` | Normal | Surround word with [] | `hello` → `[hello]` |
| `yss)` | Normal | Surround line with () | `hello world` → `(hello world)` |
| `S<div>` | Visual | Wrap selection in `<div>` tag | (visual mode) |

---

### Multiple Cursors

| Shortcut | Mode | Action |
|----------|------|--------|
| `Ctrl+n` | Normal/Visual | Select word under cursor, add next match |
| `Ctrl+p` | Visual | Remove current match, go back to previous |
| `Ctrl+x` | Visual | Skip current match |
| `Esc` | Visual | Exit multiple cursors mode |

**Usage**: Position cursor on a word, press `Ctrl+n` repeatedly to select multiple occurrences, then edit normally.

---

### Search & Replace

| Shortcut | Mode | Action |
|----------|------|--------|
| `/pattern` | Normal | Search forward for pattern |
| `?pattern` | Normal | Search backward for pattern |
| `n` | Normal | Jump to next search result |
| `N` | Normal | Jump to previous search result |
| `*` | Normal | Search forward for word under cursor |
| `#` | Normal | Search backward for word under cursor |
| `:noh` | Command | Clear search highlighting |
| `:%s/old/new/g` | Command | Replace all occurrences in file |
| `:%s/old/new/gc` | Command | Replace all with confirmation |
| `:CtrlSF pattern` | Command | Search in project with preview |
| `:Ack pattern` | Command | Search using Ack |

---

### Git Integration

| Shortcut | Mode | Action | Plugin |
|----------|------|--------|--------|
| `,b` | Normal | Show git blame for current line | Git-Blame |
| `]c` | Normal | Jump to next git change (hunk) | GitGutter |
| `[c` | Normal | Jump to previous git change (hunk) | GitGutter |
| `:GitGutterToggle` | Command | Toggle git gutter | GitGutter |
| `:GitGutterLineHighlightsToggle` | Command | Toggle line highlighting | GitGutter |

---

### Code Navigation

| Shortcut | Mode | Action |
|----------|------|--------|
| `Ctrl+]` | Normal | Jump to definition (ctags) |
| `Ctrl+t` | Normal | Jump back from definition |
| `:tag function_name` | Command | Jump to tag/function |
| `F8` | Normal | Toggle Tagbar |
| `gd` | Normal | Go to local declaration |
| `gD` | Normal | Go to global declaration |
| `K` | Normal | Show documentation for word under cursor |

---

### Auto-completion

| Shortcut | Mode | Action |
|----------|------|--------|
| `Ctrl+x Ctrl+o` | Insert | Trigger omni-completion |
| `Ctrl+x Ctrl+f` | Insert | File path completion |
| `Ctrl+x Ctrl+l` | Insert | Whole line completion |
| `Ctrl+n` | Insert | Next completion suggestion |
| `Ctrl+p` | Insert | Previous completion suggestion |

---

### GitHub Copilot (AI Code Completion)

| Shortcut | Mode | Action |
|----------|------|--------|
| `Tab` | Insert | Accept Copilot suggestion |
| `Ctrl+J` | Insert | Accept Copilot suggestion (alternative) |
| `Alt+]` | Insert | Next suggestion |
| `Alt+[` | Insert | Previous suggestion |
| `Ctrl+]` | Insert | Dismiss suggestion |
| `Ctrl+\` | Insert | Request alternative suggestions |
| `,cp` | Normal | Open Copilot panel |
| `,ce` | Normal | Enable Copilot |
| `,cd` | Normal | Disable Copilot |
| `,cs` | Normal | Check Copilot status |
| `:Copilot setup` | Command | Authenticate with GitHub |
| `:Copilot enable` | Command | Enable Copilot |
| `:Copilot disable` | Command | Disable Copilot |
| `:Copilot status` | Command | Check authentication status |

**Note**: Requires Node.js 16+ and GitHub Copilot subscription. Run `:Copilot setup` after installation to authenticate.

---

### Emmet (HTML/CSS)

| Shortcut | Mode | Action | Example |
|----------|------|--------|---------|
| `Ctrl+y ,` | Insert | Expand Emmet abbreviation | `div>ul>li*3` → full HTML |
| `Ctrl+y n` | Normal | Next edit point | Jump to next editable position |
| `Ctrl+y N` | Normal | Previous edit point | Jump to previous editable position |

**Example**: Type `html:5` and press `Ctrl+y ,` to generate HTML5 boilerplate.

---

### Clipboard & Copy/Paste

| Shortcut | Mode | Action |
|----------|------|--------|
| `F2` | Visual | Copy selection to system clipboard |
| `"+y` | Visual | Yank to system clipboard |
| `"+p` | Normal | Paste from system clipboard |
| `y` | Visual | Yank (copy) |
| `yy` | Normal | Yank entire line |
| `p` | Normal | Paste after cursor |
| `P` | Normal | Paste before cursor |

---

### Visual Enhancements

| Shortcut | Mode | Action | Plugin |
|----------|------|--------|--------|
| `,il` | Normal | Toggle indent lines visibility | IndentLine |
| `:RainbowToggle` | Command | Toggle rainbow parentheses | Rainbow |
| `:Startify` | Command | Show start screen | Startify |

---

### Utility Commands

| Shortcut | Mode | Action |
|----------|------|--------|
| `:w` | Command | Save file |
| `:wq` or `:x` | Command | Save and quit |
| `:q!` | Command | Quit without saving |
| `:e filename` | Command | Open file |
| `:vsplit` or `:vs` | Command | Vertical split |
| `:split` or `:sp` | Command | Horizontal split |
| `u` | Normal | Undo |
| `Ctrl+r` | Normal | Redo |
| `.` | Normal | Repeat last command |
| `:%!command` | Command | Filter file through external command |

---

### Spell Checking

| Shortcut | Mode | Action |
|----------|------|--------|
| `:set spell` | Command | Enable spell checking |
| `:set nospell` | Command | Disable spell checking |
| `]s` | Normal | Jump to next misspelled word |
| `[s` | Normal | Jump to previous misspelled word |
| `z=` | Normal | Show spelling suggestions |
| `zg` | Normal | Add word to dictionary |
| `zw` | Normal | Mark word as misspelled |

*Note: Spell checking is automatically enabled for `.md`, `.markdown`, `.rst`, and `.yaml` files.*

---

### ALE (Linting)

| Shortcut | Mode | Action |
|----------|------|--------|
| `:ALEInfo` | Command | Show linter information |
| `:ALEToggle` | Command | Toggle ALE on/off |
| `]a` | Normal | Jump to next ALE warning/error |
| `[a` | Normal | Jump to previous ALE warning/error |
| `:ALEFix` | Command | Auto-fix issues |

---

## Plugin Configuration

### Most Useful Plugins & Their Usage

#### 1. **NERDTree** - File Explorer
```vim
" Open/close with ,n
" Focus on current file with ,nf
" Inside NERDTree:
" - Press 'm' to add/delete/move files
" - Press 'I' to toggle hidden files
" - Press 's' to open in vertical split
```

#### 2. **FZF** - Fuzzy Finder
```vim
:Files          " Search files
:Buffers        " List open buffers
:History        " Recent files
:Lines          " Search in all open buffers
:BLines         " Search in current buffer
:Tags           " Search ctags
:Commits        " Git commits
```

#### 3. **ALE** - Linting
```vim
" Automatically runs linters as you type
" Configure linters in zplugins/ale/config.vim
:ALEInfo        " Check what linters are available
:ALEFix         " Auto-fix issues
```

#### 4. **Vim-Airline** - Status Bar
- Shows current mode, file name, git branch
- Displays line/column number, file encoding
- Shows error/warning count from ALE
- Tab/buffer list at top

#### 5. **GitGutter** - Git Integration
- Shows git diff in sign column:
  - `+` added lines
  - `~` modified lines
  - `-` removed lines
- Jump between changes with `]c` and `[c`

---

## Customization Guide

### Changing Color Schemes

1. Edit `~/.vim/zplugins/base/config.vim`
2. Find the colorscheme section:
   ```vim
   colorscheme gruvbox
   ```
3. Change to one of:
   - `gruvbox` (default) - warm, retro groove
   - `dracula` - dark with purple accents
   - `onedark` - Atom editor inspired
   - `nord` - arctic, bluish theme
   - `solarized` - classic, precision colors
   - `atom-dark` - dark Atom theme

4. Save and restart Vim

### Changing Airline Theme

1. Edit `~/.vim/zplugins/vim-airline/config.vim`
2. Uncomment your preferred theme:
   ```vim
   let g:airline_theme='gruvbox'
   " let g:airline_theme='dracula'
   " let g:airline_theme='onedark'
   " let g:airline_theme='nord'
   ```

### Enable CoC (Advanced Code Completion)

If you have Node.js installed and want advanced IDE features:

1. Edit `~/.vim/zvimrc/vimrc.vim`
2. Uncomment this line:
   ```vim
   Plug 'neoclide/coc.nvim', {'branch': 'release'}
   ```
3. Run in Vim:
   ```vim
   :PlugInstall
   ```
4. Install language servers:
   ```vim
   :CocInstall coc-tsserver coc-python coc-json coc-html coc-css
   ```

### Enable Relative Line Numbers

1. Edit `~/.vim/zplugins/base/config.vim`
2. Uncomment these lines:
   ```vim
   set relativenumber
   augroup numbertoggle
     autocmd!
     autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
     autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
   augroup END
   ```

### Custom Key Mappings

Add your own shortcuts in `~/.vim/zplugins/base/config.vim`:

```vim
" Example: Map F5 to run Python script
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Example: Map Ctrl+s to save
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
```

### Disable Plugins

To disable a plugin, comment it out in `vimrc.vim`:

```vim
" Plug 'psliwka/vim-smoothie'  " Disabled smooth scrolling
```

Then run `:PlugClean` in Vim.

---

## Plugin List

### Visual Enhancements
| Plugin | Description | Config File |
|--------|-------------|-------------|
| vim-airline | Statusline/tabline | `zplugins/vim-airline/config.vim` |
| vim-airline-themes | Themes for airline | Auto-configured |
| gruvbox | Modern retro color scheme | `zplugins/base/config.vim` |
| dracula | Dark theme with purple | `zplugins/base/config.vim` |
| onedark | Atom-inspired theme | `zplugins/base/config.vim` |
| nord | Arctic-inspired theme | `zplugins/base/config.vim` |
| vim-devicons | File type icons | `zplugins/devicons/config.vim` |
| indentLine | Indentation guides | `zplugins/indentLine/config.vim` |
| vim-rainbow | Rainbow parentheses | `zplugins/rainbow-vim/config.vim` |
| vim-startify | Start screen | `zplugins/startify/config.vim` |

### Code Intelligence
| Plugin | Description | Config File |
|--------|-------------|-------------|
| copilot.vim | GitHub Copilot AI code completion | `zplugins/copilot/config.vim` |
| ale | Asynchronous linting | `zplugins/ale/config.vim` |
| tagbar | Code structure overview | `zplugins/tagbar/config.vim` |
| taglist | Function/class browser | `zplugins/tlist-vim/config.vim` |
| omnisharp-vim | C# support | Auto-configured |
| vim-polyglot | 100+ language support | Auto-configured |

### File Navigation
| Plugin | Description | Config File |
|--------|-------------|-------------|
| nerdtree | File explorer | `zplugins/nerdtree/config.vim` |
| fzf | Fuzzy finder | `zplugins/fzf/config.vim` |
| fzf.vim | FZF integration | `zplugins/fzf/config.vim` |
| ctrlsf | Project search | Auto-configured |
| ack.vim | Pattern search | Auto-configured |

### Git Integration
| Plugin | Description | Config File |
|--------|-------------|-------------|
| vim-gitgutter | Git diff in sign column | `zplugins/vim-gitgutter/config.vim` |
| git-blame.vim | Git blame viewer | `zplugins/git-blame/config.vim` |

### Code Editing
| Plugin | Description | Config File |
|--------|-------------|-------------|
| vim-multiple-cursors | Multiple cursors | `zplugins/vim-multiple-cursors/config.vim` |
| incsearch.vim | Better search | `zplugins/incsearch/config.vim` |
| vim-codefmt | Auto-formatting | `zplugins/vim-codefmt/config.vim` |
| vim-searchindex | Search count | Auto-configured |
| auto-pairs | Auto-close brackets | Auto-configured |
| vim-commentary | Easy commenting | Auto-configured |
| vim-surround | Surround manipulation | Auto-configured |

### HTML/Web Development
| Plugin | Description | Config File |
|--------|-------------|-------------|
| emmet-vim | HTML abbreviations | `zplugins/emmet-vim/config.vim` |
| HTML-AutoCloseTag | Auto-close HTML tags | Auto-configured |
| vim-jquery | jQuery syntax | Auto-configured |
| vim-css-color | CSS color preview | Auto-configured |

### Other
| Plugin | Description | Config File |
|--------|-------------|-------------|
| vim-smoothie | Smooth scrolling | Auto-configured |
| riv.vim | ReStructuredText | Auto-configured |
| vim-grammarous | Grammar checking | Auto-configured |

---

## Tips & Best Practices

### Performance Tips

1. **Large Files**: The config automatically limits syntax highlighting to 200 columns
2. **Speed Up**: Disable plugins you don't use with `:PlugClean`
3. **Faster Search**: Install `ripgrep` or `ag` for faster FZF searches
4. **Persistent Undo**: Undo history is saved to `~/.vim/undodir`

### Productivity Tips

1. **Learn One Plugin at a Time**: Don't try to learn everything at once
2. **Use FZF**: `Ctrl+p` is your best friend for quick file navigation
3. **Master Split Windows**: Use `Ctrl+w` commands to manage splits
4. **Use Marks**: Set marks with `ma`, jump to them with `'a`
5. **Practice Vim Motions**: Learn `ciw`, `di"`, `ya{`, etc.
6. **Use Macros**: Record with `q`, replay with `@`

### Workflow Examples

#### Web Development
```vim
" 1. Open project with NERDTree
,n

" 2. Find file quickly
Ctrl+p (type filename)

" 3. Open in split
Ctrl+w v (vertical split)

" 4. Use Emmet for HTML
" Type: html:5
" Press: Ctrl+y ,

" 5. Preview colors in CSS (automatic)

" 6. Format code
:ALEFix
```

#### Python Development
```vim
" 1. Enable spell check for docstrings
:set spell

" 2. Jump to function definition
Ctrl+]

" 3. View code structure
F8 (Tagbar)

" 4. Lint automatically (ALE runs in background)

" 5. Format with black
:ALEFix
```

### Clipboard Tips

- **Yank to system clipboard**: Select text, then `"+y`
- **Paste from system**: Press `"+p` in normal mode
- **Quick copy**: Select text and press `F2`
- **Paste without yank**: Visual select, then `,p`

### Search Tips

- **Case-insensitive**: `/pattern` (if pattern is lowercase)
- **Case-sensitive**: `/Pattern` (if pattern has uppercase)
- **Whole word**: `/\<word\>`
- **Clear highlight**: `:noh`
- **Count matches**: Automatic with vim-searchindex

### Git Workflow

```vim
" 1. Check git status in NERDTree (shows modified files)
,n

" 2. See changes in gutter (GitGutter shows +/~/-)

" 3. Jump between changes
]c (next change)
[c (previous change)

" 4. View blame
,b

" 5. Stage hunks (requires vim-fugitive - optional)
```

---

## Troubleshooting

### Icons Not Showing

**Problem**: Icons appear as boxes or question marks

**Solution**:
1. Install a Nerd Font:
   ```bash
   brew install font-hack-nerd-font  # macOS
   sudo apt install fonts-hack-ttf   # Ubuntu
   ```
2. Configure your terminal to use the Nerd Font
3. Restart terminal and Vim

### Colors Look Wrong

**Problem**: Colors appear dull or incorrect

**Solution**:
1. Check terminal true color support:
   ```bash
   echo $COLORTERM  # Should output 'truecolor' or '24bit'
   ```
2. For tmux, add to `~/.tmux.conf`:
   ```bash
   set -g default-terminal "screen-256color"
   set -ga terminal-overrides ",xterm-256color:Tc"
   ```
3. Ensure `termguicolors` is set in `zplugins/base/config.vim`

### Plugins Not Working

**Problem**: Plugins don't load or function

**Solution**:
```vim
" 1. Check plugin status
:PlugStatus

" 2. Update plugins
:PlugUpdate

" 3. Reinstall if needed
:PlugClean
:PlugInstall

" 4. Check for errors
:messages
```

### ALE Errors

**Problem**: ALE shows "No linters available"

**Solution**:
1. Install linters for your language:
   ```bash
   # Python
   pip install pylint flake8

   # JavaScript
   npm install -g eslint

   # Check what ALE sees
   :ALEInfo
   ```

### NERDTree Not Opening

**Problem**: NERDTree doesn't appear when pressing `,n`

**Solution**:
1. Check if NERDTree is installed:
   ```vim
   :PlugStatus
   ```
2. Verify the mapping:
   ```vim
   :verbose map ,n
   ```
3. Try manual command:
   ```vim
   :NERDTreeToggle
   ```

### FZF Not Working

**Problem**: Ctrl+p doesn't open FZF

**Solution**:
1. Install FZF system-wide:
   ```bash
   # Ubuntu/Debian
   sudo apt install fzf

   # macOS
   brew install fzf
   ```
2. Check FZF config in `zplugins/fzf/config.vim`

### Slow Performance

**Problem**: Vim feels sluggish

**Solution**:
1. Disable plugins you don't need
2. Limit syntax highlighting:
   ```vim
   set synmaxcol=200  " Already set in config
   ```
3. Use faster search tool (ripgrep):
   ```bash
   brew install ripgrep  # macOS
   sudo apt install ripgrep  # Ubuntu
   ```
4. Profile to find slow plugins:
   ```vim
   :profile start profile.log
   :profile func *
   :profile file *
   " Use Vim normally, then quit
   :profile pause
   :noautocmd qall!
   " Check profile.log for slow functions
   ```

### Persistent Undo Not Working

**Problem**: Undo history lost between sessions

**Solution**:
1. Check if undo directory exists:
   ```bash
   ls -la ~/.vim/undodir
   ```
2. Create manually if needed:
   ```bash
   mkdir -p ~/.vim/undodir
   ```
3. Verify config in `zplugins/base/config.vim`

### System Clipboard Not Working

**Problem**: Can't copy/paste to/from system

**Solution**:
1. Check Vim clipboard support:
   ```vim
   :echo has('clipboard')  " Should return 1
   ```
2. If returns 0, install vim-gtk or vim-gnome:
   ```bash
   # Ubuntu/Debian
   sudo apt install vim-gtk3
   ```
3. On macOS, use MacVim or ensure Vim is built with clipboard

### Configuration File Not Found (E484 Error)

**Problem**: Error message like `E484: Can't open file /Users/marco/.vim/zplugins/copilot/config.vim`

**Solution**:
This error means the plugin configuration symlinks are not set up correctly. This can happen if you:
- Pulled new updates that added new plugins (like Copilot)
- Didn't run the setup script initially
- Manually installed without creating symlinks

**Fix it by running:**
```bash
# Option 1: Re-run the setup script (recommended)
cd ~/.vim/zvimrc
./setup.sh $HOME

# Option 2: Manually create symlinks for all plugins
mkdir -p ~/.vim/zplugins
ln -sf ~/.vim/zvimrc/zplugins/* ~/.vim/zplugins/

# Option 3: Create symlink for just the missing plugin (e.g., copilot)
ln -sf ~/.vim/zvimrc/zplugins/copilot ~/.vim/zplugins/copilot
```

After creating the symlinks, restart Vim and the error should be resolved.

### GitHub Copilot Not Working

**Problem**: Copilot doesn't show suggestions

**Solution**:
1. Check Copilot status:
   ```vim
   :Copilot status
   ```
2. Verify Node.js version (requires 16+):
   ```bash
   node --version
   ```
3. Authenticate if not already done:
   ```vim
   :Copilot setup
   ```
4. Ensure you have an active Copilot subscription
5. Try restarting Copilot:
   ```vim
   :Copilot disable
   :Copilot enable
   ```
6. Check for error messages:
   ```vim
   :messages
   ```

**Problem**: Copilot suggestions are slow

**Solution**:
1. Check your internet connection (Copilot requires network access)
2. Disable other completion plugins that might conflict
3. Check Node.js performance on your system

**Problem**: Tab key not accepting suggestions

**Solution**:
1. Check for key mapping conflicts:
   ```vim
   :verbose imap <Tab>
   ```
2. Use alternative shortcut `Ctrl+J` to accept
3. Verify copilot config is loaded:
   ```vim
   :scriptnames | grep copilot
   ```

### Setup Script Fails

**Problem**: `./setup.sh` encounters errors

**Solution**:
1. Make sure script is executable:
   ```bash
   chmod +x setup.sh
   ```
2. Run with proper argument:
   ```bash
   ./setup.sh $HOME
   ```
3. Check for error messages and install missing dependencies manually
4. Try manual installation method instead

---

## Getting Help

### In-Vim Help

```vim
:help <topic>           " General help
:help <plugin-name>     " Plugin-specific help
:help key-notation      " Keyboard shortcuts
:help <command>         " Command help

" Examples:
:help NERDTree
:help fzf-vim
:help surround
```

### Useful Commands to Check Configuration

```vim
:version                " Check Vim version and features
:PlugStatus             " Check plugin status
:ALEInfo                " Check linter configuration
:messages               " View error messages
:map                    " View all mappings
:verbose set <option>?  " Check where option was set
```

---

## Contributing

Contributions are welcome! Feel free to:
- Report bugs
- Suggest new features
- Submit pull requests
- Share your customizations

---

## License

This configuration is open source and available under the MIT License. See LICENSE file for details.

---

## Credits

- Built with [vim-plug](https://github.com/junegunn/vim-plug)
- Inspired by the Vim community
- Special thanks to all plugin authors

---

## Quick Reference Card

**Most Used Shortcuts**:
- `,n` - File explorer
- `Ctrl+p` - Find file
- `F8` - Code structure
- `gcc` - Comment line
- `Space` - Toggle fold
- `,b` - Git blame
- `Ctrl+j/k/h/l` - Navigate splits

**Remember**: Practice makes perfect. Focus on learning a few shortcuts at a time!

---

**Enjoy your new Vim IDE! Happy coding! 🚀**
