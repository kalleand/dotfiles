call pathogen#infect()
set nocompatible
filetype plugin indent on
syntax enable
set background=dark
set laststatus=2 " Show own statusline with additional information.
set encoding=utf-8
set t_Co=256
colorscheme zenburn

" To enable :E to default to Explore.
command! E Explore

set nrformats= " Makes <C-a> and <C-x> work on numbers as 001.
set noswapfile " Dont create swapfiles.
set ts=4 sts=4 sw=4 " One tab is 4 spaces.
set number " Shows linenumber.
set mouse=a " Set mouse on always.
set expandtab " Use tabs instead of spaces.
set matchpairs+=<:> " Matches inside tags as well.
set scrolloff=2

" Remap leader and localleader.
let mapleader = ","
let maplocalleader = "\\"

" Timeout mappings after 1 second (default), timeout on specialkeys on 0.1
" second. (Makes <Esc>O not display a capital O for 1 second after keypress)
set timeoutlen=1000 ttimeoutlen=100

set history=100 " Remember 100 moves.
set cursorline " Display which line cursor is currently on.
set list " Show special characters.
set listchars=tab:>\ " Display the tab as "> ".
set hidden " Allow to move away from dirty buffer.
set hlsearch " Display the search match.
set autoindent " Automatically indent when a new line
set smartindent " Smart indenting.
set pastetoggle=<F3> "Toggle paste with <F3>.
set title " Changes title to the buffer open.
set textwidth=80 " breaks after 80'th column.
"set colorcolumn=80 " Shows the 80'th column.
set showbreak=… " Show breaks by displaying this character first in the line.
set wildmenu " Use wildmenu.
set wildmode=full " Show all the possible outcomes.
set nospell
set smartcase " Search using smartcase.
set viewoptions=cursor,folds

set showmode " Show which mode is currently used.
set statusline=\|%<\ %{mode()}\ \|
set statusline+=\ %F%=\ %l:%c\ \|
set statusline+=\ %p%%\ \|
set statusline+=\ %{&filetype}\ \|
set statusline+=\ %{&fileformat}\ \|
set statusline+=\ %{&fileencoding}\ \|

" We do not want any help. Not needed as <Esc> is now rebound to Caps.
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

" Toggles highlighting of a search.
map <leader><space> :set hls!<CR>

" Clipboard yanking and pasting.
nmap <leader>y "+y
vmap <leader>y "+y
nmap <leader>p "+p

" Folding (zz == center line in buffer).
set foldlevelstart=99
nmap <Space> zazz
vmap <Space> zazz
nmap <leader>o zRzz
nmap <leader>O zMzz
set foldmethod=syntax
" Folding look.
"highlight Folded ctermfg=yellow ctermbg=black

" Keeps search matches centered and unfold the current line.
nmap n nzzzv
nmap N Nzzzv

" Go to matching bracket.
nmap <leader>m %

" Remove trailing spaces.
map <silent> <leader>w :let _s=@/<cr>:%s/\s\+$//e<cr>:let @/=_s<cr>

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

" Taglist
nmap <C-t> :TlistToggle<CR>
let Tlist_Inc_Winwidth=0

" Make views when closing and show view when open file.
au BufWritePost,BufLeave,WinLeave ?* mkview
au BufWinEnter ?* silent! loadview

" Syntastic options.
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options = ' -std=c++11'

" YouCompleteMe specific options
nmap <F5> :YcmForceCompileAndDiagnostics<CR>
let g:ycm_complete_in_comments = 1
let g:ycm_global_ycm_extra_conf = '/home/kaan/.ycm_extra-conf.py'
let g:ycm_confirm_extra_conf = 0

" Ultisnips options.
let g:UltiSnipsExpandTrigger="^^"
let g:UltiSnipsJumpForwardTrigger="^^"

