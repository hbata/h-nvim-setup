# Neovim Configuration

A comprehensive Neovim setup optimized for machine learning development with Python, C/C++, and Lua support. Features a sleek slimfat-inspired color scheme with cyan accents on a dark background.

## ✨ Features

- 🎨 **Slimfat-inspired Color Scheme** - Dark theme with cyan accents (#26C6DA on #2f2f2f)
- 📝 **Line Numbers** - Both absolute and relative line numbers enabled
- 🔍 **Fuzzy Finder** - Telescope for fast file and content searching
- 📁 **File Explorer** - nvim-tree for intuitive file navigation
- 🔧 **LSP Support** - Full Language Server Protocol for Python, Lua, C, and C++
- ✨ **Auto-completion** - Intelligent code completion with nvim-cmp
- 🌳 **Syntax Highlighting** - Advanced TreeSitter-based highlighting
- 💬 **Smart Commenting** - Easy comment toggling with Comment.nvim
- 🔀 **Git Integration** - Built-in git status indicators with Gitsigns
- 🎯 **Auto Pairs** - Automatic bracket and quote pairing
- 📊 **Status Line** - Beautiful lualine status bar

## 📋 Requirements

### System Requirements

- **Neovim** >= 0.9.0
- **Git** >= 2.19.0
- **Node.js** >= 14.0.0 (for LSP servers)
- **Python** >= 3.10
- **C++ Compiler** (gcc/clang for TreeSitter)

### Required Tools

- **ripgrep** - Fast searching (used by Telescope)
- **fd** - Fast file finding (used by Telescope)
- **make** - For building native plugins
- **unzip** - For extracting downloaded plugins

### Optional but Recommended

- **Homebrew** - Package manager for easy installation
- **pipx** - For installing Python tools in isolated environments
- **A Nerd Font** - For proper icon display (e.g., JetBrainsMono Nerd Font, FiraCode Nerd Font)

## 🚀 Installation

### Step 1: Install System Dependencies

#### On Ubuntu/Debian (WSL2 or Native)

```bash
# Update package list
sudo apt update

# Install build essentials
sudo apt install build-essential cmake git curl unzip

# Install Python development tools
sudo apt install python3-dev python3-pip

# Install Neovim via Homebrew (recommended for latest version)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install neovim

# Or install via apt (may be older version)
# sudo apt install neovim

# Install ripgrep and fd
brew install ripgrep fd

# Install Node.js
brew install node
```

#### On macOS

```bash
# Install Homebrew if not already installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install dependencies
brew install neovim node ripgrep fd cmake
```

### Step 2: Install Python LSP Tools

```bash
# Install pipx
sudo apt install pipx  # Ubuntu/Debian
# or
brew install pipx      # macOS

# Ensure pipx is in PATH
pipx ensurepath
source ~/.bashrc       # or source ~/.zshrc

# Install Python language server and tools
pipx install python-lsp-server
pipx install black
pipx install isort
pipx install pylint

# Verify installations
which pylsp
black --version
```

### Step 3: Clone This Configuration

```bash
# Backup existing config if you have one
[ -d ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.backup

# Clone this repository
git clone git@github.com:hbata/h-nvim-setup.git ~/.config/nvim

# Or using HTTPS
git clone https://github.com/hbata/h-nvim-setup.git ~/.config/nvim
```

### Step 4: Launch Neovim

```bash
# First launch - plugins will auto-install
nvim
```

**Note:** On first launch, lazy.nvim will automatically install all plugins. This may take a few minutes. Wait for all installations to complete.

### Step 5: Install LSP Servers

Once Neovim is open, install language servers via Mason:

```vim
:Mason
```

Inside Mason, the following will be automatically installed:
- `lua_ls` - Lua Language Server
- `pyright` - Python Language Server
- `clangd` - C/C++ Language Server

You can also manually install additional tools:
- `black` - Python formatter
- `isort` - Python import sorter
- `stylua` - Lua formatter

### Step 6: Verify Installation

```vim
# Check overall health
:checkhealth

# Check Mason status
:Mason

# Check LSP status (open a Python/C++/Lua file first)
:LspInfo
```

## 📁 Configuration Structure

```
~/.config/nvim/
├── init.lua                    # Main entry point
├── lua/
│   ├── config/
│   │   ├── options.lua         # Neovim settings (line numbers, tabs, etc.)
│   │   ├── keymaps.lua         # Custom key bindings
│   │   └── lazy.lua            # Plugin manager setup
│   └── plugins/
│       ├── telescope.lua       # Fuzzy finder configuration
│       ├── nvim-tree.lua       # File explorer configuration
│       ├── lsp.lua             # LSP settings
│       ├── mason.lua           # LSP/tool installer
│       ├── completion.lua      # Auto-completion setup
│       ├── colorscheme.lua     # Slimfat-inspired theme
│       └── extras.lua          # Additional plugins (lualine, treesitter, etc.)
└── README.md                   # This file
```

## ⌨️ Key Bindings

### Leader Key

**Leader Key:** `<Space>` (Spacebar)

Most custom commands start with the leader key.

---

### 🔍 Finding Files & Content (Telescope)

| Key Binding | Description |
|------------|-------------|
| `<Space>ff` | Find files in current directory |
| `<Space>fr` | Find recent files |
| `<Space>fs` | Find string in project (live grep) |
| `<Space>fc` | Find string under cursor |
| `<Space>fb` | Find open buffers |

**Inside Telescope:**
- `Ctrl + j/k` - Navigate up/down
- `Ctrl + q` - Send to quickfix list
- `Enter` - Open file
- `Ctrl + x` - Open in horizontal split
- `Ctrl + v` - Open in vertical split
- `Ctrl + t` - Open in new tab

---

### 📁 File Explorer (nvim-tree)

| Key Binding | Description |
|------------|-------------|
| `<Space>ee` | Toggle file explorer |
| `<Space>ef` | Toggle and focus current file |
| `<Space>ec` | Collapse file explorer |
| `<Space>er` | Refresh file explorer |

**Inside File Explorer:**
- `Enter` or `o` - Open file/folder
- `a` - Create new file/folder
- `d` - Delete file/folder
- `r` - Rename file/folder
- `x` - Cut file/folder
- `c` - Copy file/folder
- `p` - Paste file/folder
- `y` - Copy filename
- `Y` - Copy relative path
- `gy` - Copy absolute path
- `I` - Toggle hidden files
- `H` - Toggle dotfiles
- `R` - Refresh
- `q` - Close explorer

---

### 🔧 LSP Features

#### Navigation
| Key Binding | Description |
|------------|-------------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gt` | Go to type definition |
| `gR` | Find references |
| `K` | Show hover documentation |

#### Code Actions
| Key Binding | Description |
|------------|-------------|
| `<Space>ca` | Show code actions |
| `<Space>rn` | Rename symbol |
| `<Space>d` | Show line diagnostics |
| `<Space>D` | Show buffer diagnostics |
| `[d` | Go to previous diagnostic |
| `]d` | Go to next diagnostic |
| `<Space>rs` | Restart LSP |

---

### ✏️ Editing & Text Objects

#### Insert Mode
| Key Binding | Description |
|------------|-------------|
| `i` | Insert before cursor |
| `a` | Insert after cursor |
| `o` | Open line below |
| `O` | Open line above |
| `jk` | Exit insert mode (custom) |
| `Esc` | Exit insert mode |

#### Completion (in Insert Mode)
| Key Binding | Description |
|------------|-------------|
| `Ctrl + j` | Next completion item |
| `Ctrl + k` | Previous completion item |
| `Ctrl + Space` | Trigger completion |
| `Ctrl + e` | Close completion menu |
| `Enter` | Confirm selection |
| `Ctrl + b` | Scroll docs up |
| `Ctrl + f` | Scroll docs down |

---

### 💬 Commenting

#### Normal Mode
| Key Binding | Description |
|------------|-------------|
| `gcc` | Toggle line comment |
| `gbc` | Toggle block comment |
| `gc[motion]` | Comment with motion (e.g., `gcap`) |

#### Visual Mode
| Key Binding | Description |
|------------|-------------|
| `V` then `gc` | Comment selected lines |
| `Ctrl+v` then `gc` | Comment visual block |
| `gb` | Toggle block comment |

**Example:** To comment multiple lines:
1. Press `V` to enter visual line mode
2. Use `j/k` to select lines
3. Press `gc` to toggle comments

---

### 🪟 Window Management

| Key Binding | Description |
|------------|-------------|
| `<Space>sv` | Split window vertically |
| `<Space>sh` | Split window horizontally |
| `<Space>se` | Make splits equal size |
| `<Space>sx` | Close current split |
| `Ctrl + h` | Go to left window |
| `Ctrl + j` | Go to lower window |
| `Ctrl + k` | Go to upper window |
| `Ctrl + l` | Go to right window |

#### Window Resizing
| Key Binding | Description |
|------------|-------------|
| `Ctrl + Up` | Increase height |
| `Ctrl + Down` | Decrease height |
| `Ctrl + Left` | Decrease width |
| `Ctrl + Right` | Increase width |

---

### 📑 Tab & Buffer Management

#### Tabs
| Key Binding | Description |
|------------|-------------|
| `<Space>to` | Open new tab |
| `<Space>tx` | Close current tab |
| `<Space>tn` | Go to next tab |
| `<Space>tp` | Go to previous tab |

#### Buffers
| Key Binding | Description |
|------------|-------------|
| `Shift + h` | Previous buffer |
| `Shift + l` | Next buffer |

---

### 🔄 Git Integration (Gitsigns)

| Key Binding | Description |
|------------|-------------|
| `]c` | Next git hunk |
| `[c` | Previous git hunk |
| `<Space>hs` | Stage hunk |
| `<Space>hr` | Reset hunk |
| `<Space>hp` | Preview hunk |
| `<Space>hb` | Blame line |

---

### 🔎 Search & Replace

| Command | Description |
|---------|-------------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `n` | Next search result |
| `N` | Previous search result |
| `*` | Search word under cursor |
| `<Space>nh` | Clear search highlights |
| `:%s/old/new/g` | Replace all in file |
| `:%s/old/new/gc` | Replace with confirmation |

---

### 📋 Copy & Paste

| Key Binding | Description |
|------------|-------------|
| `yy` | Copy line |
| `dd` | Cut line |
| `p` | Paste after cursor |
| `P` | Paste before cursor |
| `"+y` | Copy to system clipboard |
| `"+p` | Paste from system clipboard |

**Note:** With `clipboard=unnamedplus` set, normal `y` and `p` work with system clipboard.

---

### 🎯 Vim Motions (Quick Reference)

#### Movement
- `h/j/k/l` - Left/Down/Up/Right
- `w/b` - Next/Previous word
- `0/$` - Start/End of line
- `gg/G` - Top/Bottom of file
- `{/}` - Previous/Next paragraph
- `Ctrl + u/d` - Half page up/down
- `Ctrl + f/b` - Full page up/down

#### Text Objects
- `ciw` - Change inner word
- `ci"` - Change inside quotes
- `ca(` - Change around parentheses
- `di{` - Delete inside braces
- `ya[` - Copy around brackets

---

### 🛠️ Utility Commands

| Command | Description |
|---------|-------------|
| `:w` | Save file |
| `:q` | Quit |
| `:wq` or `:x` | Save and quit |
| `:q!` | Quit without saving |
| `:Mason` | Open Mason package manager |
| `:Lazy` | Open Lazy plugin manager |
| `:checkhealth` | Check Neovim health |
| `:LspInfo` | Show LSP information |
| `:LspRestart` | Restart LSP server |

---

## 🎨 Color Scheme

This configuration uses a custom slimfat-inspired color scheme based on the oh-my-posh slimfat theme:

- **Background:** `#2f2f2f` (Dark gray)
- **Foreground:** `#26C6DA` (Bright cyan)
- **Comments:** `#7a7a7a` (Medium gray)
- **Accents:** Cyan variations for highlighting

The theme is optimized for:
- Clear syntax distinction
- Reduced eye strain
- Excellent contrast for long coding sessions
- Consistent with terminal theme aesthetics

---

## 🔧 Customization

### Changing Options

Edit `~/.config/nvim/lua/config/options.lua` to modify:
- Tab size and indentation
- Line number display
- Search behavior
- Scrolling behavior
- And more...

### Adding Key Bindings

Edit `~/.config/nvim/lua/config/keymaps.lua` to add or modify key mappings.

### Installing Additional Plugins

Add plugins to the appropriate file in `~/.config/nvim/lua/plugins/` or create a new file. Lazy.nvim will automatically detect and install them.

Example:
```lua
-- Create ~/.config/nvim/lua/plugins/my-plugin.lua
return {
  "author/plugin-name",
  config = function()
    require("plugin-name").setup({})
  end,
}
```

### Changing Color Scheme

Edit `~/.config/nvim/lua/plugins/colorscheme.lua` to:
- Modify existing colors
- Switch to alternative themes (Catppuccin option included)
- Add your own custom colors

---

## 🐛 Troubleshooting

### Plugins Not Installing

```vim
# Force sync all plugins
:Lazy sync

# Clear cache and reinstall
:Lazy clean
:Lazy sync
```

### LSP Not Working

```vim
# Check LSP status
:LspInfo

# Restart LSP
:LspRestart

# Check Mason installations
:Mason
```

### Python LSP Issues

```bash
# Verify Python tools are installed
which pylsp
which black
which isort

# Reinstall if needed
pipx reinstall python-lsp-server
```

### Clearing Plugin Cache

```bash
# Remove plugin cache
rm -rf ~/.local/share/nvim/lazy
rm -rf ~/.local/share/nvim/mason

# Restart Neovim - everything will reinstall
nvim
```

### Module 'cmp' Not Found Error

This usually means plugins loaded in wrong order. Fix:
```bash
# Clear cache and restart
rm -rf ~/.local/share/nvim/lazy
nvim
```

---

## 📚 Learning Resources

### Plugin Documentation
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [LSP Config](https://github.com/neovim/nvim-lspconfig)
- [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)

---

## 🎓 Tips for Efficient Use

### Daily Workflow

1. **Opening Files:**
   - `<Space>ff` → Type filename → Enter
   - `<Space>ee` → Navigate tree → Enter

2. **Code Navigation:**
   - `gd` - Jump to definition
   - `Ctrl + o` - Jump back
   - `<Space>fs` - Search in project

3. **Editing:**
   - `V` → Select lines → `gc` - Comment
   - `ciw` - Change word
   - `ci"` - Change inside quotes

4. **Multi-file Editing:**
   - `<Space>ff` → Open file
   - `Shift + l/h` - Switch buffers
   - `<Space>sv` - Split for side-by-side

### Power User Shortcuts

- `.` - Repeat last action
- `*` - Search word under cursor
- `Ctrl + o/i` - Jump backward/forward in history
- `:sp` or `:vsp` - Quick split
- `ZZ` - Save and quit (faster than `:wq`)

### Vim Motions Mastery

Combine operators with motions:
- `d3w` - Delete 3 words
- `c$` - Change to end of line
- `y}` - Copy to end of paragraph
- `di(` - Delete inside parentheses

---

## 🙏 Acknowledgments

- [Neovim](https://neovim.io/) - The amazing editor
- [lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager
- [Mason](https://github.com/williamboman/mason.nvim) - LSP installer
- [Telescope](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [oh-my-posh](https://ohmyposh.dev/) - Inspiration for color scheme
- All plugin authors and the Neovim community
