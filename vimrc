

" -----
"  Pathogen

" Must be called before file type detection (I think)
" i.e. filetype plugin indent on
execute pathogen#infect()


" ----- 
"  Misc

" Place backups and temporary files in central storage
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Insertion of new line in normal mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Center cursor on screen while searching
nmap n nzz
nmap N Nzz

" Clear search highlight
" NEED TO BE SET!
" nmap <leader>se :noh<cr>

" Soft break on word boundaries, and not showing hidden characters like tab
set wrap linebreak nolist

" Remapping leader
let mapleader = ","
let maplocalleader = ","

" History length
set history=1000

" File/Command completion (command mode)
set wildmenu
" Only complete to point of ambiguity (like shell)
" set wildmode=list:longest 

" Hidden - Enables background buffers not written to disk
set hidden

" Visual bell
set visualbell

" Start scrolling earlier to viewport edge
set scrolloff=3

" '%' matching also begin/end, xml open/close tags etc
runtime macros/matchit.vim


" -----
" NPM

" Run 'npm start'
:autocmd FileType javascript nnoremap <buffer> <localleader>ns :!npm<space>start<cr>
:autocmd FileType html nnoremap <buffer> <localleader>ns :!npm<space>start<cr>
:autocmd FileType css nnoremap <buffer> <localleader>ns :!npm<space>start<cr>

" Run 'node bin/www'
:autocmd FileType javascript nnoremap <buffer> <localleader>nw :!node<space>bin/www<cr>
:autocmd FileType html nnoremap <buffer> <localleader>nw :!node<space>bin/www<cr>
:autocmd FileType css nnoremap <buffer> <localleader>nw :!node<space>bin/www<cr>


" ----- 
"  Tab settings

" Default tab settings
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
" Change tab settings for a specific file type using below (exemplified for
" css)
":autocmd FileType css setlocal tabstop=4 shiftwidth=4 softtabstop=4

" Make - Avoid tab as spaces
autocmd FileType make setlocal noexpandtab


" ----- 
" Text formatting

" TeX
:autocmd FileType tex setlocal formatoptions=tcroqn textwidth=79


" ----- 
"  javascript-libraries-syntax.vim

let g:used_javascript_libs = 'jquery,angularjs,angularui,jasmine,underscore'


" -----
"  vim-easy-align

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" -----
"  Vim-Latex

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" pdf output instead of dvi (pdf is default for Mac)
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf='preview'

" Multiple compilation times
" (includes dvi by default, so it's added here as well)
let g:Tex_MultipleCompileFormats='pdf,dvi'

" disable folding
let g:Tex_FoldedSections=""
let g:Tex_FoldedEnvironments=""
let g:Tex_FoldedMisc=""


" -----
"  Solarized

" 'If you do use the custom terminal colors, simply add the following line before the colorschem solarized line'
let g:solarized_termcolors=16
set background=light
" set background=dark
colorscheme solarized


" -----
"  Sample vimrc
"
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2014 Feb 05
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

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

