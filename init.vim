let g:python_host_prog='/usr/bin/python3'

set nocompatible
"配置backspace键工作方式
set backspace=indent,eol,start
"设置历史记录条数
set history=100
set nobackup
set nohlsearch
set noswapfile
"设置匹配模式 类似当输入一个左括号时会匹配相应的那个右括号
set showmatch
set autoindent
set cindent
set hidden
set number
set ruler
set showcmd
"开启语法高亮功能
syntax enable
syntax on
"设置在Vim中可以使用鼠标 防止在Linux终端下无法拷贝
set mouse=a
"Tab=2
set tabstop=2
set shiftwidth=2
"2 space = 1 tab
set softtabstop=2
set smarttab
"make tab as space,use [Ctrl + V + Tab] to add tab
set expandtab
"default encoding
set encoding=utf-8
"automatic test encoding
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set autochdir
set tags=tags;
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" use dash to open doc :gk
let g:investigate_use_dash=1
" add some filetype support
au BufNewFile,BufRead *.es6 set filetype=javascript
au BufNewFile,BufRead *.mst set filetype=html
au BufNewFile,BufRead *.dot set filetype=html
autocmd FileType vue syntax sync fromstart
" autocmd BufRead,BufNewFile *.vue setlocal filetype=javascript.vue

set foldmethod=syntax
set nofoldenable
filetype off

call plug#begin("~/.nvim/bundle")

Plug 'sjbach/lusty'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/Mark'
Plug 'tpope/vim-fugitive'
Plug 'sbdchd/neoformat'
Plug 'prettier/vim-prettier'
Plug 'Raimondi/delimitMate'
Plug 'rking/ag.vim'
" Plug 'Shougo/neocomplete.vim'
" Snippets
Plug 'honza/vim-snippets'
" go
" Plug 'fatih/vim-go'
" python
Plug 'klen/python-mode'
" gui
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'flazz/vim-colorschemes'
Plug 'ervandew/supertab'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'myusuf3/numbers.vim'
" Plug 'scrooloose/nerdtree.git'
Plug 'scrooloose/nerdtree' 
"Plug 'Xuyuanp/nerdtree-git-Plug'
" html
Plug 'vim-scripts/xml.vim'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'cakebaker/scss-syntax.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'posva/vim-vue'
Plug 'mxw/vim-jsx'
Plug 'digitaltoad/vim-pug'
" Docker
Plug 'ekalinin/Dockerfile.vim'
Plug 'diepm/vim-rest-console'
Plug 'easymotion/vim-easymotion'
Plug 'vim-syntastic/syntastic'
Plug 'sekel/vim-vue-syntastic'
call plug#end()

let g:neocomplete#enable_at_startup = 1
let g:neoformat_enabled_vue = ['prettier']

let g:prettier#config#single_quote = 'true'
let g:prettier#config#semi = 'false'
let g:prettier#config#trailing_comma = 'none'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
        \ "mode": "active",
        \ "active_filetypes": ["ruby", "php"],
        \ "passive_filetypes": ["vue","javascript"] }

let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
    let local_eslint = getcwd() . "/" . local_eslint
endif
if executable(local_eslint)
    let g:syntastic_javascript_eslint_exec = local_eslint
    let g:syntastic_vue_eslint_exec = local_eslint
endif
" UI
if !exists("g:vimrc_loaded")
    colorscheme molokai
    let g:molokai_original = 1
    if has("gui_running")
        set guioptions-=T "隐藏工具栏
        set guioptions-=L
        set guioptions-=r
        set guioptions-=m
        set gfn=Inconsolata\ 16
        set gfw=STHeiti\ 16
        set langmenu=en_US
        set linespace=0
        colorscheme molokai
      if has('mac')
        set transparency=7
        set gfn=Monaco\ 16
      endif
    else
      colorscheme badwolf
    endif
endif 

set so=10
syntax on
filetype on
filetype plugin on
filetype indent on

" AirLine settings
let g:airline_detect_modified=1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '>>'
let g:airline_right_sep = '«'
let g:airline_right_sep = '<<'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='bubblegum'



let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_enable_domhtmlcss = 1

let g:numbers_exclude = ['tagbar', 'minibufexpl', 'nerdtree']

let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

set cursorline
set cursorcolumn

let g:jsx_ext_required = 1

" Key Maps
" leader key
let mapleader = ","
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"My maps
nmap <C-o> :TagbarToggle<CR>
nmap <F8> :LustyFilesystemExplorerFromHere<CR>
nmap <F9> :NERDTreeToggle<CR>
" map <C-l> :tabn<cr>             "下一个tab
" map <C-h> :tabp<cr>             "上一个tab
" map <C-n> :tabnew<cr>           "新tab
map <C-k> :bn<cr>               "下一个文件
map <C-j> :bp<cr>               "上一个文件
map <Leader>fs :LustyFilesystemExplorerFromHere<CR>
map <Leader>tb :TagbarToggle<CR>
map <Leader>newt :tabnew<CR>
map <Leader>buff :LustyBufferExplorer<CR>
" map <Leader>ff :Autoformat<CR><CR>
map <Leader>ff :Neoformat<CR><CR>
map <Leader>fjs :Neoformat! javascript standard<CR><CR>
map <Leader>fjp :Neoformat! javascript jsbeautify<CR><CR>
map <Leader>fpug :Neoformat! jade<CR><CR>
map <Leader>fscss :Neoformat! scss<CR><CR>
map <Leader>t :NERDTreeToggle<CR>
imap <C-c> <CR><Esc>O
nmap <silent> <leader>da <Plug>DashGlobalSearch
map <Leader>bn :bNext<CR>
map <Leader>bb :bprevious<CR>
map <Leader>bw :bdelete<CR>
map <Leader>fh :Neoformat! html<CR>
map <Leader>fc :Neoformat! css prettier<CR>

fu! FormatVue(...)
  " execute '/<script>/+1,/<\/script>/-1 Neoformat! javascript standard'
  execute '/<template>/+1,/<\/template>/-1 Neoformat! html'
  execute 'SyntasticCheck'
  " execute '/<template lang="pug">/+1,/<\/template>/-1 !pug-beautifier -s 2 --stdin'
endfunction

augroup vimrc
  au FileType vue         noremap  <buffer> <leader>ff :execute FormatVue()<CR>
  au FileType javascript.jsx  noremap  <buffer> <leader>ff :Prettier<CR>
  au FileType json        noremap  <buffer> <leader>ff :Prettier<CR>
  au FileType css         noremap  <buffer> <leader>ff :Prettier<CR>
  au FileType scss        noremap  <buffer> <leader>ff :Prettier<CR>
  " au FileType vue         noremap  <buffer> <leader>ff :Prettier<CR>
augroup END

fu! Splitme(...)
  execute 'sp'
  execute 'vsp'
  execute 'wincmd j'
  execute 'vsp'
endfunction

map <Leader>pp :execute Splitme()<CR>
