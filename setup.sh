#!/bin/bash
# ══════════════════════════════════════════════════════════════════════════════
# zvimrc setup script — installs all dependencies for a VS Code-like Vim IDE
# Usage: ./setup.sh $HOME
# Supports: macOS (Homebrew) and Ubuntu/Debian
# ══════════════════════════════════════════════════════════════════════════════

set -e

DST_FOLDER="${1:-$HOME}"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# ── Detect OS ─────────────────────────────────────────────────────────────────
if [ "$(uname)" = "Darwin" ]; then
  MACHINE=MAC
elif [ "$(uname -s | cut -c1-5)" = "Linux" ]; then
  MACHINE=LINUX
else
  echo "Unsupported OS: $(uname)"
  exit 1
fi

echo ""
echo "════════════════════════════════════════"
echo "  zvimrc — VS Code-like Vim IDE Setup"
echo "  Target: ${DST_FOLDER}   OS: ${MACHINE}"
echo "════════════════════════════════════════"
echo ""

# ── Helper functions ──────────────────────────────────────────────────────────
has() { command -v "$1" &>/dev/null; }

install_pkg_mac()   { brew install "$@" 2>/dev/null || true; }
install_pkg_linux() { sudo apt-get install -y "$@" 2>/dev/null || true; }

install_pkg() {
  if [ "$MACHINE" = "MAC" ]; then
    install_pkg_mac "$@"
  else
    install_pkg_linux "$@"
  fi
}

section() { echo ""; echo "── $1 ──"; }

# ── macOS: ensure Homebrew ────────────────────────────────────────────────────
if [ "$MACHINE" = "MAC" ] && ! has brew; then
  section "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# ── curl ──────────────────────────────────────────────────────────────────────
if ! has curl; then
  section "Installing curl"
  install_pkg curl
fi

# ── vim-plug (auto-loader) ────────────────────────────────────────────────────
if [ ! -f "${DST_FOLDER}/.vim/autoload/plug.vim" ]; then
  section "Installing vim-plug"
  curl -fLo "${DST_FOLDER}/.vim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# ── Node.js 18+ (required for CoC / GitHub Copilot) ──────────────────────────
NODE_OK=false
if has node; then
  NODE_VER=$(node -e "process.stdout.write(process.version.replace('v','').split('.')[0])")
  [ "$NODE_VER" -ge 16 ] && NODE_OK=true
fi

if [ "$NODE_OK" = "false" ]; then
  section "Installing Node.js 20 (LTS)"
  if [ "$MACHINE" = "MAC" ]; then
    install_pkg_mac node
  else
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
    sudo apt-get install -y nodejs
  fi
fi

# ── ripgrep (fast grep — used by FZF and CtrlSF) ─────────────────────────────
if ! has rg; then
  section "Installing ripgrep"
  if [ "$MACHINE" = "MAC" ]; then
    install_pkg_mac ripgrep
  else
    install_pkg ripgrep || {
      # Fallback: download binary
      RG_VER="14.1.0"
      curl -LO "https://github.com/BurntSushi/ripgrep/releases/download/${RG_VER}/ripgrep_${RG_VER}-1_amd64.deb"
      sudo dpkg -i ripgrep_*.deb && rm ripgrep_*.deb
    }
  fi
fi

# ── bat (syntax-highlighted file preview in FZF) ──────────────────────────────
if ! has bat && ! has batcat; then
  section "Installing bat"
  if [ "$MACHINE" = "MAC" ]; then
    install_pkg_mac bat
  else
    install_pkg bat || install_pkg batcat
  fi
fi

# ── fzf binary ────────────────────────────────────────────────────────────────
if ! has fzf; then
  section "Installing fzf"
  if [ "$MACHINE" = "MAC" ]; then
    install_pkg_mac fzf
  else
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all
  fi
fi

# ── Universal Ctags (for Tagbar / TList) ──────────────────────────────────────
if ! has ctags; then
  section "Installing Universal Ctags"
  if [ "$MACHINE" = "MAC" ]; then
    install_pkg_mac universal-ctags
  else
    install_pkg universal-ctags || install_pkg exuberant-ctags
  fi
