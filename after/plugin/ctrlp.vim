" ----------------------------------------------------------------------------
"  CtrlP Configuration
" ----------------------------------------------------------------------------

if !exists('g:loaded_ctrlp')
  finish
endif

" Set mapping
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Working path mode: 'ra' (nearest ancestor with .git/)
let g:ctrlp_working_path_mode = 'ra'

" Use ag (The Silver Searcher) if available for faster file listing
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0
endif
