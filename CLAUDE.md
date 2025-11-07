# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal Vim configuration repository that provides a customized development environment. The repository uses both Pathogen (via bundle/) and Vim 8's native package management (via pack/plugins/start/) for plugin management.

## Installation

Per README.md, there are two installation modes:

**Full installation on macOS:**
```bash
cd ~
git clone git://github.com/mgunneras/vimrc.git .vim
ln -s .vim/macos.vimrc .vimrc
cd .vim/
git submodule update --init
```

**Lite installation (for remote servers):**
```bash
curl https://raw.githubusercontent.com/mgunneras/vimrc/refs/heads/master/lite.vimrc > ~/.vimrc
```

## Configuration Architecture

### Main Configuration Files

- **macos.vimrc**: Full-featured configuration with all plugins enabled (standard setup)
- **lite.vimrc**: Minimal configuration with most plugins commented out (for environments without submodules)

### Plugin Management

The repository uses a dual-plugin architecture:

1. **Pathogen-managed plugins** (bundle/): Legacy plugins loaded via `pathogen#runtime_append_all_bundles()`
2. **Native Vim 8 packages** (pack/plugins/start/): Modern plugin loading

### Key Plugins (in bundle/)

- **base16-vim**: Extensive color scheme collection
- **coffee**: CoffeeScript syntax support
- **fugitive**: Git integration
- **javascript**: JavaScript syntax
- **jellybeans**: Color scheme
- **nerdcommenter**: Code commenting
- **nerdtree**: File tree explorer (F2 to toggle)
- **repeat**: Better repeat (.) command
- **syntastic**: Syntax checking
- **vim-airline**: Status line
- **vim-arduino**: Arduino development
- **vim-gitgutter**: Git diff in gutter
- **vim-markdown**: Markdown support
- **vim-peepopen**: File navigation
- **vim-ruby**: Ruby support

### Native Plugins (pack/plugins/start/)

- **ctrlp**: Fuzzy file finder (Ctrl+P)

## Important Configuration Details

### Leader Key
The leader key is set to comma (`,`)

### File Auto-reload
The configuration includes `autoread` with FocusGained/BufEnter hooks (macos.vimrc:29-30) to automatically pick up external edits from tools like Claude Code.

### CtrlP Fuzzy Finder
- Activated with `<C-p>`
- Uses `ag` (The Silver Searcher) if available for faster file listing
- Respects `.gitignore`
- Working path mode: 'ra' (nearest ancestor with .git/)

### Color Scheme
Current active scheme in macos.vimrc is `toychest` (line 88). Other schemes are commented out.

### Text Formatting
- Tabs expanded to spaces
- Soft tab stop: 2 spaces
- Shift width: 2 spaces
- Tab display: 4 spaces
- Text width: 79 characters
- Color column at 80 characters (macos.vimrc only)

### Autocommands
Files with shebang lines containing `/bin/` are automatically made executable on save.

### Custom Mappings (Leader-based)
- `,a`: Ack search
- `,ss`: Toggle spell checking
- `,sn/sp/sa/s?`: Spell check navigation
- `,ks`: Strip trailing whitespace
- `,kt`: Convert tabs to spaces
- `,V/v`: Paste from system clipboard
- `,x`: Format XML
- `,t`: New tab (GUI mode)
- `,1-9`: Jump to tab 1-9 (GUI mode)

### Split Navigation
- `<C-h/j/k/l>`: Navigate between splits (left/down/up/right)
- `<C-n/p>`: Navigate between buffers (next/previous)

## Differences Between Full and Lite Versions

The lite.vimrc version has the following disabled:
- Pathogen plugin loading
- Runtime path modifications
- Color column
- GitGutter
- Most vim-airline customizations
- NERDTree functionality
- Syntastic integration

Both versions share the same core Vim settings, mappings, and text formatting configuration.
