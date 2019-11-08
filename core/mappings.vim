" 命令模式快捷键
" command line alias
"cnoremap w!! w !sudo tee % >/dev/null
cnoremap <C-p> <Up>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
cnoremap <C-t> <C-R>=expand("%:p:h") . "/" <CR>

" Write buffer (save)
noremap <Leader>w :w<CR>
imap <C-S> <esc>:w<CR>
imap <C-Q> <esc>:wq<CR>


" buffer
nnoremap  ]b :bp<CR>
nnoremap  [b :bn<CR>
nnoremap  <C-x> :bd<CR>

" 分屏
" 分屏的快捷键
nnoremap <LEADER>sl :set splitright<CR>:vsplit<CR>
nnoremap <LEADER>sh :set nosplitright<CR>:vsplit<CR>
nnoremap <LEADER>sj :set splitbelow<CR>:split<CR>
nnoremap <LEADER>sk :set nosplitbelow<CR>:split<CR>

" 分屏后光标的切换
"光标移至右窗口
nnoremap <C-l> <C-w>l
"光标移至上窗口
nnoremap <C-k> <C-w>k
"光标移至下窗口
nnoremap <C-j> <C-w>j
"光标移至左窗口
nnoremap <C-h> <C-w>h

"窗口上移
nnoremap <up> :res +5<CR>
"窗口下移
nnoremap <down> :res -5<CR>
"窗口左移
nnoremap <left> :vertical resize-5<CR>
"窗口右移
nnoremap <right> :vertical resize+5<CR>

" 标签
nnoremap <LEADER>te :tabe
nnoremap <LEADER>th :-tabnext<CR>
nnoremap <LEADER>tl :+tabnext<CR>
nnoremap <LEADER>tn :tabnew<CR>
nnoremap <LEADER>tm :tabmove

" 插入一行
inoremap <C-O> <Esc>o

" smart move
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" 复制到光标到行尾
nnoremap Y y$

" 删除当前行尾部的空格
nnoremap <silent> ,<Space> :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>

" Improve scroll, credits: https://github.com/Shougo
nnoremap <expr> zz (winline() == (winheight(0)+1) / 2) ?
	\ 'zt' : (winline() == 1) ? 'zb' : 'zz'
noremap <expr> <C-f> max([winheight(0) - 2, 1])
	\ ."\<C-d>".(line('w$') >= line('$') ? "L" : "M")
noremap <expr> <C-b> max([winheight(0) - 2, 1])
	\ ."\<C-u>".(line('w0') <= 1 ? "H" : "M")
noremap <expr> <C-e> (line("w$") >= line('$') ? "j" : "3\<C-e>")
noremap <expr> <C-y> (line("w0") <= 1         ? "k" : "3\<C-y>")

" 引号快速插入与删除
nnoremap <LEADER>w"  bi"<esc>ea"<esc>
nnoremap <LEADER>w'  bi'<esc>ea'<esc>
nnoremap <LEADER>l"  ^i"<esc>g_a"<esc>
nnoremap <LEADER>l'  ^i'<esc>g_a"<esc>
nnoremap <LEADER>d" ebF"xf"x
nnoremap <LEADER>d' ebF'xf'x
vnoremap w" xa""<esc>hpl
vnoremap w' xa''<esc>hpl

" ===========键位映射==============
nnoremap <LEADER>ev :vsplit $MYVIMRC<CR>
nnoremap <LEADER>sv :source $MYVIMRC<CR>
