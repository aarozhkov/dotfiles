if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
"set runtimepath+=/home/donor/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
"if dein#load_state('/home/donor/.vim/bundle')
"  call dein#begin('/home/donor/.vim/bundle')
"
"  " Let dein manage dein
"  " Required:
"  call dein#add('/home/donor/.vim/bundle/repos/github.com/Shougo/dein.vim')
"
"  " Add or remove your plugins here:
"  "call dein#add('Shougo/neosnippet.vim')
"  "call dein#add('Shougo/neosnippet-snippets')
"
"  "My plugins
"  call dein#add('scrooloose/nerdtree')
"  call dein#add('sjl/badwolf')                " bad wolf colorscheme
"  call dein#add('majutsushi/tagbar')                " tagbar
""  call dein#add('dagwieers/asciidoc-vim')     " asciidoc syntax
"  call dein#add('Rykka/riv.vim')            " support for reStructured Text (sphynx)
"  call dein#add('fatih/vim-go')           " Go IDE only support native go tools
"  call dein#add('Shougo/unite.vim')           " fuzzy search/jump to buffers files lines
"  call dein#add('rking/ag.vim')           " vim proxy for ag silver searcher
"  call dein#add('Shougo/vimproc.vim', {'build': 'make'})           " fuzzy search/jump to buffers files lines
"  call dein#add('davidhalter/jedi-vim', {'lazy': 1, 'on_ft': ['python', 'cython', 'pyrex']})
""  call dein#add('nvie/vim-flake8')      " Python linter
""  call dein#add('vim-syntastic/syntastic')      " Python linter
"  call dein#add('w0rp/ale')  " Async linter 
""  call dein#add('tell-k/vim-autopep8')
"
"  if has('nvim')
"    call dein#add('Shougo/deoplete.nvim')
"    call dein#add('zchee/deoplete-jedi')
"    call dein#add('zchee/deoplete-go', { 'build': 'make' })
"  endif
"
"  " Required:
"  call dein#end()
"  call dein#save_state()
"endif

" Autoinstall Plug pluginmanager {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

  Plug 'scrooloose/nerdtree'
  Plug 'sjl/badwolf'                " bad wolf colorscheme
  Plug 'majutsushi/tagbar'                " tagbar
"  call dein#add('dagwieers/asciidoc-vim')     " asciidoc syntax
  Plug 'Rykka/riv.vim'            " support for reStructured Text (sphynx)
"  Plug 'fatih/vim-go'           " Go IDE only support native go tools
  Plug 'Shougo/unite.vim'           " fuzzy search/jump to buffers files lines
  Plug 'rking/ag.vim'           " vim proxy for ag silver searcher
  Plug 'Shougo/vimproc.vim', {'build': 'make'}           " fuzzy search/jump to buffers files lines
"  Plug 'davidhalter/jedi-vim', {'lazy': 1, 'on_ft': ['python', 'cython', 'pyrex']}
  Plug 'nvie/vim-flake8'      " Python linter
"  call dein#add('vim-syntastic/syntastic')      " Python linter
  Plug 'w0rp/ale'  " Async linter 
"  call dein#add('tell-k/vim-autopep8')
  Plug 'Shougo/deoplete.nvim'
  Plug 'zchee/deoplete-jedi'
"  call dein#add('zchee/deoplete-go', { 'build': 'make' })


call plug#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
"

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
"deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode' 

" Languages
" Python
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python'

let g:deoplete#sources#jedi#python_path = g:python3_host_prog


" EMC btilogs

au BufRead *btilog* setfiletype btilog
au BufRead *btifc* setfiletype messages
