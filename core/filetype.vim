augroup MyAutoCmd

    	" Reload vim config automatically
    autocmd BufWritePost $VIM_PATH/{*.vim,*.yaml,vimrc} nested
		\ source $MYVIMRC | redraw

	autocmd WinEnter,InsertLeave * set cursorline

	autocmd WinLeave,InsertEnter * set nocursorline

    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

	autocmd Syntax * if 5000 < line('$') | syntax sync minlines=200 | endif

    autocmd FileType css setlocal equalprg=csstidy\ -\ --silent=true

    autocmd BufWritePre *.js,*.jsx,*.less,*.css,*.html Neoformat

    autocmd FileType json syntax match Comment +\/\/.\+$+

    " Go (Google)
    autocmd FileType go let b:coc_pairs_disabled = ['<']

    " set filetypes as typescript && tsx
    autocmd BufNewFile,BufRead *.ts  set filetype=typescript
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

    " HTML (.gohtml and .tpl for server side)
    autocmd BufNewFile,BufRead *.html,*.htm,*.gohtml,*.tpl  setf html
    " Magit
     autocmd User VimagitEnterCommit startinsert

	" https://webpack.github.io/docs/webpack-dev-server.html#working-with-editors-ides-supporting-safe-write
	autocmd FileType css,javascript,jsx,javascript.jsx setlocal backupcopy=yes

    " 自动插入文件头
    autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"

augroup END
" 自动插入文件头
" 新建.c,.h,.sh,.java文件，自动插入文件头
function! SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\#########################################################################")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: pix")
        call append(line(".")+2, "\# mail: tpxsky@163.com")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\#########################################################################")
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "    > Author: pix")
        call append(line(".")+2, "    > Mail: tpxsky@163.com ")
        call append(line(".")+3, "    > Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc

