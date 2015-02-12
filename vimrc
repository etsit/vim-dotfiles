

" -----
"  Plugin - Pathogen

" Must be called before file type detection (I think)
" i.e. filetype plugin indent on
execute pathogen#infect()


" ----- 
"  Plugin - javascript-libraries-syntax.vim

let g:used_javascript_libs = 'jquery,angularjs,angularui,jasmine,underscore'


" -----
"  Plugin - vim-easy-align

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" -----
"  Plugin - vim-sparkup

" Change mapping to avoid conflict with neosnippet.vim
let g:sparkupExecuteMapping = '<c-s>'
let g:sparkupNextMapping = '<c-d>'


" -----
"  Plugin - neocomplete.vim

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


" -----
"  Plugin - neocomplete.vim

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

"autocmd InsertLeave * NeoSnippetClearMarkers


" -----
"  Plugin - Vim-Latex

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

" Map insertion of new item, since Alt-i doesn't work
imap <c-o> <Plug>Tex_InsertItemOnThisLine


" -----
"  Plugin - Solarized

" 'If you do use the custom terminal colors, simply add the following line before the colorschem solarized line'
let g:solarized_termcolors=16
set background=dark
"set background=light
colorscheme solarized


" -----
"  Plugin - gundo.vim
nnoremap <F2> :GundoToggle<CR>


" -----
"  Plugin - vim-airline

" Required to show airline in single window
set laststatus=2
" Top buffer bar
let g:airline#extensions#tabline#enabled = 1


" -----
"  Plugin - ctrlp.vim

let g:ctrlp_open_multiple_files = '10tjr'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cmd = 'CtrlPMRU'


" -----
"  Plugin - tern_for_vim

let g:tern_map_keys=1


" -----
"  Formatting JSON

function! FormatJSON() 
  :%!python -m json.tool 
endfunction
com! FormatJSON call FormatJSON()
"nmap =j :call FormatJSON()<CR>


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


" ----- 
"  Plugin - vim-hdevtools
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsClear<CR>
let g:syntastic_haskell_hdevtools_args = '-g -Wall'


" -----
"  Plugin - haskellmode-vim
au BufEnter *.hs compiler ghc
" Decide which version of ghc to use
":let g:ghc="/usr/bin/ghc-6.6.1"
" Default browser for docs
let g:haddock_browser="/Applications/Firefox.app/Contents/MacOS/firefox"

" ----- 
"  Misc

" Mapping jk as Escape
" Note, no comments shall be placed on the same line
:inoremap jk <Esc>

"  Tab settings
" Default tab settings
set tabstop=2                   "A tab is 8 spaces
set expandtab                   "Always uses spaces instead of tabs
set softtabstop=2               "Insert 4 spaces when tab is pressed
set shiftwidth=2                "An indent is 4 spaces
set shiftround                  "Round indent to nearest shiftwidth multiple
" Change tab settings for a specific file type 
" Make - Avoid tab as spaces
autocmd FileType make setlocal noexpandtab
" CSS
"autocmd FileType css setlocal tabstop=4 shiftwidth=4 softtabstop=4

" Show line numbers
set nu

" TeX
autocmd FileType tex setlocal formatoptions=tcroqn textwidth=79

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
nmap !n :noh<cr>

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

" Search with \c and \C to override
set smartcase

" Hidden - Enables background buffers not written to disk
set hidden

" Visual bell
set visualbell

" Start scrolling earlier to viewport edge
set scrolloff=3

" '%' matching also begin/end, xml open/close tags etc
runtime macros/matchit.vim

" Run 'npm start'
autocmd FileType javascript nnoremap <buffer> <localleader>ns :!npm<space>start<cr>
autocmd FileType html nnoremap <buffer> <localleader>ns :!npm<space>start<cr>
autocmd FileType css nnoremap <buffer> <localleader>ns :!npm<space>start<cr>

" Run 'node bin/www'
autocmd FileType javascript nnoremap <buffer> <localleader>nw :!node<space>bin/www<cr>
autocmd FileType html nnoremap <buffer> <localleader>nw :!node<space>bin/www<cr>
autocmd FileType css nnoremap <buffer> <localleader>nw :!node<space>bin/www<cr>

" Edit vimrc
nnoremap <leader>ev :tabnew ~/.vim/vimrc<CR>

" {} and [] blocks
inoremap <localleader>[ [<CR>]<Esc>O
inoremap <localleader>] [<CR>];<Esc>O
inoremap <localleader>{ {<CR>}<Esc>O
inoremap <localleader>} {<CR>};<Esc>O

" Scroll other window
nnoremap <leader>j <c-w>w<c-e><c-w>w
nnoremap <leader>k <c-w>w<c-y><c-w>w 

" Abbreviations
" Note: Latex-Suite is hijacking normal maps using ab,
" therefore mappings are done using suggestions at
" http://vim-latex.sourceforge.net/documentation/latex-suite/ls-new-macros.html
" (Not filetype specific below)
augroup MyIMAPs
    au!
    au VimEnter * call IMAP('wwetal', 'et~al.\ ', '')
    au VimEnter * call IMAP('wwcetal', 'Cooper~et~al.\ ', '')
    au VimEnter * call IMAP('wwgdd', '\mbox{Goal-Directed}~Design', '')
    au VimEnter * call IMAP('wwng', 'AngularJS', '')
    au VimEnter * call IMAP('wwnode', 'Node.js', '')
    au VimEnter * call IMAP('wwjs', 'JavaScript', '')
    au VimEnter * call IMAP('wwsp', 'SPARQL', '')
    au VimEnter * call IMAP('wwsrl', 'Spuirrel', '')
augroup END
