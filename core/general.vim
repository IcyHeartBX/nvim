" Enable true color
if has('termguicolors')
    set termguicolors
endif
" 不生成备份文件
set nobackup
set noswapfile
" 监视文件变化
set autoread
" 设置自动保存
set autowrite
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 设定文件浏览器目录为当前目录
set bsdir=buffer
" 设置编码
if has('vim_starting')
    set encoding=UTF-8
    scriptencoding UTF-8
endif
" 设置显示状态栏
set laststatus=2
" 设置始终显示标签栏
set showtabline=2
" 状态栏中隐藏文件名
set statusline=-
" 设置分割线
" set fillchars=vert:\ 
set fillchars+=vert:\| " add a bar for vertical splits
if get(g:,'gruvbox_transp_bg',1)
    set fcs=eob:\           " hide ~
endif
" 剪切板设置
if has('mac')
    let g:clipboard = {
                \   'name': 'macOS-clipboard',
                \   copy'': {
                \   '+': 'pbcopy',
                \   '*': 'pbcopy',
                \    },
                \   'paste': {
                \   '+': 'pbpaste',
                \   '*': 'pbpaste',
                \   },
                \   'cache_enabled': 0,
                \ }
endif
if has('clipboard')
    set clipboard& clipboard+=unnamedplus
endif

set history=2000
set number
set relativenumber
" 延迟时间设置
set timeout ttimeout
set cmdheight=2          " Height of the command line
set timeoutlen=500
set ttimeoutlen=10
set updatetime=100

" 撤销文件设置
set undofile
set undodir=~/.tmp/undo
" 修复删除键
set backspace=2
set backspace=indent,eol,start

" Tabs and Indents {{{
" ----------------
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set autoindent
set smartindent
set shiftround
"}}}

"允许在有未保存的修改时切换缓冲区
set hidden
" 启动的时候不显示那个援助索马里儿童提示
set shortmess=aFc
" 增加符号列
set signcolumn=yes
" 补全，参考vim-emoji,插入模式补全使用的函数
set completefunc=emoji#complete
" 插入模式使用的选项
set completeopt =longest,menu
set completeopt-=preview
" 设置填充字符
set list
set listchars=tab:»·,nbsp:+,trail:·,extends:→,precedes:←

"=========搜索相关
set ignorecase      " Search ignoring case
set smartcase       " Keep case when searching with *,当有大写字母时，仍然大小写敏感
set incsearch       " Incremental search,实时跟踪搜索
set hlsearch        " Highlight search results
" 设置刚打开文件时的搜索高粱
exec "nohlsearch"
" 自动补全，关键字自动调整大小写
set infercase       " Adjust case in insert completion mode
set wrapscan        " Searches wrap around the end of the file
set showmatch       " Jump to matching bracket
set matchpairs+=<:> " Add HTML brackets to pair matching
set matchtime=1     " Tenths of a second to show the matching paren
set cpoptions-=m    " showmatch will wait 0.5s or until a char is typed
" 设置grep使用的程序
set grepprg=rg\ --vimgrep\ $*
" 如下文件不参与自动补全
set wildignore+=*.so,*~,*/.git/*,*/.svn/*,*/.DS_Store,*/tmp/*

" 设置可隐藏字符
if has('conceal')
    set conceallevel=3 concealcursor=niv " n,i,v模式，当可隐藏字符完成时，隐藏
endif

" 目录设置
set undofile swapfile nobackup
set directory=$DATA_PATH/swap//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set undodir=$DATA_PATH/undo//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set backupdir=$DATA_PATH/backup/,$DATA_PATH,~/tmp,/var/tmp,/tmp
set viewdir=$DATA_PATH/view/
set nospell spellfile=$VIM_PATH/spell/en.utf-8.add

" neovim支持多编辑器共享文件
if has('nvim')
    set shada='300,<50,@100,s10,h
else
    set viminfo=300,<'10,@50,h,n$DATA_PATH/viminfo " vim使用viminfo
endif

" If sudo, disable vim swap/backup/undo/shada/viminfo writing
if $SUDO_USER !=# '' && $USER !=# $SUDO_USER
            \ && $HOME !=# expand('~.$USER')
            \ && $HOME ==# expand('~'.$SUDO_USER)

    set noswapfile
    set nobackup
    set nowritebackup
    set noundofile
    if has('nvim')
        set shada="NONE"
    else
        set viminfo="NONE"
    endif
endif

" Secure sensitive information, disable backup files in temp directories
" 备份文件处理
if exists('&backupskip')
    set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*
    set backupskip+=.vault.vim
endif

" Disable swap/undo/viminfo/shada files in temp directories or shm
augroup MyAutoCmd
    autocmd!
    silent! autocmd BufNewFile,BufReadPre
                \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim
                \ setlocal noswapfile noundofile nobackup nowritebackup viminfo= shada=
augroup END

" 折叠
if has('folding')
    set foldenable
    set foldmethod=syntax
    set foldlevelstart=99
endif
