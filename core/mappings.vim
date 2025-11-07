" ---------------------------------------------------------------------------
"  Key Mappings
"  Shared between full and lite configurations
" ---------------------------------------------------------------------------

" Set leader key to comma
let mapleader = ","

" ----------------------------------------------------------------------------
"  Normal Mappings
" ----------------------------------------------------------------------------

" Y to yank to end of line
map Y y$

" Ctrl-x to close current buffer
map <C-x> :q<CR>

" Press Space to turn off highlighting and clear any message already displayed
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Move up and down by screen lines instead of text lines
nnoremap j gj
nnoremap k gk

" Faster viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Easy file saving
map <C-s> :w<CR>

" ---------------------------------------------------------------------------
"  Split Navigation
" ---------------------------------------------------------------------------

" Go left, right, up, down
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" ---------------------------------------------------------------------------
"  Buffer Navigation
" ---------------------------------------------------------------------------

" Map Ctrl+n and Ctrl+p to jump between open buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" ---------------------------------------------------------------------------
"  Spell Checking
" ---------------------------------------------------------------------------

" ,ss toggles spell checking
map <Leader>ss :setlocal spell!<cr>

" Spell checking shortcuts (next, prev, add, suggest)
map <Leader>sn ]s
map <Leader>sp [s
map <Leader>sa zg
map <Leader>s? z=

" ---------------------------------------------------------------------------
"  Handling Whitespace
" ---------------------------------------------------------------------------

" Strip trailing whitespace
map <Leader>ks :%s/\s\+$//g<CR>

" Convert tabs to spaces
map <Leader>kt :%s/\t/  /g<CR>

" ---------------------------------------------------------------------------
"  Copy/Paste Shortcuts
" ---------------------------------------------------------------------------

" Copy to system clipboard
vmap <C-c> "+y

" Paste in NORMAL mode from system clipboard (at or after cursor)
nmap <Leader>V "+gP
nmap <Leader>v "+gp

" Paste in INSERT mode from Vim's clipboard (unnamed register)
imap vp <ESC>pa

" Paste in INSERT mode from system clipboard
imap vv <ESC>"+gpa

" Paste in COMMAND mode from Vim's clipboard (unnamed register)
cmap vp <C-r>"

" Paste in COMMAND mode from system clipboard
cmap vv <C-r>+

" ---------------------------------------------------------------------------
"  Command Mode
" ---------------------------------------------------------------------------

" Change directory to that of current file
cmap cdc cd %:p:h
