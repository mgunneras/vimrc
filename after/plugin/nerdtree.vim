" ----------------------------------------------------------------------------
"  NERDTree Configuration
" ----------------------------------------------------------------------------

if !exists('loaded_nerd_tree')
  finish
endif

" Set width
let g:NERDTreeWinSize = 25

" Toggle visibility with F2
" Note: On macOS, you may need to:
"   - Press Fn+F2 (if function keys are set to control system features)
"   - OR go to System Settings > Keyboard > Keyboard Shortcuts > Function Keys
"     and enable "Use F1, F2, etc. keys as standard function keys"
nnoremap <F2> :NERDTreeToggle<CR>
inoremap <F2> <Esc>:NERDTreeToggle<CR>

" Alternative mapping: Leader + n (in case F2 doesn't work in your terminal)
nnoremap <Leader>n :NERDTreeToggle<CR>

" Hide files
let NERDTreeIgnore = ['\.pyc$']

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
