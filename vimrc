call pathogen#infect()
set nocompatible
filetype plugin indent on
syntax enable
set background=dark
set laststatus=2 " Shows powerline.
set encoding=utf-8
set t_Co=256 " CRUCIAL for solarized to look good with tmux.
colorscheme zenburn

set noswapfile
set ts=4 sts=4 sw=4
set number
set mouse=a
set expandtab

let mapleader = ","
let maplocalleader = "\\"

set list
set listchars=tab:>\ 
set hlsearch
set autoindent
set pastetoggle=<F3>
set title " Changes title to the buffer open.

inoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap <F1> <ESC>

nnoremap å [
nnoremap ä ]
nnoremap ö :

" Indenting made easier!
" This keeps the indented area selected.
vnoremap > >gv
vnoremap < <gv
" Use tab for indenting when not in insert mode.
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Removes the highlighting after a seach.
noremap <leader><space> :set hls!<CR>

" Folding
set foldlevelstart=1
nnoremap <Space> zazz
vnoremap <Space> zazz
nnoremap <leader>o zRzz
nnoremap <leader>c zMzz
set foldmethod=syntax
" Folding look.
"highlight Folded ctermfg=yellow ctermbg=black

" Keeps search matches centered.
nnoremap n nzzzv
nnoremap N Nzzzv

" Go to matching bracket.
nnoremap <leader>m %

" Remove trailing spaces.
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<cr>

" Faster moving.
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>

"Bind control-c to escape
inoremap <C-c> <esc>
vnoremap <C-c> <esc>

" Terminal-like behaviour on C-a and C-e
nnoremap <C-a> <Home>
inoremap <C-a> <Home>
vnoremap <C-a> <Home>
nnoremap <C-e> <End>
inoremap <C-e> <End>
vnoremap <C-e> <End>


"Split line
nnoremap S i<cr><esc><right>

" Same as V but go to end of line.
nnoremap vv ^vg_

" Get normal behaviour of arrow keys when using tmux.
if &term =~ '^screen'
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" Nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>
" Close Nerdtree if it is the only one open.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Open Nerdtree automatically if no file was specified.
autocmd vimenter * if !argc() | NERDTree | endif

" Taglist
nnoremap <C-t> :TlistToggle<CR>
let Tlist_Inc_Winwidth=0

au BufWinLeave * mkview
if argc()
    au BufWinEnter * silent loadview
endif

let g:Powerline_symbols = 'fancy'
" let g:Powerline_colorscheme='solarized16'
let g:Powerline_colorscheme='zenburn'

let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_mode_map = { 'mode': 'passive'}
