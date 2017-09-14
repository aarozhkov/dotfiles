set nocompatible               " Be iMproved



call plug#begin('~/.local/share/nvim/plugged')

  Plug 'tpope/vim-sensible' " Sensible defaults 
  Plug 'rstacruz/vim-opinion' " More sensible defaults
  Plug 'ctrlpvim/ctrlp.vim' " Fuzzy-matching go-to file
  Plug 'felikz/ctrlp-py-matcher'
  Plug 'scrooloose/nerdtree'
  Plug 'sjl/badwolf'                " bad wolf colorscheme
"  Plug 'majutsushi/tagbar'                " tagbar
"  Plug 'Rykka/riv.vim'            " support for reStructured Text (sphynx)
"  Plug 'fatih/vim-go'           " Go IDE only support native go tools
"  Plug 'rking/ag.vim'           " vim proxy for ag silver searcher
  Plug 'w0rp/ale'  " Async linter 
  Plug 'tpope/vim-commentary'   " 'gc' to comment 
  Plug 'vim-python/python-syntax'
  Plug 'Vimjas/vim-python-pep8-indent'
  Plug 'davidhalter/jedi-vim'

call plug#end()



"General settings
"
if has("gui")
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions-=m
    set guifont=Consolas:h13
endif


filetype on
filetype plugin on
filetype plugin indent on

set backspace=indent,eol,start
set wildmenu "suggestion menu on tab complite in command typing
set showmatch "hilight matched parenthesis
aunmenu Help.
aunmenu Window.
let no_buffers_menu=1
"set mousemodel=popup
set hidden

syntax on
set number
set ruler
set showmatch "show matched brackets
set nowrap
set laststatus=2
set cul

"Colorscheme
colorscheme badwolf

"Tabulation rules
set autoindent
set smartindent
set textwidth=80
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab

"search
set hlsearch

"Bindings
map <F1> :NERDTreeToggle<CR>


"Plugins

" CtrlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }


"ale
let g:ale_fixers = {} " define before use in next line
let g:ale_fixers.python = ['autopep8']
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0

"jedi-vim
let g:jedi#smart_auto_mappings = 0

"deoplete
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode' 

" Languages
" Python
"let g:python3_host_prog = '/usr/bin/python3'
"let g:python_host_prog = '/usr/bin/python'

"let g:deoplete#sources#jedi#python_path = g:python3_host_prog
