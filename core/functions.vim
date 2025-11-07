" ---------------------------------------------------------------------------
"  Custom Functions
"  Shared between full and lite configurations
" ---------------------------------------------------------------------------

" Function to make file executable if it has a shebang
function! MakeExecutable()
  silent !chmod a+x %
endfunction

" Add more custom functions here as needed
