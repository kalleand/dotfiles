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
set matchpairs+=<:>

let mapleader = ","
let maplocalleader = "\\"

set history=100
set list
set listchars=tab:>\ 
set hidden
set hlsearch
set autoindent
set smartindent
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

" tabs
"nmap <leader>t :tabnext<cr> " use gt / gT instead.
nmap <leader>l :tablast<cr>
nmap <leader>f :tabfirst<cr>
nmap <leader>n :tabnew<cr>

"Split line
nmap <leader>s i<cr><esc>

" Visual mode of entire line.
nmap vv ^vg_

" Nerdtree
nmap <C-n> :NERDTreeToggle<CR>
" Close Nerdtree if it is the only one open.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Open Nerdtree automatically if no file was specified.
autocmd VimEnter * if !argc() | NERDTree | endif

" Taglist
nmap <C-t> :TlistToggle<CR>
let Tlist_Inc_Winwidth=0


au BufWritePost,BufLeave,WinLeave ?* mkview
au BufWinEnter ?* silent! loadview
"autocmd BufWinEnter * if argc() | silent! loadview | endif
"autocmd BufWinLeave * if argc() | mkview | endif
"if argc()
"    au WinLeave * mkview
"    au WinEnter * silent loadview
"endif

let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_mode_map = { 'mode': 'passive'}
