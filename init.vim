syntax on
set number
set splitright
set splitbelow
set wildmenu
set nocompatible
set tabstop=4
set softtabstop=4
set autoindent
set shiftwidth=4
set expandtab
set incsearch
set nowrap
set laststatus=2
set encoding=utf-8
set cursorline
filetype plugin indent on
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
let g:nvcode_termcolors=256
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif
call plug#begin()
Plug 'voldikss/vim-floaterm'
Plug 'luochen1990/rainbow'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'RRethy/base16-nvim'
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'nvim-tree/nvim-web-devicons'

Plug 'voldikss/vim-floaterm'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'Zeioth/dooku.nvim'
Plug 'xiyaowong/transparent.nvim'
Plug 'yamatsum/nvim-cursorline'
Plug 'RRethy/vim-illuminate'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'gelguy/wilder.nvim'

Plug 'bluz71/vim-nightfly-colors', { 'as': 'nightfly' }
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
Plug 'folke/tokyonight.nvim'
Plug 'comfysage/evergarden'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/everforest'
call plug#end()

let g:rainbow_active = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#show_coc_status = 1
let airline#extensions#coc#error_symbol = ' E: '
let airline#extensions#coc#warning_symbol = ' W: '

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" configure treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
highlight = {
enable = true,              -- false will disable the whole extension
disable = {},  -- list of language that will be disabled
},
}
require("nvim-treesitter.install").prefer_git = true
EOF

lua << END
require('lualine').setup()
END

" .vimrc
" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction
colorscheme base16-gruvbox-dark-medium


inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
"complete
inoremap <F9> <ESC>:w <CR> :FloatermNew c++  -o %:p:r %:p && time %:p:r && bash ~/ins.sh<CR>
nnoremap <F9> <ESC>:w <CR> :FloatermNew c++  -o %:p:r %:p && time %:p:r && bash ~/ins.sh<CR>
inoremap <F5> <ESC>:w <CR> :FloatermNew time pypy3 %:p && bash ~/ins.sh<CR>
nnoremap <F5> <ESC>:w <CR> :FloatermNew time pypy3 %:p && bash ~/ins.sh<CR>

inoremap <C-Up> <C-w>ki
nnoremap <C-Up> <C-w>k<ESC>

inoremap <C-Left> <C-w>hi
nnoremap <C-Left> <C-w>h<ESC>

inoremap <C-Right> <C-w>li
nnoremap <C-Right> <C-w>l<ESC>

inoremap <C-Down> <C-w>ji
nnoremap <C-Down> <C-w>j<ESC>

inoremap <C-s> <ESC>:w<CR>i
nnoremap <C-s> <ESC>:w<CR><ESC>

inoremap <C-t> <ESC>:tabnew<CR>i
nnoremap <C-t> <ESC>:tabnew<CR><ESC>

inoremap <C-w> <ESC>:tabclose<CR>i
nnoremap <C-w> <ESC>:tabclose<CR><ESC>

inoremap <A-Left> <ESC>:tabprevious<CR>i
nnoremap <A-Left> <ESC>:tabprevious<CR><ESC>

inoremap <A-Right> <ESC>:tabnext<CR>i
nnoremap <A-Right> <ESC>:tabnext<CR><ESC>

inoremap <C-a> <ESC>ggvG

inoremap <F8> <ESC>:w <bar> :CocDiagnostics<CR><C-Up>
nnoremap <F8> <ESC>:w <bar> :CocDiagnostics<CR><C-Up>

inoremap <C-o> <ESC>:open
nnoremap <C-o> <ESC>:open

inoremap <C-k><C-t> <ESC>:colorscheme 
nnoremap <C-k><C-t> <ESC>:colorscheme 
