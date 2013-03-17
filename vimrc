call pathogen#infect()
set nocompatible
filetype plugin indent on
syntax enable
set background=light
set laststatus=2 " Shows powerline.
set encoding=utf-8
set t_Co=16 " CRUCIAL for solarized to look good with tmux.

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
set title " Changes title to the buffer open.


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
set foldlevelstart=0
nnoremap <Space> zazz
vnoremap <Space> zazz
nnoremap <leader>o zRzz
nnoremap <leader>c zMzz
set foldmethod=indent
" Folding look.
highlight Folded ctermfg=yellow ctermbg=black

" Keeps search matches centered.
nnoremap n nzzzv
nnoremap N Nzzzv

" Go to matching bracket.
nnoremap <leader>m %

" Remove trailing spaces.
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<cr>

"Change case
nnoremap <C-u> gUiw
inoremap <C-u> <esc>gUiw

"Split line
nnoremap S i<cr><esc><right>
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
let g:Powerline_colorscheme='solarized16'
