# CLAUDE.md

This file provides guidance to Claude Code when working with code in this repository.

## Repository Overview

This is a modern personal Vim configuration repository using Vim 8+ native package management. The repository provides a customized development environment with two configurations: a full-featured setup for local development and a minimal lite version for remote servers.

## Architecture

### Package Management

**Modern Vim 8+ Native Packages** (no external plugin manager needed):
- Plugins in `pack/plugins/start/` are auto-loaded
- Plugins in `pack/plugins/opt/` are lazy-loaded (use `:packadd plugin-name`)
- Theme plugins in `themes/plugins/start/`
- All managed via Git submodules

### Configuration Files

**Entry Points:**
- **vimrc.full**: Full-featured configuration for macOS (symlink to ~/.vimrc)
- **vimrc.lite**: Minimal configuration for remote servers

**Core Modules** (shared between both configs):
- **core/settings.vim**: Core Vim settings (history, encoding, search, formatting, etc.)
- **core/mappings.vim**: All key mappings
- **core/functions.vim**: Custom functions
- **core/ui.vim**: Visual settings and GUI configuration

**Plugin Configurations:**
- **after/plugin/*.vim**: Plugin-specific settings that load after plugins
  - nerdtree.vim, airline.vim, ctrlp.vim, syntastic.vim, gitgutter.vim, etc.

## Installation

### Full Installation (macOS)

```bash
cd ~
git clone git://github.com/mgunneras/vimrc.git .vim
ln -s .vim/vimrc.full .vimrc
cd .vim/
git submodule update --init
```

### Lite Installation (Remote Servers)

**With core modules:**
```bash
cd ~
git clone --depth 1 --no-recurse-submodules git://github.com/mgunneras/vimrc.git .vim
ln -s .vim/vimrc.lite .vimrc
```

**Single file:**
```bash
curl https://raw.githubusercontent.com/mgunneras/vimrc/master/vimrc.lite > ~/.vimrc
```

## Plugins

### Auto-loaded Plugins (pack/plugins/start/)

Essential plugins loaded automatically on startup:
- **nerdtree**: File tree explorer (F2 to toggle)
- **nerdcommenter**: Code commenting
- **ctrlp**: Fuzzy file finder (Ctrl-P)
- **vim-airline**: Enhanced status line
- **vim-gitgutter**: Git diff in gutter
- **syntastic**: Syntax checking
- **vim-repeat**: Better repeat (.) command
- **javascript**: JavaScript syntax
- **vim-markdown**: Markdown support

### Optional Plugins (pack/plugins/opt/)

Language-specific and specialty plugins loaded on demand with `:packadd`:
- **fugitive**: Git integration by tpope (load with `:packadd fugitive`)
- **vim-ruby**: Ruby language support (load with `:packadd vim-ruby`)
- **coffee**: CoffeeScript support (load with `:packadd coffee`)
- **vim-peepopen**: File navigation (load with `:packadd vim-peepopen`)
- **vim-arduino**: Arduino development (load with `:packadd vim-arduino`)

### Theme Plugins (themes/plugins/start/)

- **base16-vim**: Extensive Base16 color scheme collection
- **jellybeans**: Jellybeans color scheme

### Custom Color Schemes (colors/)

Non-plugin color schemes in colors/ directory:
- toychest (default in vimrc.full)
- molokai
- mustang
- tir_black
- zenburn

## Important Configuration Details

### Leader Key
The leader key is set to comma (`,`)

### File Auto-reload
Configuration includes `autoread` with FocusGained/BufEnter hooks to automatically pick up external edits from tools like Claude Code.

### CtrlP Fuzzy Finder
- Activated with `<C-p>`
- Uses `ag` (The Silver Searcher) if available for faster file listing
- Respects `.gitignore`
- Working path mode: 'ra' (nearest ancestor with .git/)

### Color Scheme
Current active scheme in vimrc.full is `toychest`. Other schemes available.

### Text Formatting
- Tabs expanded to spaces
- Soft tab stop: 2 spaces
- Shift width: 2 spaces
- Tab display: 4 spaces
- Text width: 79 characters
- Color column at 80 characters (vimrc.full only)

### Autocommands
Files with shebang lines containing `/bin/` are automatically made executable on save.

### Custom Mappings (Leader-based)

**Editing:**
- `,ss`: Toggle spell checking
- `,sn/sp/sa/s?`: Spell check navigation
- `,ks`: Strip trailing whitespace
- `,kt`: Convert tabs to spaces
- `,a`: Ack search

**Copy/Paste:**
- `,V/v`: Paste from system clipboard (before/after cursor)
- `<C-c>`: Copy to system clipboard (visual mode)

**Plugins:**
- `<F2>`: Toggle NERDTree
- `<C-p>`: CtrlP fuzzy finder

**Other:**
- `,x`: Format XML
- `,t`: New tab (GUI mode)
- `,1-9`: Jump to tab 1-9 (GUI mode)

### Split Navigation
- `<C-h/j/k/l>`: Navigate between splits (left/down/up/right)
- `<C-n/p>`: Navigate between buffers (next/previous)

## Differences Between Full and Lite Versions

**vimrc.full:**
- Loads all core modules
- Enables all plugins (auto-loaded from pack/*/start/ and themes/*/start/)
- Full UI features (color column, color scheme)
- Plugin-specific configurations
- Ideal for local development

**vimrc.lite:**
- Loads core modules OR standalone fallback settings
- No plugins (ultra-lightweight)
- Minimal UI
- Can be used as single file or with core modules
- Perfect for remote servers

Both versions share:
- Same core settings (via core/*.vim modules)
- Same key mappings
- Same custom functions
- Same text formatting rules

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

## Making Changes

When modifying this configuration:

1. **Core settings** that should be shared: Edit files in `core/`
2. **Plugin-specific settings**: Edit or create files in `after/plugin/`
3. **Full-only features**: Edit `vimrc.full`
4. **Lite-only features**: Edit `vimrc.lite`
5. **Adding plugins**: Use git submodule commands
6. **Custom color schemes**: Add to `colors/` directory
7. **Custom scripts**: Add to `plugin/` or `autoload/`

## File Organization

```
.vim/
├── vimrc.full              # Full config entry point
├── vimrc.lite              # Lite config entry point
├── core/                   # Shared core modules
│   ├── settings.vim
│   ├── mappings.vim
│   ├── functions.vim
│   └── ui.vim
├── pack/plugins/           # Functional plugins
│   ├── start/              # Auto-loaded
│   └── opt/                # Lazy-loaded
├── themes/plugins/start/   # Color scheme plugins
├── after/plugin/           # Plugin configs (load after plugins)
├── colors/                 # Custom color schemes
├── autoload/               # Autoload functions
├── plugin/                 # Custom plugins
├── doc/                    # Documentation
└── syntax/                 # Custom syntax files
```

## Legacy Note

This configuration was previously based on Pathogen (bundle/ directory). It has been modernized to use Vim 8+ native package management. See MIGRATION_PLAN.md for migration details.
