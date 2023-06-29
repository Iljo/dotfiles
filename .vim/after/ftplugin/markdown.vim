" Markdown code block background that works on the fenced languages also.
" Took the code fromt the following sources.
" https://vi.stackexchange.com/questions/25781/how-to-change-background-color-for-markdowns-fenced-code-blocks
" https://www.reddit.com/r/vim/comments/fob3sg/different_background_color_for_markdown_code/

function! MarkdownBlocks() abort " {{{1
  " setlocal signcolumn=no

  sign define codeblock linehl=markdownCodeBlockBg

  augroup code_block_background
    autocmd! * <buffer>
    autocmd InsertLeave  <buffer> call s:place_signs()
    autocmd BufEnter     <buffer> call s:place_signs()
    autocmd BufWritePost <buffer> call s:place_signs()
  augroup END
endfunction

function! s:place_signs()
  let l:continue = 0
  let l:file = expand('%')

  execute 'sign unplace * file=' . l:file

  for l:lnum in range(1, line('$'))
    let l:line = getline(l:lnum)
    if l:continue || l:line =~# '^\s*```'
      execute printf('sign place %d line=%d name=codeblock file=%s',
            \ l:lnum, l:lnum, l:file)
    endif

    let l:continue = l:continue
          \ ? l:line !~# '^\s*```$'
          \ : l:line =~# '^\s*```'
  endfor
endfunction

call MarkdownBlocks()

" Setup formatter
setlocal formatprg=mdformat\ --number\ --wrap\ 100\ -

let g:markdown_fenced_languages=['java', 'kotlin', 'sh', 'bash', 'vim', 'output']

