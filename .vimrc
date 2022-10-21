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
set termguicolors
filetype plugin indent on
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

Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline-themes'
Plug 'voldikss/vim-floaterm'
Plug 'luochen1990/rainbow'
Plug 'tribela/vim-transparent'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'ycm-core/YouCompleteMe'
Plug 'cohama/lexima.vim'
Plug 'noscript/codeblocks-dark.vim'
Plug 'vim-scripts/DoxygenToolkit.vim'
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

colorscheme codeblocks-dark
let g:airline_theme='gotham256'
autocmd FileType cpp inoremap <buffer> <F9> <ESC>:w <CR> :!c++ -o %:r %<CR> <ESC> :FloatermNew time ./%< && ~/ins.sh<CR>
autocmd FileType cpp nnoremap <buffer> <F9> <ESC>:w <CR> :!c++ -o %:r %<CR> <ESC> :FloatermNew time ./%< && ~/ins.sh<CR>

autocmd FileType python inoremap <buffer> <F5> <ESC>:w <bar> :FloatermNew time  % && ~/ins.sh<CR>
autocmd FileType python nnoremap <buffer> <F5> <ESC>:w <bar> :FloatermNew time  % && ~/ins.sh<CR>

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
