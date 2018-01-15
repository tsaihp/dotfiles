version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
let &cpo=s:cpo_save
unlet s:cpo_save
set backspace=indent,eol,start
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set history=50
set nomodeline
set ruler
set runtimepath=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim73,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
" vim: set ft=vim :
set bg=dark
set encoding=utf-8
set hlsearch
set nu
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set cindent

" Tlist
let Tlist_Exit_OnlyWindow=1
" let Tlist_Use_Right_Window=1
let Tlist_WinWidth=40
let Tlist_Show_One_File=1
map <f9> :Tlist<CR>

" miniBufExpl
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1

" Theme
set laststatus=2
set t_Co=256
let g:solarized_termcolors=256
"colorscheme solarized

" NERDTree
nnoremap <silent> <F5> :NERDTreeToggle<CR>

" Unite
"nnoremap <C-p> :Unite -start-insert file<CR>
nnoremap <C-l> :Unite buffer<CR>

" visual mark
"nnoremap <silent> <F9> 

if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
endif
