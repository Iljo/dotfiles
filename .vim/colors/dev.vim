
" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "dev"

hi StatusLine   ctermfg=15   ctermbg=8    cterm=bold
hi ColorColumn               ctermbg=0
hi LineNrAbove  ctermfg=7    ctermbg=0    cterm=italic
hi LineNr       ctermfg=none ctermbg=8    cterm=italic
hi LineNrBelow  ctermfg=7    ctermbg=0    cterm=italic
hi CursorLine                ctermbg=8    cterm=none
hi CursorLineNr ctermfg=15   ctermbg=8    cterm=italic

hi Comment      ctermfg=7                 cterm=italic
hi Title        ctermfg=13

hi markdownCode              ctermbg=0
hi markdownCodeBlockBg       ctermbg=0

" After highlight clearing, define colors that don't have highlighting.
if exists("syntax_on")
  syntax enable
endif
