# Vim IDE Configuration

A comprehensive, beautiful, and productive Vim configuration that transforms Vim into a full-featured IDE.

## Features

### 🎨 Beautiful Appearance
- **Modern Color Schemes**: Gruvbox (default), Dracula, OneDark, Nord, Solarized
- **Powerline Fonts**: Beautiful status line with icons and symbols
- **File Icons**: Visual file type indicators in NERDTree and status bar
- **Fancy Start Screen**: Welcome screen with recent files and bookmarks
- **Syntax Highlighting**: Enhanced syntax highlighting for multiple languages
- **Indent Guides**: Visual indentation lines for better code structure
- **Rainbow Parentheses**: Color-coded nested parentheses

### 🚀 IDE Features

#### File Management
- **NERDTree**: Powerful file explorer (`,n` to toggle)
- **FZF**: Fuzzy file finder for quick navigation
- **Startify**: Beautiful start screen with recent files

#### Code Intelligence
- **ALE**: Asynchronous linting and error checking
- **Tagbar**: Overview of code structure (F8 to toggle)
- **Omnisharp**: C# code completion and analysis
- **Auto-pairs**: Automatic bracket and quote completion

#### Git Integration
- **GitGutter**: Show git diff in the sign column
- **Git Blame**: View git blame information (`,b`)
- **Vim-Airline Git**: Git branch in status bar

#### Search & Navigation
- **FZF**: Fuzzy file search
- **CtrlSF**: Project-wide search
- **Ack**: Fast pattern searching
- **Incsearch**: Incremental search improvements

#### Code Formatting
- **Vim-CodeFmt**: Auto-formatting for multiple languages
- **Emmet**: HTML/CSS abbreviation expansion
- **Auto-close**: Automatic HTML tag closing

#### Productivity
- **Multiple Cursors**: Edit multiple locations simultaneously
- **Commentary**: Easy code commenting
- **Surround**: Manipulate surrounding characters
- **Smooth Scrolling**: Smooth scrolling animation

## Installation

