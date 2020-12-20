set nocompatible               " Be iMproved

call plug#begin('~/.local/share/nvim/deoplete')

  Plug 'tpope/vim-sensible' " Sensible defaults
  Plug 'rstacruz/vim-opinion' " More sensible defaults
" Themes
  Plug 'lifepillar/vim-gruvbox8' " colorscheme solarized
" Themes end
  Plug 'tpope/vim-fugitive'   " Git Support
  Plug 'airblade/vim-gitgutter' " Per line git diff
  Plug 'junegunn/fzf', { 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-commentary'   " 'gc' to comment 
  Plug 'vim-python/python-syntax'
  Plug 'Vimjas/vim-python-pep8-indent'
  Plug 'preservim/nerdtree'
"  Plug 'ervandew/supertab' " Complete with Tabulation
" Languages
"  Plug 'martinda/Jenkinsfile-vim-syntax'
  Plug 'hashivim/vim-terraform'
" Nvim build-in LSP support
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-treesitter/nvim-treesitter'
call plug#end()




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

" HasiVim/terraform
let g:terraform_align=1
let g:terraform_fold_sections=1

""ale
"let g:ale_fixers = {} " define before use in next line
"let g:ale_linters = {} " define before use in next line
"let g:ale_fixers.python = ['yapf', 'autopep8', 'isort']
"let g:ale_linters.python = ['flake8', 'pylint', 'mypy']
"let g:ale_set_signs = 1
"let g:ale_set_highlights = 0
"let g:ale_virtualenv_dir_names = []
""let g:ale_python_pylint_change_directory=0
"let g:ale_python_flake8_change_directory=0
"let g:ale_fixers.go = ['go', 'govet', 'gometalinter']

"let g:ale_fix_on_save = 1
"let g:ale_echo_msg_format = '[%linter%]%code%: %s [%severity%]'
"let g:ale_python_flake8_options = '--ignore E501'

""highlight clear ALEErrorSign
""highlight clear ALEWarningSign
"highlight ALEErrorSign ctermfg=196 guifg=#e73c50 ctermbg=NONE guibg=NONE gui=NONE guisp=NONE term=reverse
"highlight ALEWarningSign ctermfg=Yellow guifg=Yellow ctermbg=NONE guibg=NONE gui=NONE guisp=NONE term=reverse
"let g:ale_sign_error = '●'
"let g:ale_sign_warning = '●'

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

"---------------
"Custom funtions
"---------------
function! FormatJSON()
  :%!python -m json.tool
endfunction

"----- Build-in LSP
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)
set completeopt=menuone,noinsert,noselect
set runtimepath+=~/.config/nvim_dev
lua require('init')
