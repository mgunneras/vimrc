# Modern Vim Configuration

A clean, modular Vim configuration using Vim 8+ native package management.

## Features

- **Native Package Management**: Uses Vim 8+ built-in `pack/` system (no external plugin manager needed)
- **Modular Configuration**: Shared core settings with separate full and lite configurations
- **Two Profiles**: Full-featured setup for development machines, minimal setup for remote servers
- **Modern Structure**: Clean, maintainable directory organization
- **Easy Plugin Management**: Git submodules for version control

## Directory Structure

```
.vim/
├── vimrc.full              # Full configuration (macOS)
├── vimrc.lite              # Minimal configuration (remote servers)
├── core/                   # Shared configuration modules
│   ├── settings.vim        # Core Vim settings
│   ├── mappings.vim        # Key mappings
│   ├── functions.vim       # Custom functions
│   └── ui.vim              # UI settings
├── pack/plugins/           # Functional plugins
│   ├── start/              # Auto-loaded plugins
│   └── opt/                # Lazy-loaded plugins
├── themes/plugins/start/   # Color scheme plugins
├── after/plugin/           # Plugin-specific configurations
├── colors/                 # Custom color schemes
├── autoload/               # Autoload functions
└── plugin/                 # Custom scripts
```

## Installation

### Full Installation (macOS)

For your development machine with all plugins and features:

```bash
cd ~
git clone git://github.com/mgunneras/vimrc.git .vim
ln -s .vim/vimrc.full .vimrc
cd .vim/
git submodule update --init
```

### Lite Installation (Remote Servers)

#### Option 1: With Core Modules (Recommended)

Clone the repository without plugins for a lightweight setup:

```bash
cd ~
git clone --depth 1 --no-recurse-submodules git://github.com/mgunneras/vimrc.git .vim
ln -s .vim/vimrc.lite .vimrc
```

#### Option 2: Single File

For the absolute minimal setup, download just the vimrc file:

```bash
curl https://raw.githubusercontent.com/mgunneras/vimrc/master/vimrc.lite > ~/.vimrc
```

## Plugins

### Functional Plugins (pack/plugins/start/)

- **fugitive** - Git integration
- **nerdtree** - File tree explorer (F2 to toggle)
- **nerdcommenter** - Code commenting
- **ctrlp** - Fuzzy file finder (Ctrl-P)
- **vim-airline** - Enhanced status line
- **vim-gitgutter** - Git diff in gutter
- **syntastic** - Syntax checking
- **vim-repeat** - Better repeat (.) command
- **vim-ruby** - Ruby support
- **vim-javascript** - JavaScript syntax
- **vim-markdown** - Markdown support
- **vim-coffee-script** - CoffeeScript support
- **vim-peepopen** - File navigation

### Optional Plugins (pack/plugins/opt/)

- **vim-arduino** - Arduino development (load with `:packadd vim-arduino`)

### Theme Plugins (themes/plugins/start/)

- **base16-vim** - Base16 color schemes
- **jellybeans** - Jellybeans color scheme

### Custom Color Schemes (colors/)

- toychest (default)
- molokai
- mustang
- tir_black
- zenburn

## Key Mappings

Leader key: `,`

### General
- `<Space>` - Clear search highlighting
- `<C-s>` - Save file
- `<C-x>` - Close buffer
- `Y` - Yank to end of line

### Navigation
- `<C-h/j/k/l>` - Navigate between splits (left/down/up/right)
- `<C-n/p>` - Navigate between buffers (next/previous)
- `j/k` - Move by screen lines (not text lines)

### Plugins
- `<F2>` - Toggle NERDTree
- `<C-p>` - CtrlP fuzzy finder
- `<Leader>a` - Ack search

### Editing
- `<Leader>ss` - Toggle spell checking
- `<Leader>sn/sp/sa/s?` - Spell check navigation
- `<Leader>ks` - Strip trailing whitespace
- `<Leader>kt` - Convert tabs to spaces

### Copy/Paste
- `<C-c>` - Copy to system clipboard (visual mode)
- `<Leader>V/v` - Paste from system clipboard

## Plugin Management

### Update All Plugins

```bash
cd ~/.vim
git submodule update --remote --merge
```

### Add New Plugin

```bash
cd ~/.vim
git submodule add https://github.com/author/plugin.git pack/plugins/start/plugin
git commit -m "Add plugin"
```

### Remove Plugin

```bash
cd ~/.vim
git submodule deinit pack/plugins/start/plugin
git rm pack/plugins/start/plugin
git commit -m "Remove plugin"
```

## Configuration Files

### Full Configuration (vimrc.full)

- Loads all core modules
- Enables all plugins
- Full UI features (color column, color schemes)
- Ideal for local development

### Lite Configuration (vimrc.lite)

- Loads core modules OR includes standalone fallback
- No plugins (ultra-lightweight)
- Minimal UI
- Perfect for remote servers

### Core Modules

All shared settings are in modular files:

- **core/settings.vim** - Vim options, search, formatting, backups
- **core/mappings.vim** - All key mappings
- **core/functions.vim** - Custom functions
- **core/ui.vim** - Visual settings and GUI configuration

## Migration from Legacy Setup

If you're upgrading from the old Pathogen-based setup, see [MIGRATION_PLAN.md](MIGRATION_PLAN.md) for details.

## Color Schemes

The full configuration uses `toychest` by default. To change:

1. Edit `vimrc.full`
2. Change the `colorscheme` line to your preference
3. Available schemes: toychest, jellybeans, base16-*, molokai, zenburn, mustang

## Requirements

- Vim 8.0+ (for native package management)
- Git (for submodule management)
- Optional: `ag` (The Silver Searcher) for faster CtrlP file listing

## License

Personal configuration - use freely
