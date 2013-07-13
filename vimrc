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

" Would like this to be lower. However, easymotion with its
" <leader><leader><motion> hinders this. (Unless you are really fast!)
set timeoutlen=500

set history=100
set cursorline
set list
set listchars=tab:>\
set hidden
set hlsearch
set autoindent
set smartindent
set pastetoggle=<F3>
set title " Changes title to the buffer open.
set textwidth=80 " breaks after 80'th column.
"set colorcolumn=80 " Shows the 80'th column.
set showbreak=…
set wildmenu
set wildmode=full
"set nospell
set smartcase

set showmode
set statusline=\|%<\ %{mode()}\ \|
set statusline+=\ %F%=\ %l:%c\ \|
set statusline+=\ %p%%\ \|
set statusline+=\ %{&filetype}\ \|
set statusline+=\ %{&fileformat}\ \|
set statusline+=\ %{&fileencoding}\ \|

imap <F1> <ESC>
vmap <F1> <ESC>
nmap <F1> <ESC>

" Try to emulate English keyboard layout.
nmap ö :
vmap ö :
nmap Ö :
vmap Ö :

" Command line history.
cmap <C-p> <Up>
cmap <C-d> <Down>

" Removes the highlighting after a search.
map <leader><space> :set hls!<CR>

" Clipboard yanking and pasting.
nmap <leader>y "+y
vmap <leader>y "+y
nmap <leader>p "+p

" Folding
set foldlevelstart=99
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

" Dont use the arrowkeys
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>

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

let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options = ' -std=c++11'

" YouCompleteMe specific options
nmap <F5> :YcmForceCompileAndDiagnostics<CR>
let g:ycm_complete_in_comments = 1
let g:ycm_global_ycm_extra_conf = '/home/kaan/.ycm_extra-conf.py'
let g:ycm_confirm_extra_conf = 0

let g:UltiSnipsExpandTrigger="<c-j>"
