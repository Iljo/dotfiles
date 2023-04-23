set background=light

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "devlight"

hi StatusLine                ctermfg=0     ctermbg=7     cterm=bold
hi ColorColumn               ctermfg=none  ctermbg=15    cterm=none
hi LineNrAbove               ctermfg=8     ctermbg=15    cterm=italic
hi LineNr                    ctermfg=0     ctermbg=7     cterm=italic
hi LineNrBelow               ctermfg=8     ctermbg=15    cterm=italic
hi CursorColumn              ctermfg=none  ctermbg=15    cterm=none
hi CursorLine                ctermfg=none  ctermbg=15    cterm=none
hi CursorLineNr              ctermfg=0     ctermbg=7     cterm=italic

hi Pmenu                     ctermfg=0     ctermbg=13    cterm=none

hi Comment                   ctermfg=8     ctermbg=none  cterm=italic
hi Todo                      ctermfg=15    ctermbg=4     cterm=none
hi Title                     ctermfg=5     ctermbg=none  cterm=none
hi Statement                 ctermfg=3     ctermbg=none  cterm=none
hi Special                   ctermfg=4     ctermbg=none  cterm=none
hi Search                    ctermfg=16    ctermbg=220   cterm=none
hi Underlined                ctermfg=6     ctermbg=none  cterm=underline

hi DiagnosticHint            ctermfg=8
hi DiagnosticOk              ctermfg=2
hi DiagnosticUnderlineError                              cterm=undercurl
hi DiagnosticUnderlineWarn                               cterm=undercurl
hi DiagnosticUnderlineInfo                               cterm=undercurl  guisp=#0087D7
hi DiagnosticUnderlineHint                               cterm=undercurl
hi DiagnosticUnderlineOk                                 cterm=undercurl

hi markdownCode              ctermfg=none  ctermbg=15    cterm=none
hi markdownCodeBlockBg       ctermfg=none  ctermbg=15    cterm=none

" After highlight clearing, define colors that don't have highlighting.
if exists("syntax_on")
  syntax enable
endif
