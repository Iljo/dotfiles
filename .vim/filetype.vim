" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.tex		setfiletype tex
  au! BufRead,BufNewFile *.kt		setfiletype kotlin
  au! BufRead,BufNewFile *.kts		setfiletype kotlin
augroup END
