""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File: .vimrc
" Author: Stephen Hamer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible    " Use vim defaults
filetype on         " Enable file type detection
filetype plugin on  " Load filetype plugin
set history=50      " Have fifty lines of command-line history
set mouse=a         " Have the mouse enabled all the time
set fileformats="unix,dos,mac"
set backspace=2     " Backspace over insert start
set hidden          " Can hide buffers without closing them
set printoptions=left:8pc,right:3pc  " printing options (pc = percent of page)
"set nomodeline      " Don't let mode lines in files over ride this .vimrc
set tagrelative     " Make paths in tag files relative to location of the tag file
set title           " Set term titles

" Write a file as root using :W
command W w !sudo tee % > /dev/null

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase      " Ignore case when searching
set smartcase       " Use case sensitive searching if there is mixed case
set incsearch       " Start searching when typing starts

set completeopt+=longest

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files/Backups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup             " don't make backup file
set directory=~/tmp,/tmp " swap files get stored in tmp
" remember all of these between sessions, but only 10 search terms; also
" remember info for 10 files, but never any on removable disks, don't remember
" marks in files, don't rehighlight old search patterns, and only save up to
" 100 lines of registers;
set viminfo=/10,'10,r.git/COMMIT_EDITMSG,r/mnt/zip,r/mnt/floppy,f0,h,\"100

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set tabstop=8       " Width of a tab character
"set softtabstop=2   " Number of spaces inserted when tab is pressed
"set shiftwidth=2    " Number of spaces in an indent
"set expandtab       " Expand tabs into spaces
"set nowrap          " Don't wrap long lines
set sidescroll=10   " Scroll 10 characters over when move off the screen

if has("gui_running")
  set lines=30 columns=100  " Set default size of GUI window
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd
set ruler           " Show position of the cursor in the status line
set laststatus=2    " Display the status on the last two lines of the window
set nohls           " Don't highlight searches
set novisualbell    " Don't blink
set noerrorbells    " No noises
set showmatch       " Show matching brackets
set mat=3           " Number of thenths of a second to blink match for
set nonu            " Don't show line numbers
set nolist          " Don't show end of line and tab characters
"set showbreak=$     " Use '$' for long line wrapping character
syntax on           " Turn syntax hilighting on
set listchars=tab:>-,trail:.,eol:$ " Show trailing spaces when listing

set foldmethod=marker " use {{{, }}} to denote folds in files

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin autoload with pathogen
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use Pathogen to load bundles
call pathogen#runtime_append_all_bundles()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File specific options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" puppet manifest files
au BufRead,BufNewFile *.pp set filetype=puppet
autocmd FileType puppet set shiftwidth=4 softtabstop=4 tabstop=8 expandtab

au BufRead,BufNewFile *.proto set filetype=proto
autocmd FileType proto set shiftwidth=2 softtabstop=2 tabstop=8 expandtab

au BufRead,BufNewFile *.soy set filetype=soy
autocmd FileType soy set shiftwidth=2 softtabstop=2 tabstop=8 expandtab

au BufRead,BufNewFile *.go set filetype=go
autocmd FileType go set shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType go set smartindent
set rtp+=/usr/share/go/misc/vim

" Git commit messages
autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit

" for both CSS and HTML, use genuine tab characters for indentation, to make
" files a few bytes smaller
autocmd FileType html,css set noexpandtab tabstop=8

" for CSS have things in braces indented
autocmd FileType css set smartindent

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
autocmd FileType make set noexpandtab shiftwidth=8

" for C-like programming, have automatic indentation
" use indentation of 4 spaces, expand tabs
autocmd FileType c,cpp,slang set cindent shiftwidth=4 softtabstop=4 tabstop=8 expandtab
autocmd FileType cs set cindent shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType java set cindent shiftwidth=4 softtabstop=4 tabstop=8 expandtab
autocmd FileType php set cindent shiftwidth=2 softtabstop=2 tabstop=8 expandtab

" for perl have things in braces indent themselves
autocmd FileType perl set smartindent

autocmd FileType yacc set noexpandtab shiftwidth=8 tabstop=8
autocmd FileType lex set noexpandtab shiftwidth=8 tabstop=8

" for assembly use full tabs
au BufRead,BufNewFile *.asm   setfiletype asm
autocmd FileType asm set noexpandtab softtabstop=8 shiftwidth=8 tabstop=8
autocmd FileType asm set syn="asm68k"

" for javascript
autocmd FileType javascript set cindent shiftwidth=2 softtabstop=2 tabstop=8 textwidth=120 expandtab

" Highlight the word ALPHA
syn match alphaFlag "\<ALPHA\>"
autocmd BufWinEnter * syn match alphaFlag "\<ALPHA\>"
hi def link alphaFlag Todo

" for python auto indent with 4 space tabs
autocmd FileType python set shiftwidth=4 softtabstop=4 textwidth=120 fo-=t expandtab
autocmd FileType python set smartindent nocindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"autocmd FileType python let ropevim_vim_completion=1
"autocmd FileType python source /usr/share/vim/vimfiles/after/ftplugin/python/pyflakes.vim
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType python set omnifunc=pysmell#Complete

"autocmd FileType python set complete+=k~/.vim/scripts/pydiction-0.5/pydiction


" for VHDL use 2 spaces for tabs and auto indent
autocmd FileType vhdl set shiftwidth=2 softtabstop=2
autocmd FileType vhdl set smarttab expandtab autoindent

source ~/.vim/scripts/gnupg.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map! <S-Enter> <Esc>

" Use ctrl+c for copy and ctrl+v for paste
" vmap <C-c> "+y
" vmap <C-x> "+c
" vmap <C-v> c<ESC>"+p
" imap <C-v> <ESC>"+pa
" map <C-v> "+p

" Fixes backspace problem
if &term == "xterm-color"
	set t_kb=
	fixdel
endif


" NERD Tree
map <F2> :NERDTreeToggle<cr>
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$']

" toggle line number, relative line numbering, off
map <F3> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

" Display buffer list and switch to another buffer
map <F6> :ls<Return>:b

" Display tab and end of line characters
map <F7> :set list!<Return>

" Turn spell checking on
map <F9> :setlocal spell! spelllang=en_us<Return>

" Switch to next buffer (ctrl + right arrow)
map <C-Right> :bnext<Return>

" Switch to previous buffer (ctrl + left arrow)
map <C-Left> :bpre<Return>

" Faster scrolling with ctrl+e, ctrl+y, 3 lines at a time
nnoremap <C-e> <C-e><C-e><C-e>
nnoremap <C-y> <C-y><C-y><C-y>

" Fuzzy Finder shortcut
nnoremap <C-t> :<C-u>FufFile **/<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors/Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set background=dark " use a dark background
colorscheme slate
set guifont=Bitstream\ Vera\ Sans\ Mono\ 8
"set guifont=Lucida_Sans_Typewrite:h8:cANSI

"force color in terminals
if &term =~ "xterm"
	if has("terminfo")
		set t_Co=8
		set t_Sf=[3%p1%dm
		set t_Sb=[4%p1%dm
	else
		set t_Co=8
		set t_Sf=[3%dm
		set t_Sb=[4%dm
	endif
endif

" Highlight trailing whitespace
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
highlight ExtraWhitespace ctermbg=red guibg=red
