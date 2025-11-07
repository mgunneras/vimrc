# Vim Configuration Modernization Plan

## Current State (Legacy)
- **Plugin Manager**: Pathogen (legacy, deprecated)
- **Location**: `bundle/` directory with git submodules
- **Config Files**: `macos.vimrc` and `lite.vimrc` (mostly duplicated)

## Target State (Modern 2025)

### Plugin Management
- **Use Vim 8+ Native Packages** (`pack/` directory)
- No external plugin manager needed
- Git submodules for version control
- Clean separation of auto-loaded vs lazy-loaded plugins

### Directory Structure
```
.vim/
├── vimrc.full              # Entry point for macOS (symlink to ~/.vimrc)
├── vimrc.lite              # Entry point for remote servers
├── core/
│   ├── settings.vim        # Core Vim settings (shared)
│   ├── mappings.vim        # Key mappings (shared)
│   ├── functions.vim       # Custom functions (shared)
│   └── ui.vim              # UI settings (shared)
├── pack/
│   └── plugins/
│       ├── start/          # Auto-loaded plugins (full config only)
│       │   ├── vim-fugitive/
│       │   ├── nerdtree/
│       │   ├── vim-airline/
│       │   ├── vim-gitgutter/
│       │   ├── ctrlp/
│       │   ├── nerdcommenter/
│       │   ├── vim-repeat/
│       │   ├── syntastic/
│       │   ├── vim-ruby/
│       │   ├── vim-javascript/
│       │   ├── vim-markdown/
│       │   └── vim-coffee-script/
│       └── opt/            # Lazy-loaded plugins (on-demand)
│           └── vim-arduino/
├── themes/
│   └── plugins/
│       └── start/
│           ├── base16-vim/
│           └── jellybeans/
├── after/
│   └── plugin/
│       ├── nerdtree.vim    # NERDTree configuration
│       ├── airline.vim     # Airline configuration
│       ├── ctrlp.vim       # CtrlP configuration
│       └── syntastic.vim   # Syntastic configuration
├── colors/                 # Custom color schemes (non-plugin)
├── autoload/               # Autoload functions
├── ftplugin/               # Filetype-specific settings
└── plugin/                 # Custom plugins/scripts
```

## Key Improvements

### 1. Native Package Management
- **No Pathogen dependency**: Uses Vim 8+ built-in package support
- **Automatic loading**: Plugins in `pack/*/start/` load automatically
- **Lazy loading**: Plugins in `pack/*/opt/` load with `:packadd`
- **Clean namespacing**: Separate theme plugins from functional plugins

### 2. Modular Configuration
- **DRY principle**: Shared settings in `core/` directory
- **Easy maintenance**: Related settings grouped logically
- **Clear separation**: Full vs lite differences obvious

### 3. Two Entry Points

**vimrc.full** (macOS):
```vim
" Load core settings
source ~/.vim/core/settings.vim
source ~/.vim/core/mappings.vim
source ~/.vim/core/functions.vim
source ~/.vim/core/ui.vim

" All plugins auto-load from pack/*/start/
" Plugin-specific configs load from after/plugin/

" macOS-specific settings
set colorcolumn=80
colorscheme toychest
```

**vimrc.lite** (Remote servers):
```vim
" Load core settings only
source ~/.vim/core/settings.vim
source ~/.vim/core/mappings.vim
source ~/.vim/core/functions.vim

" Minimal UI
set visualbell
syntax on

" No plugins loaded (pack/ directories not present on remote)
```

## Migration Steps

1. **Backup current configuration**
2. **Create new directory structure**
3. **Move plugins from bundle/ to pack/plugins/start/**
4. **Extract common settings to core/ modules**
5. **Create modular vimrc.full and vimrc.lite**
6. **Move plugin configs to after/plugin/**
7. **Update .gitmodules and .gitignore**
8. **Test full configuration**
9. **Test lite configuration**
10. **Remove legacy bundle/ and pathogen**
11. **Update README.md with new installation instructions**

## Installation Instructions (New)

### Full Installation (macOS)
```bash
cd ~
git clone git://github.com/mgunneras/vimrc.git .vim
ln -s .vim/vimrc.full .vimrc
cd .vim/
git submodule update --init
```

### Lite Installation (Remote Servers)
```bash
cd ~
git clone --depth 1 --no-recurse-submodules git://github.com/mgunneras/vimrc.git .vim
ln -s .vim/vimrc.lite .vimrc
```

Or single file:
```bash
curl https://raw.githubusercontent.com/mgunneras/vimrc/master/vimrc.lite > ~/.vimrc
```

## Benefits

1. ✅ **No external dependencies** - Uses native Vim 8+ features
2. ✅ **Cleaner structure** - Logical organization
3. ✅ **Better maintainability** - DRY, modular configs
4. ✅ **Faster startup** - No Pathogen overhead
5. ✅ **Future-proof** - Follows 2025 best practices
6. ✅ **Easy plugin updates** - `git submodule update --remote`
7. ✅ **Selective installation** - Lite version doesn't need submodules

## Plugin Updates (Future)

Update all plugins:
```bash
cd ~/.vim
git submodule update --remote --merge
```

Add new plugin:
```bash
cd ~/.vim
git submodule add https://github.com/author/plugin.git pack/plugins/start/plugin
git commit -m "Add plugin"
```

Remove plugin:
```bash
cd ~/.vim
git submodule deinit pack/plugins/start/plugin
git rm pack/plugins/start/plugin
git commit -m "Remove plugin"
```
