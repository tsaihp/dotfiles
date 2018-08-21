version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
let &cpo=s:cpo_save
unlet s:cpo_save
set backspace=indent,eol,start
set history=50
set nomodeline
set ruler
set runtimepath=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after
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
set cursorline

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'editorconfig/editorconfig-vim'
Plugin 'kshenoy/vim-signature'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/taglist.vim'
Plugin 'chazy/cscope_maps'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'aceofall/gtags.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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

if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
    autocmd FileType make setlocal noexpandtab
    autocmd FileType sh setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType vim setlocal ts=4 sts=4 sw=4 expandtab

    " NERDTree
    autocmd VimEnter * 
    \ if exists(":NERDTree") | 
    \   exe "nnoremap <silent> <F5> :NERDTreeToggle<CR>" |
    \ endif

    autocmd VimEnter * 
    \ if exists(":Tlist") | 
    \   let Tlist_Exit_OnlyWindow=1 |
    \   let Tlist_WinWidth=40 | 
    \   let Tlist_Show_One_File=1 |
    \   map <f9> :Tlist<CR> | 
    \ endif

    autocmd BufWritePost * if filereadable("./GTAGS") | silent exe "!global -u" | endif
endif

" gnu global
if filereadable("./GTAGS")
    set cscopetag
    set cscopeprg=gtags-cscope
    let GtagsCscope_Auto_Load = 1
    let GtagsCscope_Auto_Map = 1
    let GtagsCscope_Quiet = 1
    silent exe "!global -u"
endif
