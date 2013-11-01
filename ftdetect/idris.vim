au BufNewFile,BufRead *.idr call a:start()

function! a:start()
  if executable('idris')
    try
      call vimproc#socket_open('localhost', 4294)
    catch c
      call vimproc#popen2(['idris', '--quiet'])
    endtry
  else
    echohl ErrorMsg
    echo 'Idris not found.'
    echohl None
  endif
  setf idris
endfunction
