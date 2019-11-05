function! etc#util#source_file(path,...) abort
    echo "etc#util#Source_file(),path:".a:path
    " 加载用户的配置文件
    let user_global = get(a:000,0,!has('vim_starting'))
    let abspath = resolve(g:etc#vim_path . '/' .a:path)
    if ! user_global
        execute 'source' fnameescape(abspath)
        return
    endif
    let tempfile = tempname()
    let content = map(readfile(abspath),
                \ "substitute(v:val, '^\\W*\\zsset\\ze\\W', 'setglobal', '')")
    try
        call writefile(content, tempfile)
        execute printf('source %s', fnameescape(tempfile))
    finally
        if filereadable(tempfile)
            call delete(tempfile)
        endif
    endtry
endfunction

