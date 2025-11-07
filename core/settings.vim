" ---------------------------------------------------------------------------
"  Core Vim Settings
"  Shared between full and lite configurations
" ---------------------------------------------------------------------------

set nocompatible

" Prevent security exploits
set modelines=0

" Lots of history
set history=1000

" Sane encoding
set encoding=utf-8

" Automatically pick up edits from other programs (claude code etc)
set autoread
au FocusGained,BufEnter * :silent! checktime

" ----------------------------------------------------------------------------
"  Backups
" ----------------------------------------------------------------------------

set nobackup               " do not keep backups after close
set nowritebackup          " do not keep a backup while working
set noswapfile             " don't keep swp files either
set backupdir=~/.vim/backup " store backups under ~/.vim/backup
set backupcopy=yes         " keep attributes of original file
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=~/.vim/swap,~/tmp,. " keep swp files under ~/.vim/swap

" ----------------------------------------------------------------------------
"  Search
" ----------------------------------------------------------------------------

set hlsearch               " highlight all search terms
set incsearch              " highlight search text as entered
set ignorecase             " ignore case when searching
set smartcase              " case sensitive only if capitals in search term

" ----------------------------------------------------------------------------
"  Text Formatting
" ----------------------------------------------------------------------------

set wrap
set textwidth=79
set formatoptions=qrn1
set expandtab              " expand tabs to spaces
set softtabstop=2
set shiftwidth=2           " distance to shift lines with < and >
set ts=4                   " tab character display size
set autoindent

" ----------------------------------------------------------------------------
"  UI
" ----------------------------------------------------------------------------

set ruler                  " show the cursor position all the time
set scrolloff=3            " start scrolling before cursor at end
set noshowcmd              " don't display incomplete commands
set nolazyredraw           " turn off lazy redraw
set wildmenu               " turn on wild menu (better filename completion)
set wildmode=list:longest,full
set backspace=indent,eol,start
set whichwrap+=<,>,h,l,[,] " backspace and cursor keys wrap to
set shortmess=atI          " shorten messages
set report=0               " tell us about changes
set nostartofline          " don't jump to the start of line when scrolling
set linebreak              " wrap long lines between words
set laststatus=2           " always show the status line
set visualbell             " visual bell instead of beeping
set showmode               " indicates input or replace mode at bottom
set showcmd
set hidden
set ttyfast

" ----------------------------------------------------------------------------
"  Filetypes
" ----------------------------------------------------------------------------

filetype plugin indent on

" Nginx configuration files
au BufNewFile,BufRead nginx.conf,*nginx.conf,*/nginx/**/*.conf setfiletype nginx

" Special file syntax without file endings
au BufRead,BufNewFile Podfile set filetype=ruby

" ----------------------------------------------------------------------------
"  Autocommands
" ----------------------------------------------------------------------------

function! MakeExecutable()
  silent !chmod a+x %
endfunction

" On save, make file executable if has shebang line with '/bin/'
au BufWritePost * if getline(1) =~ "^#!/bin/" | :call MakeExecutable() | endif
