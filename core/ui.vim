" ---------------------------------------------------------------------------
"  UI Settings
"  Shared between full and lite configurations
" ---------------------------------------------------------------------------

" Enable syntax highlighting
syntax on

" 256 color support
set t_Co=256

" Don't highlight matching brackets/braces
let loaded_matchparen=1

" ----------------------------------------------------------------------------
"  Graphical Vim Settings
" ----------------------------------------------------------------------------

if has('gui_running')
  if system("uname") == "Darwin\n" " on OSX
    set guifont=Monaco
    set lines=70
    set columns=236
  else                         " on Ubuntu
    set guifont=Monospace\ 8
    winpos 1100 0              " put window at right edge of left monitor
    set lines=85
    set columns=140
  endif

  set guioptions=gemc          " show menu, tabs, console dialogs
  set cursorline

  " --------------------------------------------------------------------------
  "  Highlight Trailing Whitespace
  " --------------------------------------------------------------------------

  " Note that this inhibits the linebreak option so lines will wrap mid-word
  set list listchars=trail:.,tab:>.
  highlight SpecialKey ctermfg=DarkGray ctermbg=Black

  " --------------------------------------------------------------------------
  "  Tab Navigation
  " --------------------------------------------------------------------------

  set guitablabel=%N\ %t\ %M\ %r

  " Quick open new tab
  map <Leader>t :tabnew<CR>

  " C-TAB and C-SHIFT-TAB cycle tabs forward and backward
  nmap <C-tab> :tabnext<CR>
  imap <C-tab> <C-o>:tabnext<CR>
  vmap <C-tab> <C-o>:tabnext<CR>
  nmap <C-S-tab> :tabprevious<CR>
  imap <C-S-tab> <C-o>:tabprevious<CR>
  vmap <C-S-tab> <C-o>:tabprevious<CR>

  " Jump directly to tab
  let i=1
  while i<=9
    execute "map <Leader>".i." ".i."gt<CR>"
    let i+=1
  endwhile
endif
