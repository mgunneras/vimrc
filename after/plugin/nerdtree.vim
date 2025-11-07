" ----------------------------------------------------------------------------
"  NERDTree Configuration
" ----------------------------------------------------------------------------

if !exists('g:loaded_nerdtree')
  finish
endif

" Set width
let g:NERDTreeWinSize = 25

" Toggle visibility with F2
map <F2> :NERDTreeToggle<CR>

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