fi

# ── xclip / xsel (clipboard on Linux) ────────────────────────────────────────
if [ "$MACHINE" = "LINUX" ]; then
  if ! has xclip && ! has xsel; then
    section "Installing clipboard support"
    install_pkg xclip
  fi
  # Update apt before bulk install
  sudo apt-get update -qq
fi

# ── Nerd Font ─────────────────────────────────────────────────────────────────
section "Checking Nerd Font"
if [ "$MACHINE" = "MAC" ]; then
  if ! brew list --cask font-fira-code-nerd-font &>/dev/null; then
    echo "Installing FiraCode Nerd Font (icons in NERDTree & airline)..."
    brew tap homebrew/cask-fonts 2>/dev/null || true
    brew install --cask font-fira-code-nerd-font 2>/dev/null || \
      echo "  ⚠  Font install skipped. Install manually: brew install --cask font-fira-code-nerd-font"
  else
    echo "  ✔  FiraCode Nerd Font already installed"
  fi
else
  FONT_DIR="${HOME}/.local/share/fonts"
  if ! ls "${FONT_DIR}/"*NerdFont* &>/dev/null 2>&1; then
    echo "Installing FiraCode Nerd Font..."
    mkdir -p "${FONT_DIR}"
    FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip"
    curl -fLo /tmp/FiraCode.zip "$FONT_URL"
    unzip -o /tmp/FiraCode.zip -d "${FONT_DIR}" '*.ttf' '*.otf' 2>/dev/null || true
    rm -f /tmp/FiraCode.zip
    fc-cache -fv "${FONT_DIR}" &>/dev/null
    echo "  ✔  FiraCode Nerd Font installed"
  else
    echo "  ✔  Nerd Font already present"
  fi
fi

# ── zplugins symlinks ─────────────────────────────────────────────────────────
section "Setting up plugin configurations"
mkdir -p "${DST_FOLDER}/.vim/zplugins"

if [ -d "${SCRIPT_DIR}/zplugins" ]; then
  for plugin_dir in "${SCRIPT_DIR}/zplugins/"/*/; do
    [ -d "$plugin_dir" ] || continue
    plugin_name=$(basename "$plugin_dir")
    rm -rf "${DST_FOLDER}/.vim/zplugins/${plugin_name}"
    ln -sf "${plugin_dir}" "${DST_FOLDER}/.vim/zplugins/${plugin_name}"
    echo "  ✔  Linked ${plugin_name}"
  done
else
  echo "  ⚠  zplugins directory not found"
fi

# ── CoC settings template ─────────────────────────────────────────────────────
COC_SETTINGS="${DST_FOLDER}/.vim/coc-settings.json"
if [ ! -f "$COC_SETTINGS" ]; then
  section "Creating CoC settings template"
  cat > "$COC_SETTINGS" << 'EOF'
{
  "suggest.noselect": true,
  "suggest.enablePreview": true,
  "suggest.floatEnable": true,
  "diagnostic.enableSign": true,
  "diagnostic.virtualText": true,
  "diagnostic.virtualTextCurrentLineOnly": true,
  "prettier.enable": true,
  "python.linting.enabled": true,
  "python.linting.pylintEnabled": true,
  "codeLens.enable": true,
  "inlayHint.enable": true
}
EOF
  echo "  ✔  Created ${COC_SETTINGS}"
fi

# ── Summary ───────────────────────────────────────────────────────────────────
echo ""
echo "════════════════════════════════════════"
echo "  Setup complete!"
echo ""
echo "  Next steps:"
echo "  1. Set your terminal font to 'FiraCode Nerd Font'"
echo "  2. Run:  vim +PlugInstall +qall"
echo "  3. In Vim run:  :Copilot setup   (for GitHub Copilot)"
echo "  4. In Vim run:  :CocInstall coc-pyright   (or other lang servers)"
echo "════════════════════════════════════════"
echo ""

touch .setup
exit 0
