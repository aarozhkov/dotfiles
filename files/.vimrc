set nocompatible               " Be iMproved



call plug#begin('~/.local/share/nvim/plugged')

  Plug 'tpope/vim-sensible' " Sensible defaults
  Plug 'rstacruz/vim-opinion' " More sensible defaults
  Plug 'ctrlpvim/ctrlp.vim' " Fuzzy-matching go-to file TODO make binding for ctrlp for buffers
  Plug 'jeetsukumaran/vim-buffergator'
  Plug 'scrooloose/nerdtree'
"  Plug 'sjl/badwolf'                " bad wolf colorscheme
"  Plug 'skielbasa/vim-material-monokai' " colorscheme
"  Plug 'altercation/vim-colors-solarized' " colorscheme solarized
"  Plug 'nanotech/jellybeans.vim' " colorscheme solarized
  Plug 'morhetz/gruvbox' " colorscheme solarized
"  Plug 'tyrannicaltoucan/vim-quantum' " colorscheme solarized
"  Plug 'dracula/vim' " colorscheme solarized
"  Plug 'ciaranm/inkpot' " colorscheme solarized
"  Plug 'kristijanhusak/vim-hybrid-material' " colorscheme solarized
  Plug 'rking/ag.vim'           " vim proxy for ag silver searcher
  Plug 'tpope/vim-fugitive'   " Git Support
  Plug 'airblade/vim-gitgutter' " Per line git diff
  Plug 'w0rp/ale'  " Async linter 
  Plug 'majutsushi/tagbar' " module class struct

"  Plug 'tpope/vim-commentary'   " 'gc' to comment 
  Plug 'vim-python/python-syntax'
  Plug 'Vimjas/vim-python-pep8-indent'
  Plug 'davidhalter/jedi-vim'
  Plug 'fatih/vim-go'
    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
      Plug 'zchee/deoplete-jedi'
    else
      Plug 'Shougo/neocomplete.vim'
    endif
  Plug 'felikz/ctrlp-py-matcher'
  let g:ctrlp_show_hidden = 1
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
  Plug 'dyng/ctrlsf.vim' " TODO: made bindings for that plug
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  let g:airline_left_sep=''
  let g:airline_right_sep=''
  let g:airline_theme='tomorrow'
  " Explicitly specify which extensions to use
  let g:airline_extensions = ['branch', 'ctrlp', 'tabline', 'ale', 'whitespace']
call plug#end()

"TODO: check https://github.com/sloria/dotfiles/blob/master/roles/vim/files/vimrc


"General settings
"

"Colorscheme
set termguicolors
set background=dark
let g:airline_theme='gruvbox'
colorscheme gruvbox
let g:gruvbox_italic = '1'


if has("gui_running")
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions-=m
    "set guifont=Noto\ Sans\ Mono\ 11
    set guifont=Inconsolata\ 13
    set background=dark
    "colorscheme material-monokai
    "let g:airline_solarized_bg='dark'
    set clipboard=unnamed
    set clipboard=unnamedplus
endif

set clipboard=unnamed
set clipboard=unnamedplus

filetype on
filetype plugin on
filetype plugin indent on
set encoding=utf8

set backspace=indent,eol,start
set wildmenu "suggestion menu on tab complite in command typing
set showmatch "hilight matched parenthesis
aunmenu Help.
aunmenu Window.
set cursorline
"let no_buffers_menu=1
"set mousemodel=popup
set hidden

if has('mouse')
  set mouse=a
endif

syntax on
set number
set ruler
set showmatch "show matched brackets
set nowrap
set laststatus=2
set cul
set foldmethod=manual


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
set incsearch
set lazyredraw
set magic

"Bindings
map <F1> :NERDTreeToggle<CR>

" Make navigating around splits easier
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"ale
let g:ale_fixers = {} " define before use in next line
let g:ale_linters = {} " define before use in next line
let g:ale_fixers.python = ['yapf', 'autopep8', 'isort']
let g:ale_linters.python = ['flake8', 'pylint']
let g:ale_set_signs = 1
let g:ale_set_highlights = 0
"let g:ale_fixers.go = ['go', 'govet', 'gometalinter']

let g:ale_fix_on_save = 1
let g:ale_echo_msg_format = '[%linter%]%code%: %s [%severity%]'
let g:ale_python_flake8_options = '--ignore E501'

"highlight clear ALEErrorSign
"highlight clear ALEWarningSign
highlight ALEErrorSign ctermfg=196 guifg=#e73c50 ctermbg=NONE guibg=NONE gui=NONE guisp=NONE term=reverse
highlight ALEWarningSign ctermfg=Yellow guifg=Yellow ctermbg=NONE guibg=NONE gui=NONE guisp=NONE term=reverse
let g:ale_sign_error = '●'
let g:ale_sign_warning = '●'

"jedi-vim
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:python_highlight_class_vars = 1
let g:python_highlight_string_formatting = 1
let g:python_highlight_string_format = 1

if has("nvim")
    let g:deoplete#enable_at_startup = 1
    let g:python3_host_prog = '/home/donor/.config/nvim/venv/bin/python3'
else
    "NeoComplete
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    if !exists('g:neocomplete#force_omni_input_patterns')
      let g:neocomplete#force_omni_input_patterns = {}
    endif
    let g:neocomplete#force_omni_input_patterns.go = '[^.[:digit:] *\t]\.'
endif

"Vim-go
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports" "Explicited the formater plugin (gofmt, goimports, goreturn...)
" Show a list of interfaces which is implemented by the type under your cursor
"au FileType go nmap <Leader>s <Plug>(go-implements)
"
"" Show type info for the word under your cursor
"au FileType go nmap <Leader>i <Plug>(go-info)
"
"" Open the relevant Godoc for the word under the cursor
"au FileType go nmap <Leader>gd <Plug>(go-doc)
"au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
"
"" Open the Godoc in browser
"au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
"
"" Run/build/test/coverage
"au FileType go nmap <leader>r <Plug>(go-run)
"au FileType go nmap <leader>b <Plug>(go-build)
"au FileType go nmap <leader>t <Plug>(go-test)
"au FileType go nmap <leader>c <Plug>(go-coverage)

" By default syntax-highlighting for Functions, Methods and Structs is disabled.
" Let's enable them!
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1


"---------------
"Custom funtions
"---------------
function! FormatJSON()
  :%!python -m json.tool
endfunction

"------------------------------------------------------------------------------
" Syntastic
"------------------------------------------------------------------------------
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_aggregate_errors = 1
"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_go_checkers = ['go', 'golint', 'govet']


"Completor
"let g:completor_gocode_binary = $GOPATH.'/bin/gocode'
"let g:completor_python_binary = '/usr/bin/python'

"-------------------------
"Some hacks
"-------------------------
"Make diff in runned vim
" Create vsplits with files to be diffed
" :windo :diffthis
" When done with diff :windo :diffoff
" For git commit diff use figutive pluging
