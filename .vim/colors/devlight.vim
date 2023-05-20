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
hi SignColumn                ctermfg=none  ctermbg=none  cterm=none

hi Pmenu                     ctermfg=0     ctermbg=13    cterm=none

hi Comment                   ctermfg=8     ctermbg=none  cterm=italic
hi Todo                      ctermfg=15    ctermbg=4     cterm=none
hi Title                     ctermfg=5     ctermbg=none  cterm=none
hi Statement                 ctermfg=3     ctermbg=none  cterm=none
hi Special                   ctermfg=4     ctermbg=none  cterm=none
hi Search                    ctermfg=16    ctermbg=220   cterm=none
hi Underlined                ctermfg=6     ctermbg=none  cterm=underline

hi SpellBad                  ctermfg=none  ctermbg=none  cterm=undercurl  guisp=#D700F7

hi DiagnosticHint            ctermfg=8
hi DiagnosticOk              ctermfg=2
hi DiagnosticUnderlineError                              cterm=undercurl
hi DiagnosticUnderlineWarn                               cterm=undercurl
hi DiagnosticUnderlineInfo                               cterm=undercurl  guisp=#0087D7
hi DiagnosticUnderlineHint                               cterm=undercurl
hi DiagnosticUnderlineOk                                 cterm=undercurl
hi DiagnosticSignError       ctermfg=8     ctermbg=9
hi DiagnosticSignWarn        ctermfg=8     ctermbg=11
hi DiagnosticSignInfo        ctermfg=8     ctermbg=12
hi DiagnosticSignHint        ctermfg=8     ctermbg=7
hi DiagnosticSignOk          ctermfg=8     ctermbg=10

hi markdownCode              ctermfg=none  ctermbg=15    cterm=none
hi markdownCodeBlockBg       ctermfg=none  ctermbg=15    cterm=none

sign define DiagnosticSignError  text=E  texthl=DiagnosticSignError  numhl=DiagnosticSignError
sign define DiagnosticSignWarn   text=W  texthl=DiagnosticSignWarn   numhl=DiagnosticSignWarn
sign define DiagnosticSignInfo   text=I  texthl=DiagnosticSignInfo   numhl=DiagnosticSignInfo
sign define DiagnosticSignHint   text=H  texthl=DiagnosticSignHint   numhl=DiagnosticSignHint
sign define DiagnosticSignOk     text=O  texthl=DiagnosticSignOk     numhl=DiagnosticSignOk

" After highlight clearing, define colors that don't have highlighting.
if exists("syntax_on")
  syntax enable
endif
