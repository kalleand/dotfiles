call pathogen#infect()
set nocompatible
filetype plugin indent on
syntax enable
set background=dark
set laststatus=2
set encoding=utf-8
set t_Co=256
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
set textwidth=80 " breaks after 80'th column
set showbreak=…
set wildmenu
set wildmode=full

set showmode
set statusline=%<\ %{mode()}\ \|\ %F%=\ %l:%c\ \|\ %p%%\ \|\ %{&filetype}\ \|\ %{&fileformat}\ \|\ %{&fileencoding}\ 

inoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap <F1> <ESC>

" Try to emulate english keyboard layout.
nnoremap å [
nnoremap ä ]
vnoremap å [
vnoremap ä ]
nnoremap Å {
nnoremap Ä }
vnoremap Å {
vnoremap Ä }
nnoremap ö :
vnoremap ö :

" Indenting made easier!
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >
vnoremap <S-Tab> <

" Removes the highlighting after a seach.
noremap <leader><space> :set hls!<CR>

" Folding
set foldlevelstart=1
nnoremap <Space> zazz
vnoremap <Space> zazz
nnoremap <leader>o zRzz
nnoremap <leader>O zMzz
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

" tabs
nnoremap <leader>t :tabnext<cr>
nnoremap <leader>l :tablast<cr>
nnoremap <leader>f :tabfirst<cr>
nnoremap <leader>n :tabnew<cr>


" Terminal-like behaviour on C-a and C-e
nnoremap <C-a> <Home>
inoremap <C-a> <Home>
vnoremap <C-a> <Home>
nnoremap <C-e> <End>
inoremap <C-e> <End>
vnoremap <C-e> <End> 

"Split line
nnoremap <leader>s i<cr><esc>

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

"let g:Powerline_symbols = 'fancy'
"let g:Powerline_colorscheme='solarized16'
"let g:Powerline_colorscheme='zenburn'

let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_mode_map = { 'mode': 'passive'}
