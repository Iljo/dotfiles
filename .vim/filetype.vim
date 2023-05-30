if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au! BufRead,BufNewFile *.tex		setfiletype tex
  au! BufRead,BufNewFile *.kt		setfiletype kotlin
  au! BufRead,BufNewFile *.kts		setfiletype kotlin
augroup END

augroup spelling
  au FileType gitcommit setlocal spell
augroup END

augroup shortcuts
  au FileType groff    map <buffer> <M-X> :!groff -mspdf -T pdf % > %:r.pdf <CR>
  
  au FileType markdown map  <buffer> <M-X>      :!pandoc % -V geometry:a4paper --number-sections --top-level-division=chapter --template custom.latex -s -o %:r.tex && lualatex %:r.tex <CR>
  au FileType markdown imap <buffer> <M-X> <Esc>:!pandoc % -V geometry:a4paper --number-sections --top-level-division=chapter --template custom.latex -s -o %:r.tex && lualatex %:r.tex <CR>
  au FileType markdown map  <buffer> <F10>      :!pandoc % -V geometry:a4paper --number-sections --top-level-division=chapter --template custom.latex -s -t latex \| pdflatex --jobname=%:r <CR>
  au FileType markdown imap <buffer> <F10> <ESC>:!pandoc % -V geometry:a4paper --number-sections --top-level-division=chapter --template custom.latex -s -t latex \| pdflatex --jobname=%:r <CR>
augroup END

augroup autoclosefixlists
    au FileType qf nmap <buffer> <cr> <cr>:lcl<cr>
augroup END

