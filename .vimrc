" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2001 Jul 18
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set nowrap

" because Y is same to yy, so map Y to y$ (yank to end of line)
map Y y$
" map number pad keys:
nmap Op 0
nmap Oq 1
nmap Or 2
nmap Os 3
nmap Ot 4
nmap Ou 5
nmap Ov 6
nmap Ow 7
nmap Ox 8
nmap Oy 9
nmap On . 
map! Op 0
map! Oq 1
map! Or 2
map! Os 3
map! Ot 4
map! Ou 5
map! Ov 6
map! Ow 7
map! Ox 8
map! Oy 9
map! On .
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>

set tabstop=3
set shiftwidth=3
set nu
set cursorline
"autocmd InsertLeave * hi clear
"autocmd InsertEnter * hi cursorline term=none cterm=none
""hi CursorLine   cterm=NONE ctermbg=none ctermfg=white guibg=ligtblue guifg=lightblue
hi Comment ctermfg=lightblue

"command Suni set encoding=utf-8
"set encoding=utf-8
set fileencodings=utf8,big5,gbk,latin1
set fileencoding=big5
set <C-u>=^U
set <C-b>=^B
map <C-u> :set fileencoding=utf8
map <C-b> :set fileencoding=big5
"set softtabstop=4

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set autoindent		" always set autoindenting on
set backup
set bdir=~/.vim/backup/
"if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
"endif

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set laststatus=2
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

set tags=./tags;../tags;../../tags;../../../tags;../../../../tags;../../../../../tags;../../../../../tags;
map <C-]> g<C-]>

" ³o¬q¥Î¨Ó¨Ï vim ¥i¥H¨Ï¥ÎÃC¦â
if has("termino")
  set t_Co=8
  set t_Sf=[3%p1%dm
  set t_Sb=[4%p1%dm
else
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
"  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")
source ~/.vim/colors/syncolor.vim
