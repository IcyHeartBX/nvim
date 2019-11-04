function! etc#util#source_file(path,...)
    echo "etc#util#Source_file(),path:".a:path
    " 加载用户的配置文件
    let user_global = get(a:000,0,!has('vim_starting'))
    let abspath = resolve(g:etc#vim_path . '/' .a:path)
endfunction

