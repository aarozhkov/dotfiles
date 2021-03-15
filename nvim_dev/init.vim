set nocompatible               " Be iMproved

call plug#begin('~/.local/share/nvim/lua_dev')

  Plug 'tpope/vim-sensible' " Sensible defaults
  Plug 'rstacruz/vim-opinion' " More sensible defaults
" Themes
  Plug 'morhetz/gruvbox' 
" Themes end
  Plug 'tpope/vim-fugitive'   " Git Support
  Plug 'airblade/vim-gitgutter' " Per line git diff
  " Plug 'junegunn/fzf', { 'do': './install --bin' }
  " Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-commentary'   " 'gc' to comment 
  Plug 'vim-python/python-syntax'
  Plug 'Vimjas/vim-python-pep8-indent'
  Plug 'preservim/nerdtree'
  Plug 'pedrohdz/vim-yaml-folds'
"  Plug 'ervandew/supertab' " Complete with Tabulation
" Languages
"  Plug 'martinda/Jenkinsfile-vim-syntax'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'hashivim/vim-terraform'
" Nvim build-in LSP support
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'steelsojka/completion-buffers'
  Plug 'nvim-treesitter/completion-treesitter'
call plug#end()




"Bindings
map <F1> :NERDTreeFocus<CR>
tnoremap <Esc> <C-\><C-n>

" Make navigating around splits easier
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Foldig
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" PLUGINS
" -------

" HasiVim/terraform
let g:terraform_align=1
let g:terraform_fold_sections=1

"NERDTree
let g:NERDTreeWinSize=24
let g:NERDTreeMinimalUI=1

" Lightlime
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }"
"
" FZF
" nnoremap <C-p> :Files<Cr>
" nnoremap <Leader>b :Buffers<Cr>
" nnoremap <Leader>t :Tags<Cr>
"


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
" set runtimepath+=~/.config/nvim_dev
lua require('init')

