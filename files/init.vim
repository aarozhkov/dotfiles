set nocompatible               " Be iMproved



call plug#begin('~/.local/share/nvim/deoplete')

  Plug 'tpope/vim-sensible' " Sensible defaults
  Plug 'rstacruz/vim-opinion' " More sensible defaults
" Themes
  Plug 'morhetz/gruvbox' " colorscheme solarized
  Plug 'joshdick/onedark.vim' " colorscheme solarized
" Themes end
  Plug 'tpope/vim-fugitive'   " Git Support
  Plug 'airblade/vim-gitgutter' " Per line git diff
  Plug 'dense-analysis/ale'
  Plug 'junegunn/fzf', { 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-commentary'   " 'gc' to comment 
  Plug 'itchyny/lightline.vim'
  Plug 'shinchu/lightline-gruvbox.vim'
  Plug 'vim-python/python-syntax'
  Plug 'Vimjas/vim-python-pep8-indent'
  Plug 'preservim/nerdtree'
  " Deoplete is only for completion
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-jedi'
  Plug 'ervandew/supertab' " Complete with Tabulation
  Plug 'davidhalter/jedi-vim' " JEDI for Python IDE
" Languages
  Plug 'hashivim/vim-terraform'
  Plug 'martinda/Jenkinsfile-vim-syntax'
call plug#end()



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
set noshowmode "custome line duplicate mode indication

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
set textwidth=120
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#363949'

"search
set hlsearch
set incsearch
set lazyredraw
set magic

"Bindings
map <F1> :NERDTreeFocus<CR>
tnoremap <Esc> <C-\><C-n>

" Make navigating around splits easier
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" PLUGINS
" -------

" Supertab
" Cant understand reason
let g:SuperTabDefaultCompletionType = "<c-n>"


"ale
let g:ale_fixers = {} " define before use in next line
let g:ale_linters = {} " define before use in next line
let g:ale_fixers.python = ['yapf', 'autopep8', 'isort']
let g:ale_linters.python = ['flake8', 'pylint', 'mypy']
let g:ale_set_signs = 1
let g:ale_set_highlights = 0
let g:ale_virtualenv_dir_names = []
"let g:ale_python_pylint_change_directory=0
let g:ale_python_flake8_change_directory=0
let g:ale_fixers.go = ['go', 'govet', 'gometalinter']

let g:ale_fix_on_save = 1
let g:ale_echo_msg_format = '[%linter%]%code%: %s [%severity%]'
let g:ale_python_flake8_options = '--ignore E501'

"highlight clear ALEErrorSign
"highlight clear ALEWarningSign
highlight ALEErrorSign ctermfg=196 guifg=#e73c50 ctermbg=NONE guibg=NONE gui=NONE guisp=NONE term=reverse
highlight ALEWarningSign ctermfg=Yellow guifg=Yellow ctermbg=NONE guibg=NONE gui=NONE guisp=NONE term=reverse
let g:ale_sign_error = '●'
let g:ale_sign_warning = '●'

"NERDTree
" let g:NERDTreeWinSize=24
" let g:NERDTreeMinimalUI=1

" Lightlime
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }"
"
" FZF
nnoremap <C-p> :Files<Cr>
nnoremap <Leader>b :Buffers<Cr>
nnoremap <Leader>t :Tags<Cr>


"jedi-vim
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:python_highlight_class_vars = 1
let g:python_highlight_string_formatting = 1
let g:python_highlight_string_format = 1

" Deoplete
let g:deoplete#enable_at_startup = 1
" For macos brew formulae python located in /usr/local/bin
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

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
