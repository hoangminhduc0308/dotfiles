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
set hlsearch
set incsearch
set nowrap
set laststatus=2
set encoding=utf-8
set mouse=a
set termguicolors
set updatetime=300
set signcolumn=yes

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"


let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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
Plug 'VundleVim/Vundle.vim'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline-themes'
Plug 'voldikss/vim-floaterm'
Plug 'luochen1990/rainbow'
Plug 'tribela/vim-transparent'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'preservim/nerdtree' 
Plug 'Xuyuanp/nerdtree-git-plugin' 
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
filetype plugin indent on
let g:rainbow_active = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#show_coc_status = 1
let airline#extensions#coc#error_symbol = ' E: '
let airline#extensions#coc#warning_symbol = ' W: '
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
colorscheme OceanicNext
let g:airline_theme='oceanicnext'
"complete
inoremap <buffer> <F9> <ESC>:w <CR> :FloatermNew! g++ -std=c++17 -O2 -Wall -lm -march=native -s -o %:p:r %:p && time %:p:r && echo 'Press any key to continue...'; read -k1 -s && exit<CR>
nnoremap <buffer> <F9> <ESC>:w <CR> :FloatermNew! g++ -std=c++17 -O2 -Wall -lm -march=native -s -o %:p:r %:p && time %:p:r && echo 'Press any key to continue...'; read -k1 -s && exit<CR>

inoremap <buffer> <F5> <ESC>:w<CR> :FloatermNew! time pypy3 %  && echo 'Press any key to continue...'; read -k1 -s && exit<CR>
nnoremap <buffer> <F5> <ESC>:w<CR> :FloatermNew! time pypy3 %  && echo 'Press any key to continue...'; read -k1 -s && exit<CR>

inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"


inoremap <A-Up> <C-w>ki
nnoremap <A-Up> <C-w>k<ESC>

inoremap <A-Left> <C-w>hi
nnoremap <A-Left> <C-w>h<ESC>

inoremap <A-Right> <C-w>li
nnoremap <A-Right> <C-w>l<ESC>

inoremap <A-Down> <C-w>ji
nnoremap <A-Down> <C-w>j<ESC>

inoremap <C-s> <ESC>:w<CR>i
nnoremap <C-s> <ESC>:w<CR><ESC>

inoremap <C-t> <ESC>:tabnew<CR>i
nnoremap <C-t> <ESC>:tabnew<CR><ESC>

inoremap <C-w> <ESC>:tabclose<CR>i
nnoremap <C-w> <ESC>:tabclose<CR><ESC>

inoremap <C-Left> <ESC>:tabprevious<CR>i
nnoremap <C-Left> <ESC>:tabprevious<CR><ESC>

inoremap <C-Right> <ESC>:tabnext<CR>i
nnoremap <C-Right> <ESC>:tabnext<CR><ESC>

inoremap <F8> <ESC>:w <bar> :YcmDiags<CR>
nnoremap <F8> <ESC>:w <bar> :YcmDiags<CR>

inoremap <C-o> <ESC>:open
nnoremap <C-o> <ESC>:open

inoremap <C-k><C-t> <ESC>:colorscheme 
nnoremap <C-k><C-t> <ESC>:colorscheme 

inoremap <C-n> <ESC>:NERDTreeToggle<CR>
nnoremap <C-n> <ESC>:NERDTreeToggle<CR>

