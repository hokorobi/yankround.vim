function! s:sink(selected) abort
  call setreg('"', a:selected)
  normal! ""p
endfunction

function! s:source()
  return map(copy(g:_yankround_cache), 's:_cache_to_source(v:val)')
endfunction

function! s:_cache_to_source(str)
  let entry = matchlist(a:str, "^\.\\d*\\t\\(.*\\)")
  return entry[1]
endfunction

let s:yankround = {}
let s:yankround.sink = function('s:sink')
let s:yankround.source = function('s:source')

let g:clap#provider#yankround# = s:yankround

