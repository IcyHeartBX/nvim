let g:etc#package_manager = get(g:,'etc#package_manager','dein')
let g:etc#vim_path =
    \ get(g:, 'etc#vimpath',
        \   exists('*stdpath') ? stdpath('config') :
        \   ! empty($MYVIMRC) ? fnamemodify(expand($MYVIMRC), ':h') :
        \   ! empty($VIMCONFIG) ? expand($VIMCONFIG) :
        \   ! empty($VIMCONFIG) ? expand($VIMCONFIG) :
        \   ! empty($VIM_PATH) ? expand($VIM_PATH) :
        \   expand('$HOME/.vim')
        \ )

" 初始化操作
function! etc#init()
    if empty(g:etc#package_manager) || g:etc#package_manager ==# 'nore'
        return
    endif
    
endfunction

