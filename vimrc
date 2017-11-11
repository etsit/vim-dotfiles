

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

" Ignore lines that don't include delimiter
let g:easy_align_ignore_unmatched = 0 

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" -----
"  Plugin - vim-sparkup

let g:sparkupDoubleQuote = 1

" Change mapping to avoid conflict with neosnippet.vim
"let g:sparkupExecuteMapping = '<c-s>'
"let g:sparkupNextMapping = '<c-d>'


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

" SEEMS LIKE SNIPPETS SETTINGS
"" Plugin key-mappings.
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)

"" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: "\<TAB>"

"" For snippet_complete marker.
"if has('conceal')
"  set conceallevel=2 concealcursor=i
"endif

"" Enable snipMate compatibility feature.
"let g:neosnippet#enable_snipmate_compatibility = 1

"" Tell Neosnippet about the other snippets
"let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

""autocmd InsertLeave * NeoSnippetClearMarkers


" -----
"  Plugin - ultisnips

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


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
"let g:Tex_FoldedSections=""
"let g:Tex_FoldedEnvironments=""
"let g:Tex_FoldedMisc=""

" Map insertion of new item, since Alt-i doesn't work
imap <C-b> <Plug>Tex_InsertItemOnThisLine

" redef C-j to C-g
imap <C-g> <Plug>IMAP_JumpForward
nmap <C-g> <Plug>IMAP_JumpForward


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
"  Plugin - vim-colors_atelier-schemes

syntax enable

set background=dark
"set background=light

"colorscheme base16-ateliersulphurpool
"colorscheme monokai
"colorscheme Atelier_Sulphurpool
"colorscheme base16-atelierdune
"colorscheme base16-atelierforest
"colorscheme base16-atelierplateau
"colorscheme base16-atelierheath
"colorscheme base16-ateliercave
"colorscheme base16-atelierlakeside
colorscheme base16-ateliersavanna
"colorscheme base16-atelierseaside
"colorscheme base16-atelierdune
"colorscheme base16-atelierestuary


" -----
"  Plugin - ctrlp.vim

let g:ctrlp_open_multiple_files = '1ij'
"let g:ctrlp_open_multiple_files = '10tjr'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cmd = 'CtrlPBuffer'
"let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_cmd = 'CtrlPMRU'


" -----
"  Plugin - tern_for_vim

let g:tern_map_keys=1


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
"  Plugin - elm-vim

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1
call neocomplete#util#set_default_dictionary(
  \ 'g:neocomplete#sources#omni#input_patterns',
  \ 'elm',
  \ '\.')


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
  set nohls
  "set hlsearch
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
"  vim-coffee-script

" Compile on write
" - silent: Don't show compiler output in bottom window
" - !:      Don't jump to line of error
"autocmd BufWritePost *.coffee silent make!
"autocmd BufWritePost *.coffee :CoffeeLint! | cwindow

" Show quickfix window if errors on compile
"autocmd QuickFixCmdPost * nested cwindow | redraw!

" Open temporary compilation output buffer in vertical mode
let coffee_compile_vert = 1
let coffee_watch_vert   = 1
let coffee_run_vert     = 1

" CoffeeLint
let coffee_lint_options = '-f ~/Dropbox/config/macosx/coffeelint/coffeelint.json'


" ----- 
"  vim-session

let g:session_autosave  = "no"
let g:session_directory = "~/Dropbox/config/macosx/vim/sessions"
"let g:session_autoload  = "no"


" ----- 
"  NERDTree

" Open NERDTree on vim startup (Interferes with sessions)
"autocmd VimEnter * NERDTree

" Close NERDTree if it's the only thing open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Shortcuts - NERDTree
map <F3> :NERDTreeToggle<CR>


" ----- 
"  ag.vim

let g:agprg = "ag --column --ignore={*.map,*concat*.js,*min*.js,*bower_components*,*node_modules*}"


" ----- 
"  vim-fsharp

" turn off if completion is too slow
let g:fsharp_completion_helptext = 1


