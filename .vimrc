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
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
" map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" inoremap <C-U> <C-G>u<C-U>

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

" ---------------------------------------------------------------------------
" Customisation
" ---------------------------------------------------------------------------
" Filetype dection by extension is in ~/.vim/filetype.vim

colorscheme origpablomod
set autowrite
set shiftwidth=4
set notimeout ttimeout ttimeoutlen=25
set nowrap
if $TERM != "xterm-256color" 
    set cursorline
    set colorcolumn=101
endif

" file exploration menu settings
let g:netrw_banner = 0        " remove directions at top of file listing
let g:netrw_liststyle=3       " tree style listing
let g:netrw_browse_split = 3  " split horizontal
let g:netrw_altv = 1
let g:netrw_winsize=25        " width of window
let g:netrw_preview=1
augroup ProjectDrawer autocmd!  autocmd VimEnter * :Vexplore augroup END

" Mappings
" TODO Make different mappings of the same file based on the extension
" Old Groff mappings
" map <M-X> :!groff -mspdf -T pdf % > %:r.pdf <CR>
" imap Ø    <Esc> :!groff -mspdf -T pdf % > %:r.pdf <CR>
map <M-X>    :!pandoc % -V geometry:a4paper --number-sections --top-level-division=chapter --template custom.latex -s -o %:r.tex && lualatex %:r.tex <CR>
imap Ø <Esc> :!pandoc % -V geometry:a4paper --number-sections --top-level-division=chapter --template custom.latex -s -o %:r.tex && lualatex %:r.tex <CR>
map <F10>        :!pandoc % -V geometry:a4paper --number-sections --top-level-division=chapter --template custom.latex -s -t latex \| pdflatex --jobname=%:r <CR>
imap <F10> <ESC> :!pandoc % -V geometry:a4paper --number-sections --top-level-division=chapter --template custom.latex -s -t latex \| pdflatex --jobname=%:r <CR>

" Set autoindent so that list items longer than 2 lines have forrect
" indentation
set ai

" TODO Doesn't work on correctly. Maybe it's xterm or font? In alacritty it works,
" but is it because it can modify the font?
" Strange because  printf "\e[3mfoo\e[23m" prints itallic font
" But neovim in xterm works good with this
set conceallevel=2

" TODO Headding 1 and 2 are not correctly formatted without this one. Why doesnt it work
" when set in vimrc, only when executed directly. Maybe after this vimrc is
" executed, vim executes it's own thing depending on the filetype.
set comments+=n:==,n:--

" Line numbers
set nu
set rnu

" Wrapping 
set nowrap
set textwidth=100
set whichwrap+=<,>,h,l

" TODO kotlin?
let g:markdown_fenced_languages=['java']

" Show invisible characters
set list
set listchars=tab:»_,trail:·

