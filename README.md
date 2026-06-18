# zvimrc — VS Code-like Vim IDE

A fully-featured Vim configuration that makes your terminal feel like VS Code, with
IntelliSense (CoC), an integrated terminal, git panel, fuzzy file search, file explorer
with git status icons, multiple cursors, and much more.

![Vim Version](https://img.shields.io/badge/vim-8.2+-green.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)
![macOS](https://img.shields.io/badge/macOS-supported-blue.svg)
![Ubuntu](https://img.shields.io/badge/Ubuntu-supported-orange.svg)

---

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Post-Installation](#post-installation)
- [Keyboard Shortcuts](#keyboard-shortcuts)
- [Themes](#themes)
- [Plugin Reference](#plugin-reference)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)

---

## Features

| VS Code Feature | Vim Equivalent | Plugin |
|---|---|---|
| IntelliSense / auto-complete | CoC (Conquer of Completion) | `neoclide/coc.nvim` |
| Go to Definition (F12) | `F12` / `gd` | CoC |
| Rename Symbol (F2) | `F2` / `<leader>rn` | CoC |
| Hover documentation | `K` | CoC |
| Code actions (Ctrl+.) | `<leader>ca` | CoC |
| Source Control panel | Fugitive `:Git status` | `tpope/vim-fugitive` |
| Integrated terminal (Ctrl+\`) | `F4` / `<leader>tt` | `voldikss/vim-floaterm` |
| File Explorer (Ctrl+B) | `Ctrl+B` / `<leader>n` | NERDTree + git plugin |
| Quick Open (Ctrl+P) | `Ctrl+P` | FZF |
| Find in Files (Ctrl+Shift+F) | `<leader>rg` | FZF + ripgrep |
| Multiple cursors (Ctrl+D) | `Ctrl+D` | `mg979/vim-visual-multi` |
| Timeline / Undo history | `F5` / `<leader>u` | `mbbill/undotree` |
| AI completions (Copilot) | Tab | `github/copilot.vim` |
| Which key hints | Hold `<leader>` | `liuchengxu/vim-which-key` |

---

## Prerequisites

### Required on all systems
| Tool | macOS | Ubuntu |
|---|---|---|
| Vim 8.2+ or Neovim | `brew install vim` | `sudo apt install vim` |
| Git | `brew install git` | `sudo apt install git` |
| curl | pre-installed | `sudo apt install curl` |

### Installed automatically by `setup.sh`
- **Node.js 20** — required for CoC (IntelliSense) and GitHub Copilot
- **ripgrep** — fast project-wide search used by FZF
- **bat** — syntax-highlighted file preview in FZF
- **fzf** — fuzzy finder
- **Universal Ctags** — code tags for Tagbar
- **FiraCode Nerd Font** — icons in the file explorer and status bar
- **xclip** (Linux only) — system clipboard support

### Terminal font
After installation set your terminal emulator's font to **FiraCode Nerd Font** or
any other [Nerd Font](https://www.nerdfonts.com/). Without it, icons will appear as
boxes (□).

---

## Installation

### macOS

```bash
# 1. Clone
git clone https://github.com/neyrojasj/zvimrc.git ~/.vim/zvimrc
cd ~/.vim/zvimrc

# 2. Run setup (installs Node.js, ripgrep, bat, fzf, fonts, creates symlinks)
./setup.sh $HOME

# 3. Link vimrc
ln -sf ~/.vim/zvimrc/vimrc.vim ~/.vimrc

# 4. Open Vim and install plugins (takes ~2 min on first run)
vim +PlugInstall +qall

# 5. Authenticate GitHub Copilot (optional)
vim -c ":Copilot setup"
```

### Ubuntu / Debian

```bash
# 1. Clone
git clone https://github.com/neyrojasj/zvimrc.git ~/.vim/zvimrc
cd ~/.vim/zvimrc

# 2. Run setup
bash setup.sh $HOME

# 3. Link vimrc
ln -sf ~/.vim/zvimrc/vimrc.vim ~/.vimrc

# 4. Open Vim and install plugins
vim +PlugInstall +qall

# 5. Authenticate GitHub Copilot (optional)
vim -c ":Copilot setup"
```

### Makefile shortcuts

```bash
make install    # Run setup + install all plugins
make backup     # Backup your current ~/.vimrc
make restore    # Restore from backup
make uninstall  # Remove configuration
make clean      # Remove temporary files
```

---

## Post-Installation

### 1. Install CoC language servers

After running `:PlugInstall`, open Vim and install the language servers you need:

```vim
" JavaScript / TypeScript
:CocInstall coc-tsserver coc-eslint coc-prettier

" Python
:CocInstall coc-pyright

" Go
:CocInstall coc-go

" Rust
:CocInstall coc-rust-analyzer

" C/C++
:CocInstall coc-clangd

" JSON / YAML / HTML / CSS (auto-installed by default)
:CocInstall coc-json coc-yaml coc-html coc-css

" Check CoC status
:CocInfo
```

### 2. Configure GitHub Copilot

```vim
:Copilot setup    " authenticate with your GitHub account
:Copilot status   " verify it's running
```

### 3. Verify setup

```vim
:checkhealth          " Neovim
:CocInfo              " check CoC / LSP status
:echo has('python3')  " should return 1
```

---

## Keyboard Shortcuts

> **Leader key = `,`** (comma).  Hold `<leader>` and wait 500 ms to see all available
> bindings in the which-key popup.

### File Navigation

| Shortcut | Action |
|---|---|
| `Ctrl+P` | Quick Open — fuzzy search files in project |
| `<leader>/` | Quick Open (alternative) |
| `<leader>rg` | Search text in project (ripgrep) |
| `<leader>.` | Open buffer list |
| `<leader><leader>` | Recent file history |
| `<leader>L` | Search lines in current buffer |
| `Ctrl+B` or `<leader>n` | Toggle file explorer (NERDTree) |
| `<leader>nf` | Reveal current file in explorer |

> Inside FZF: `Ctrl+T` open in new tab · `Ctrl+S` horizontal split · `Ctrl+V` vertical split

### Code Intelligence (CoC — IntelliSense)

| Shortcut | Action |
|---|---|
| `Tab` | Navigate completion menu / accept top suggestion |
| `Shift+Tab` | Navigate completion menu backwards |
| `Enter` | Confirm selected completion |
| `Ctrl+Space` | Trigger completion manually |
| `K` | Show hover documentation |
| `F12` or `gd` | Go to Definition |
| `Shift+F12` or `gr` | Find All References |
| `gy` | Go to Type Definition |
| `gi` | Go to Implementation |
| `F2` or `<leader>rn` | Rename Symbol |
| `<leader>ca` | Code Actions (quick-fix menu) |
| `<leader>qf` | Quick fix current error |
| `<leader>fmt` | Format document / selection |
| `[d` / `]d` | Previous / Next diagnostic |
| `F8` | Jump to next diagnostic |
| `<leader>co` | Outline panel (symbols in file) |
| `<leader>cs` | Search workspace symbols |
| `<leader>cd` | Show diagnostics list |
| `<leader>cc` | CoC commands list |

### Git

| Shortcut | Action |
|---|---|
| `<leader>gs` | Git status (Fugitive) |
| `<leader>gd` | Git diff current file |
| `<leader>gD` | Git diff staged |
| `<leader>gb` | Git blame (line-by-line) |
| `<leader>gl` | Git log (graph) |
| `<leader>gc` | Git commit |
| `<leader>gw` | Stage current file |
| `<leader>gr` | Checkout (discard changes) |
| `<leader>gp` | Git push |
| `<leader>gP` | Git pull |
| `<leader>gm` | Merge conflict diff view |
| `]h` / `[h` | Next / previous git hunk (GitGutter) |

### Terminal

| Shortcut | Action |
|---|---|
| `F4` or `<leader>tt` | Toggle integrated terminal |
| `<leader>tn` | New terminal |
| `<leader>tp` / `<leader>tx` | Previous / next terminal |
| `<leader>tk` | Kill terminal |
| `Esc` (in terminal) | Return to normal mode |

### Multiple Cursors (VS Code-like)

| Shortcut | Action |
|---|---|
| `Ctrl+D` | Select next occurrence of word under cursor |
| `<leader>sa` | Select ALL occurrences |
| `Ctrl+x` | Skip current occurrence |
| `Ctrl+↑` / `Ctrl+↓` | Add cursor above / below |

### Editing

| Shortcut | Action |
|---|---|
| `Ctrl+/` (or `gcc`) | Toggle comment |
| `Alt+↑` / `Alt+↓` | Move line / selection up or down |
| `Space` | Toggle code fold |
| `<leader>u` or `F5` | Undo tree (visual undo history) |
| `<leader>o` / `<leader>O` | Insert blank line below / above |
| `<leader>d` (visual) | Delete without polluting clipboard |
| `<leader>p` (visual) | Paste without overwriting clipboard |
| `cs"'` | Change surrounding `"` to `'` (vim-surround) |
| `ds"` | Delete surrounding `"` |
| `ysiw"` | Add `"` around word |

### Window & Tab Management

| Shortcut | Action |
|---|---|
| `Ctrl+H/J/K/L` | Move between splits |
| `<leader>tn` | New tab |
| `<leader>tc` | Close tab |
| `<leader>tf` / `<leader>tb` | Next / previous tab |
| `<leader>t1`…`<leader>t9` | Jump to tab 1–9 |

### Search

| Shortcut | Action |
|---|---|
| `/` | Search forward (incremental) |
| `?` | Search backward |
| `n` / `N` | Next / previous match |
| `*` | Search word under cursor |
| `<leader>il` | Toggle indent lines |

### GitHub Copilot

| Shortcut | Action |
|---|---|
| `Tab` | Accept Copilot suggestion |
| `Ctrl+J` | Accept suggestion (alternative) |
| `Alt+]` / `Alt+[` | Next / previous suggestion |
| `Ctrl+]` | Dismiss suggestion |
| `<leader>cp` | Open Copilot panel |
| `<leader>ce` / `<leader>cd` | Enable / disable Copilot |

---

## Themes

The default theme is **VS Code Dark+** (`codedark`). To switch, edit
`zplugins/base/config.vim` and change the `colorscheme` line:

```vim
colorscheme codedark       " VS Code Dark+ (default)
colorscheme onedark        " Atom One Dark
colorscheme gruvbox        " Gruvbox
colorscheme dracula        " Dracula
colorscheme nord           " Nord
colorscheme catppuccin_mocha  " Catppuccin Mocha
```

You can also switch at runtime:
```vim
:colorscheme dracula
```

---

## Plugin Reference

### Core IDE
| Plugin | Purpose |
|---|---|
| `neoclide/coc.nvim` | LSP client — IntelliSense, completions, diagnostics |
| `github/copilot.vim` | GitHub Copilot AI completions |
| `w0rp/ale` | Async linting engine |
| `tpope/vim-fugitive` | Full Git integration |
| `airblade/vim-gitgutter` | Git diff signs in the gutter |
| `voldikss/vim-floaterm` | Integrated floating/split terminal |
| `mbbill/undotree` | Visual undo history |

### Navigation
| Plugin | Purpose |
|---|---|
| `scrooloose/nerdtree` | File explorer |
| `Xuyuanp/nerdtree-git-plugin` | Git status icons in NERDTree |
| `junegunn/fzf` + `fzf.vim` | Fuzzy file/text finder |
| `dyng/ctrlsf.vim` | Project-wide search with preview |
| `majutsushi/tagbar` | Code symbol navigator |

### Editing
| Plugin | Purpose |
|---|---|
| `mg979/vim-visual-multi` | Multiple cursors (replaces deprecated plugin) |
| `tpope/vim-commentary` | Toggle comments (`gcc`) |
| `tpope/vim-surround` | Change/delete surrounding characters |
| `jiangmiao/auto-pairs` | Auto-close brackets and quotes |
| `liuchengxu/vim-which-key` | Keybinding popup on leader press |

### Visual
| Plugin | Purpose |
|---|---|
| `tomasiser/vim-code-dark` | VS Code Dark+ theme |
| `joshdick/onedark.vim` | Atom One Dark theme |
| `morhetz/gruvbox` | Gruvbox theme |
| `vim-airline/vim-airline` | Powerline status bar |
| `ryanoasis/vim-devicons` | File type icons |
| `RRethy/vim-illuminate` | Highlight word under cursor |
| `Yggdroot/indentLine` | Visual indent guides |
| `frazrepo/vim-rainbow` | Rainbow-colored parentheses |
| `psliwka/vim-smoothie` | Smooth scrolling |
| `mhinz/vim-startify` | Fancy start screen |

---

## Customization

### Change the leader key
Edit `zplugins/base/config.vim`:
```vim
let mapleader = " "  " space bar as leader (popular choice)
```

### Add a CoC language server
```vim
:CocInstall coc-<language>
```
See all available servers: https://github.com/neoclide/coc.nvim/wiki/Language-servers

### Configure ALE linters per language
Edit `zplugins/ale/config.vim`:
```vim
let g:ale_linters = {
  \ 'python': ['flake8'],
  \ 'go':     ['golint'],
  \ }
```

### Install language-specific linters

```bash
# Python
pip install flake8 pylint black isort

# JavaScript / TypeScript
npm install -g eslint prettier typescript

# Go
go install golang.org/x/lint/golint@latest

# Shell
sudo apt install shellcheck   # Ubuntu
brew install shellcheck       # macOS
```

### Disable a plugin
Comment out its `Plug` line in `vimrc.vim` and its `source` line, then run:
```vim
:PlugClean
```

---

## Troubleshooting

### Icons appear as boxes (□□□)
Your terminal font is not a Nerd Font. Set it to **FiraCode Nerd Font** in your
terminal settings. Setup installs the font automatically; just change the font
in your terminal emulator preferences.

### CoC not working / "Node.js not found"
```bash
node --version   # must be 16+
# If missing, setup.sh installs it. Re-run:
./setup.sh $HOME
```

### GitHub Copilot not working
```vim
:Copilot status   " check status
:Copilot setup    " re-authenticate
```

### FZF preview not showing
Install `bat` for syntax-highlighted previews:
```bash
brew install bat          # macOS
sudo apt install bat      # Ubuntu (command may be 'batcat')
```

### Slow startup
Disable plugins you don't use by commenting out their `Plug` line in `vimrc.vim`.
Profile with:
```vim
:StartupTime    " requires vim-startuptime plugin (optional)
" or
vim --startuptime /tmp/vim-startup.log
```

### ALE and CoC conflict (duplicate diagnostics)
This config already disables ALE completion to avoid conflicts. If you still see
duplicates, add this to `zplugins/ale/config.vim`:
```vim
let g:ale_disable_lsp = 1
```

---

## License

MIT — see [LICENSE](LICENSE)