" ----- 
"  Misc

" '%' matching also begin/end, xml open/close tags etc
runtime macros/matchit.vim

" Remapping leader
"let mapleader      = ","
"let maplocalleader = ","

" General function: Map key to toggle opt
" http://vim.wikia.com/wiki/Quick_generic_option_toggling
function MapToggle(key, opt)
  let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
  exec 'nnoremap '.a:key.' '.cmd
  exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command -nargs=+ MapToggle call MapToggle(<f-args>)

" Toggle paste
MapToggle <leader>p paste

" Default tab settings
" Mode options
set expandtab     "Insert spaces instead of tabs
set shiftround    "Round indent to nearest shiftwidth multiple
set nosmarttab    "shiftwidth is only used for shifting text
" Numeric options
set tabstop=4     "A tab character is visually 4 spaces
set softtabstop=4 "Insert 4 spaces when tab is pressed
set shiftwidth=4  "An indent is 4 spaces

" Show line numbers
set nu

" Place backups and temporary files in central storage
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Soft break on word boundaries, and not showing hidden characters like tab
set wrap linebreak nolist

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

" Remove right scroll bar
set guioptions-=r

" Read changes on disk without prompting
"set autoread

" Relative line numbers
set relativenumber

" Folding
set foldcolumn=5

" JavaScript
autocmd FileType javascript inoremap clog console.log('');<Esc>hhi
autocmd FileType javascript inoremap cerr console.err('');<Esc>hhi
autocmd FileType javascript inoremap <buffer> <localleader>f function() {<CR>}<Esc>?(<CR>:nohl<CR>a
" Set filetype html for *.ejs (Embedded JavaScript templates)
"au BufNewFile,BufRead *.ejs set filetype=html

" Make 
nnoremap <localleader>m :make<CR>

" CoffeeScript 
autocmd FileType coffee nnoremap <localleader>or :CoffeeRun<CR>
autocmd FileType coffee xnoremap <localleader>or :CoffeeRun<CR>
autocmd FileType coffee nnoremap <localleader>ow :CoffeeWatch<CR>
autocmd FileType coffee xnoremap <localleader>ow :CoffeeWatch<CR>
autocmd FileType coffee nnoremap <localleader>ol :CoffeeLint<CR>
autocmd FileType coffee xnoremap <localleader>ol :CoffeeLint<CR>

" Shortcuts - Gulp
" First save all
nnoremap <localleader>b :wa \| !gulp build-app<CR>

" Make shortcuts
nnoremap <localleader>m :make<CR>

" Open Firefox
nnoremap <localleader>nf :!open -a firefox %<CR>

" Auto Commands
autocmd FileType make                            setlocal noexpandtab
autocmd FileType cucumber                        setlocal noexpandtab
autocmd FileType javascript                      setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css                             setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html                            setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType json                            setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType coffee                          setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType fsharp                          setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent
autocmd FileType sparql                          setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent
autocmd FileType text                            setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent
autocmd FileType tex                             setlocal formatoptions=tcroqn textwidth=79
autocmd FileType javascript,coffee,html,css,json nnoremap <buffer> <localleader>ns :!npm<space>start<cr>
autocmd FileType javascript,coffee,html,css,json nnoremap <buffer> <localleader>nb :!npm<space>run<space>build<cr>
autocmd FileType javascript,coffee,html,css,json nnoremap <buffer> <localleader>nl :!npm<space>run<space>build<space>&&<space>npm<space>start<cr>
"autocmd FileType coffee                          setl     foldmethod=indent
"autocmd FileType javascript                      setl     foldmethod=syntax

" Abbreviations
" Note: Latex-Suite is hijacking normal abbreviations using ab,
" therefore mappings are done using suggestions at
" http://vim-latex.sourceforge.net/documentation/latex-suite/ls-new-macros.html
" (Not filetype specific below)
"augroup MyIMAPs
"   au!
"   au  VimEnter * call IMAP('wwetal',  'et~al.\ ',                    '')
"   au  VimEnter * call IMAP('wwcetal', 'Cooper~et~al.\ ',             '')
"   au  VimEnter * call IMAP('wwgdd',   '\mbox{Goal-Directed}~Design', '')
"   au  VimEnter * call IMAP('wwng',    'AngularJS',                   '')
"   au  VimEnter * call IMAP('wwnode',  'Node.js',                     '')
"   au  VimEnter * call IMAP('wwjs',    'JavaScript',                  '')
"   au  VimEnter * call IMAP('wwsp',    'SPARQL',                      '')
"   au  VimEnter * call IMAP('humle',    'dumle',                      '')
"augroup END

" -----
" General key mappings

" Mapping kj as Escape
" Note, no comments shall be placed on the same line
"inoremap kj <Esc>

" Make C, D and Y consistent
nnoremap Y y$

" 'Stamping' - Mappings for replace
nnoremap S "_ciw<C-r>0<Esc>b
" Below taken from surround.vim
" but it doesn't work correctly if word ends line
"nnoremap S "_diw""Pb
"xnoremap S "_d""Pb

" Center cursor on screen while searching
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz

nmap 'a 'azz
nmap 'b 'bzz
nmap 'c 'czz
nmap 'd 'dzz
nmap 'e 'ezz
nmap 'f 'fzz
nmap 'g 'gzz
nmap 'h 'hzz
nmap 'i 'izz
nmap 'j 'jzz
nmap 'k 'kzz
nmap 'l 'lzz
nmap 'm 'mzz
nmap 'n 'nzz
nmap 'o 'ozz
nmap 'p 'pzz
nmap 'q 'qzz
nmap 'r 'rzz
nmap 's 'szz
nmap 't 'tzz
nmap 'u 'uzz
nmap 'v 'vzz
nmap 'w 'wzz
nmap 'x 'xzz
nmap 'y 'yzz
nmap 'z 'zzz

nmap `a `azz
nmap `b `bzz
nmap `c `czz
nmap `d `dzz
nmap `e `ezz
nmap `f `fzz
nmap `g `gzz
nmap `h `hzz
nmap `i `izz
nmap `j `jzz
nmap `k `kzz
nmap `l `lzz
nmap `m `mzz
nmap `n `nzz
nmap `o `ozz
nmap `p `pzz
nmap `q `qzz
nmap `r `rzz
nmap `s `szz
nmap `t `tzz
nmap `u `uzz
nmap `v `vzz
nmap `w `wzz
nmap `x `xzz
nmap `y `yzz
nmap `z `zzz

nmap <C-o> <C-o>zz
nmap <C-i> <C-i>zz

nmap H Hzz
nmap M Mzz
nmap L Lzz

" Expand three new lines for new paragraph
nnoremap <C-m> ddO

" Clear search highlight
nnoremap <leader><leader> :noh<cr>
" Edit vimrc
nnoremap <leader>ev :e ~/.vim/vimrc<CR>

" Brackets
"inoremap ( ()<Esc>i
"inoremap [ []<Esc>i
"inoremap { {}<Esc>i
"inoremap " ""<Esc>i
"inoremap <localleader>[ [<CR>]<Esc>O
"inoremap <localleader>] [<CR>];<Esc>O
"inoremap <localleader>{ {<CR>}<Esc>O
"inoremap <localleader>} {<CR>};<Esc>O
"inoremap <localleader>) ();<Esc>hi
" Jump outside block:
" http://vim.wikia.com/wiki/Making_Parenthesis_And_Brackets_Handling_Easier
"inoremap <C-j> <Esc>/[)}"'\]> ,]<CR>:nohl<CR>a

" Buffer shortcuts
"nnoremap <leader>f :bn<CR>
" Calling vim-bbye instead of built-in buffer delete
"nnoremap <leader>d :Bdelete<CR>

" Show quickfix window
"nnoremap <leader>qf :cwindow<CR>

