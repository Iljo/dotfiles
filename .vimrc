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


" ------------
" - Spelling -
" ------------

function s:CustomSpellDirectory() 
    let git_or_home_dir = finddir('.git/..', fnameescape(expand('%:p:h')).';')
    if len(git_or_home_dir) == 0 | let git_or_home_dir = "~" | endif
    let git_or_home_dir = fnamemodify(git_or_home_dir, ':p')

    return git_or_home_dir .. '.spell/vim/'
endfunction
"
" Set spellfile per git project or default to home directory. Function is needed so that spellfile
" option can be set per buffer.
function s:CustomSpellFile()
    let dname = s:CustomSpellDirectory()
    let fname = &spelllang .. '.' .. &enc .. '.add'

    return dname .. fname
endfunction

function s:CreateCustomSpellDir() 
    let dname = s:CustomSpellDirectory()
    if empty(glob(dname))
        call mkdir(dname, "p")
    endif
endfunction

" Caution, don't use comma characters in directory names, as they won't get escaped properly. 
" spellfile variable doesn's support ampersand characters in files path, so try to avoid root git 
" directories with it.
"
" Not gonna automatically create custom spell directory anymore, don't want that directory to always
" be present, for every file it's opened. There is no event that is triggered when spelling is
" activated, or spellfile is missing. So use this command to create needed directory.
command CreateCustomSpellDir call s:CreateCustomSpellDir()

au BufEnter * let &l:spellfile=s:CustomSpellFile()


" ----------------------------------
" - File exploration menu settings -
" ----------------------------------

let g:netrw_banner = 0        " remove directions at top of file listing
let g:netrw_liststyle=3       " tree style listing
let g:netrw_browse_split = 3  " split horizontal
let g:netrw_altv = 1
let g:netrw_winsize=25        " width of window
let g:netrw_preview=1
augroup ProjectDrawer autocmd!  autocmd VimEnter * :Vexplore augroup END


" ---------------
" Customisation -
" ---------------

colorscheme devlight
if $TERMINAL_EMULATOR != "JetBrains-JediTerm" " Maybe read terminal-info for more options
    set colorcolumn=101
endif

set autowrite
set notimeout ttimeout ttimeoutlen=25

" Set autoindent so that list items longer than 2 lines have correct indentation
setlocal ai
setlocal conceallevel=2
setlocal scrolloff=1
setlocal signcolumn=no

" Line numbers
set nu
set rnu

" Wrapping and spaces
setlocal nowrap
setlocal textwidth=100
setlocal whichwrap+=<,>,h,l
setlocal shiftwidth=4
setlocal expandtab  " Use :retab to convert any tab to spaces

" Show invisible characters
set list
set listchars=tab:»_,trail:·

" Use globalstatusline in NeoVim and always use statusline in Vim.
" In order for undercurl to work in Vim, setup termcap entries.
if has("nvim")
    set laststatus=3
else
    set laststatus=2
    let &t_Cs = "\e[4:3m"
    let &t_Ce = "\e[4:0m"
endif

" Fix meta-keys for Vim and Alacritty that doesn't support modifyOtherKeys of level 2. Strangely
" Neovim works quite fine in Alacritty.
if !has("nvim") && &term ==? "alacritty"
    set <M-X>=X
endif

