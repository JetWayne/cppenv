""""""""""""""""""""""""""快捷键设置"""""""""""""""""""""""
if has("unix")
    map ;c :e ~/_vimrc<CR>
elseif has("windows")
    map ;c :e $VIM/_vimrc<CR>
endif

" gvim on windows
if !has("unix")
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif

map <F12> :source %:p<CR>
map ;b ^
map ;e $

map ;q :q<CR>
map ;Q :quitall<CR>
map ;w :w<CR>
map ;lw <C-W>l
map ;hw <C-W>h
map ;kw <C-W>k
map ;jw <C-W>j

map ;/ :nohls<CR>
map ; "

let s:relative_nu = 0
func! Toggle_relative_nu()
    if s:relative_nu == 0
        set relativenumber
        let s:relative_nu = 1
    else
        set norelativenumber
        let s:relative_nu = 0
    endif
endfunc
map <F2> :call Toggle_relative_nu()<CR>

map <F8> :! ctags.exe -R<CR><CR>
map TL :Tlist<CR>
map TU :TlistUpdate<CR>

""""""""""""""""""""""""""MyPlugin"""""""""""""""""""""""
map <F11> :e $VIM/vimfiles/autoload/cppenv.vim<CR>


""""""""""""""""""""""""""Make"""""""""""""""""""""""

" python
autocmd BufRead *.py map <F5> :! python %:p<CR><CR>

" C
autocmd BufRead *.c map <F7> :! gcc %:p -o out.exe -g<CR><CR>
autocmd BufRead *.c map <F5> <F7>:! %:p:h/out.exe<CR><CR>

" C++
autocmd BufRead *.cpp map <F7> :! g++ -std=c++11 %:p -o out.exe -g<CR><CR>
autocmd BufRead *.cpp map <F5> <F7>:! %:p:h/out.exe<CR><CR>

"set makeef=compile_error.log
"set makeprg=make.exe
"set shellpipe=


""""""""""""""""""""""""""Style"""""""""""""""""""""""
color evening
filetype on
filetype indent on
filetype plugin on
syntax on
syntax enable
set incsearch
set ignorecase
set nocompatible
set wildmenu
set number
set hlsearch
set nowrap
set nofoldenable
set nobackup
set noswapfile
set autochdir

set expandtab "Tab转换成空格
set tabstop=4
set shiftwidth=4
set softtabstop=4

set gcr=a:block-blinkon0 "禁止光标闪烁
set guioptions-=m
set guioptions-=T
set laststatus=2
set foldmethod=syntax
set guifont=Courier\ New:h12
set fileencodings=utf-8,gbk,utf-16 "可识别文件编码

""""""""""""""""""""""""""Plugin Config"""""""""""""""""""""""

" pathogen
execute pathogen#infect()

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" nerdtree
map <F3> :NERDTreeToggle<CR>

" pydiction python补全插件
let g:pydiction_location = '$VIM/vimfiles/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 9 "自动补全提示列表条目数量

" taglist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

" cppenv
au BufRead *.h,*.hpp,*.inl,*.ipp,*.cpp,*.c execute cppenv#infect()