1. **Install Vim-Plug** (if not already installed):
   ```bash
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

2. **Run the setup script**:
   ```bash
   ./setup.sh
   ```

3. **Install plugins**:
   Open Vim and run:
   ```vim
   :PlugInstall
   ```

4. **(Optional) Install Powerline fonts** for best visual experience:
   ```bash
   # On Ubuntu/Debian
   sudo apt-get install fonts-powerline

   # On macOS
   brew tap homebrew/cask-fonts
   brew install --cask font-hack-nerd-font

   # Manual installation
   git clone https://github.com/powerline/fonts.git --depth=1
   cd fonts
   ./install.sh
   cd ..
   rm -rf fonts
   ```

5. **Set terminal font**: Configure your terminal to use a Powerline/Nerd font

## Key Mappings

### Leader Key
The leader key is `,` (comma)

### File Navigation
| Key | Action |
|-----|--------|
| `,n` | Toggle NERDTree file explorer |
| `,nf` | Find current file in NERDTree |
| `Ctrl+p` | FZF file search |
| `F8` | Toggle Tagbar |

### Tab Management
| Key | Action |
|-----|--------|
| `,tn` | New tab |
| `,tc` | Close tab |
| `,tf` | Next tab |
| `,tb` | Previous tab |
| `,t1-9` | Go to tab 1-9 |
| `Ctrl+Shift+Right` | Next tab |
| `Ctrl+Shift+Left` | Previous tab |

### Window Navigation
| Key | Action |
|-----|--------|
| `Ctrl+j` | Move to window below |
| `Ctrl+k` | Move to window above |
| `Ctrl+h` | Move to window left |
| `Ctrl+l` | Move to window right |

### Code Editing
| Key | Action |
|-----|--------|
| `,o` | Insert line below (stay in normal mode) |
| `,O` | Insert line above (stay in normal mode) |
| `Space` | Toggle code fold |
| `,d` | Delete to black hole register (visual mode) |
| `,p` | Paste keeping current register (visual mode) |
| `,il` | Toggle indent lines |
| `gc` | Toggle comment (visual mode) |

### Git
| Key | Action |
|-----|--------|
| `,b` | Git blame |

### Search
| Key | Action |
|-----|--------|
| `/` | Search forward |
| `?` | Search backward |
| `n` | Next search result |
| `N` | Previous search result |

### Other
| Key | Action |
|-----|--------|
| `F2` | Copy selection to clipboard |

## Customization

### Change Color Scheme

Edit `zplugins/base/config.vim` and change:
```vim
colorscheme gruvbox
```
to one of:
- `dracula`
- `onedark`
- `nord`
- `solarized`
- `atom-dark`

### Change Airline Theme

Edit `zplugins/vim-airline/config.vim` and uncomment your preferred theme:
```vim
let g:airline_theme='gruvbox'
" let g:airline_theme='dracula'
" let g:airline_theme='onedark'
" let g:airline_theme='nord'
```

### Enable CoC (Conquer of Completion)

If you have Node.js installed, uncomment this line in `vimrc.vim`:
```vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
```
Then run `:PlugInstall` in Vim.

### Enable Relative Line Numbers

Edit `zplugins/base/config.vim` and uncomment:
```vim
set relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
```

## Plugin List

### Visual Enhancements
- **vim-airline**: Statusline/tabline
- **vim-airline-themes**: Themes for airline
- **gruvbox**: Modern color scheme
- **dracula**: Dark theme
- **onedark**: Atom-inspired theme
- **nord**: Arctic-inspired theme
- **vim-devicons**: File type icons
- **indentLine**: Indentation guides
- **vim-rainbow**: Rainbow parentheses
- **vim-startify**: Start screen

### Code Intelligence
- **ale**: Asynchronous linting
- **tagbar**: Code structure overview
- **taglist**: Function/class browser
- **omnisharp-vim**: C# support
- **vim-polyglot**: Language pack

### File Navigation
- **nerdtree**: File explorer
- **fzf**: Fuzzy finder
- **fzf.vim**: FZF integration
- **ctrlsf**: Project search
- **ack.vim**: Pattern search

### Git Integration
- **vim-gitgutter**: Git diff in sign column
- **git-blame.vim**: Git blame viewer

### Code Editing
- **vim-multiple-cursors**: Multiple cursors
- **incsearch.vim**: Better search
- **vim-codefmt**: Auto-formatting
- **vim-searchindex**: Search count
- **auto-pairs**: Auto-close brackets
- **vim-commentary**: Easy commenting
- **vim-surround**: Surround manipulation

### HTML/Web Development
- **emmet-vim**: HTML abbreviations
- **HTML-AutoCloseTag**: Auto-close HTML tags
- **vim-jquery**: jQuery syntax
- **vim-css-color**: CSS color preview

### Other
- **vim-smoothie**: Smooth scrolling
- **riv.vim**: ReStructuredText support
- **vim-grammarous**: Grammar checking

## Tips

### Performance
- The configuration automatically improves performance for large files
- Syntax highlighting is limited to 200 columns by default
- Persistent undo is enabled (stored in `~/.vim/undodir`)

### Clipboard
- System clipboard integration is enabled
- Yank and paste work with system clipboard

### Spell Checking
- Automatically enabled for `.md`, `.markdown`, `.rst`, and `.yaml` files

### Trailing Whitespace
- Automatically removed on save

## Troubleshooting

### Icons not showing
Install a Nerd Font and configure your terminal to use it.

### Plugins not working
Run `:PlugInstall` in Vim to install all plugins.

### Colors look wrong
Enable true color support in your terminal and ensure `termguicolors` is set.

### ALE errors
Install the required linters for your languages (e.g., `pylint` for Python, `eslint` for JavaScript).

## Contributing

Feel free to fork and customize this configuration to your needs!

## License

See LICENSE file for details.
