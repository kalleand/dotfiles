call pathogen#infect()
set nocompatible
filetype plugin indent on
syntax enable
set background=dark
set laststatus=2
set encoding=utf-8
set t_Co=256
colorscheme zenburn

set nrformats=
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

imap <F1> <ESC>
vmap <F1> <ESC>
nmap <F1> <ESC>

" Try to emulate english keyboard layout.
nmap å [
nmap ä ]
vmap å [
vmap ä ]
nmap Å {
nmap Ä }
vmap Å {
vmap Ä }
nmap ö :
vmap ö :

" Commandline history.
cmap <C-p> <Up>
cmap <C-d> <Down>

" Removes the highlighting after a seach.
map <leader><space> :set hls!<CR>

" Folding
set foldlevelstart=1
nmap <Space> zazz
vmap <Space> zazz
nmap <leader>o zRzz
nmap <leader>O zMzz
set foldmethod=syntax
" Folding look.
"highlight Folded ctermfg=yellow ctermbg=black

" Keeps search matches centered.
nmap n nzzzv
nmap N Nzzzv

" Go to matching bracket.
nmap <leader>m %

" Remove trailing spaces.
nmap <leader>w :%s/\s\+$//<cr>:let @/=''<cr>

" Faster moving.
nmap <C-j> <C-d>
nmap <C-k> <C-u>

" tabs
nmap <leader>t :tabnext<cr>
nmap <leader>l :tablast<cr>
nmap <leader>f :tabfirst<cr>
nmap <leader>n :tabnew<cr>

"Split line
nmap <leader>s i<cr><esc>

" Same as V but go to end of line.
nmap vv ^vg_

" Get normal behaviour of arrow keys when using tmux.
if &term =~ '^screen'
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" Nerdtree
nmap <C-n> :NERDTreeToggle<CR>
" Close Nerdtree if it is the only one open.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Open Nerdtree automatically if no file was specified.
autocmd vimenter * if !argc() | NERDTree | endif

" Taglist
nmap <C-t> :TlistToggle<CR>
let Tlist_Inc_Winwidth=0

au BufWinLeave * mkview
if argc()
    au BufWinEnter * silent loadview
endif

let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_mode_map = { 'mode': 'passive'}
