" ----------------------------------------------------------------------------
"  Syntastic Configuration
" ----------------------------------------------------------------------------

if !exists('g:loaded_syntastic_plugin')
  finish
endif

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Passive mode for C files
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["c"] }
