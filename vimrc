set nocompatible

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Plugins.
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'taglist.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'kovisoft/slimv'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'Shougo/vimproc.vim', {
        \   'build' : {
        \       'unix' : 'make -f make_unix.mak',
        \   },
        \}
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tommcdo/vim-exchange'
NeoBundle 'rking/ag.vim'
NeoBundle 'LaTeX-Box-Team/LaTeX-Box'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'itchyny/calendar.vim'
NeoBundle 'tomasr/molokai'

filetype plugin indent on

NeoBundleCheck

syntax enable
set background=dark
set laststatus=2 " Show own statusline with additional information.
set encoding=utf-8
set t_Co=256

colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1

" To enable :E to default to Explore.
command! E Explore

set nrformats= " Makes <C-a> and <C-x> work on numbers as 001.
set noswapfile " Dont create swapfiles.
set ts=4 sts=4 sw=4 " One tab is 4 spaces.
set number " Shows linenumber.
set mouse=nv " Do not use mouse in insert mode.
set expandtab " Use tabs instead of spaces.
set matchpairs+=<:> " Matches inside tags as well.
set scrolloff=3
set sidescrolloff=5

" Remap leader and localleader.
let mapleader = ","
let maplocalleader = "\\"

" Timeout mappings after 1 second (default), timeout on specialkeys on 0.1
" second. (Makes <Esc>O not display a capital O for 1 second after keypress)
set timeoutlen=1000 ttimeoutlen=100

set history=1000 " Remember 1000 moves.
set cursorline " Display which line cursor is currently on.
set list " Show special characters.
set listchars=tab:>\ ,trail:·" Display the tab as "> ".
set hidden " Allow to move away from dirty buffer.
set hlsearch " Display the search match.
set autoindent " Automatically indent when a new line
set smartindent " Smart indenting.
set pastetoggle=<F3> "Toggle paste with <F3>.
set title " Changes title to the buffer open.
set textwidth=80 " breaks after 80'th column.
set colorcolumn=80 " Shows the 80'th column.
set showbreak=… " Show breaks by displaying this character first in the line.
set wildmenu " Use wildmenu.
set wildmode=longest:full " Show all the possible outcomes.
set nospell
set ignorecase " Ignores case when searchin.
set smartcase " Search using smartcase.
set viewoptions=cursor,folds
set nojoinspaces " Only one space after a period when joining lines.
set incsearch
set splitbelow
set splitright

set showmode " Show which mode is currently used. 
set statusline=\|%<\ %{mode()}\ \|
set statusline+=\ %F%=\ %l:%c\ \|
set statusline+=\ %p%%\ \|
set statusline+=\ %{&filetype}\ \|
set statusline+=\ %{&fileformat}\ \|
set statusline+=\ %{&fileencoding}\ \|

" Edit this file with :Vimrc
command! Vimrc e ~/.vimrc

" We do not want any help. Not needed as <Esc> is now rebound to Caps.
imap <F1> <ESC>
vmap <F1> <ESC>
nmap <F1> <ESC>

" Try to emulate English keyboard layout.
nmap ö :
vmap ö :
nmap Ö :
vmap Ö :

" We do not want Ex mode
nmap Q <Nop>

" Command line history.
cmap <C-p> <Up>
cmap <C-d> <Down>

" Toggles highlighting of a search.
map <leader><space> :set hls!<CR>

" Clipboard yanking and pasting.
nmap <leader>y "+y
vmap <leader>y "+y
nmap <leader>p "+p

" Clear entire line but dont remove it (normal cl is quivalent of s)
nnoremap cl 0"_d$

" Folding (zz == center line in buffer).
set foldlevelstart=99
nmap <Space> zazz
vmap <Space> zazz
nmap <leader>o zRzz
nmap <leader>O zMzz
set foldmethod=syntax
" Folding look.
"highlight Folded ctermfg=yellow ctermbg=black

highlight SignColumn ctermbg=black

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
map <Up> <C-w>+
map <Down> <C-w>-
map <Left> <C-w><
map <Right> <C-w>>

"Split line
nmap <leader>s i<cr><esc>

" Visual mode of entire line.
nmap vv 0vg$

" Taglist
nmap <C-t> :TlistToggle<CR>
let Tlist_Inc_Winwidth=0

" Syntastic options.
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options = ' -std=c++11'

"let g:slimv_repl_split=4
let g:slimv_ctags="/usr/bin/ctags -a --language-force=lisp *.lisp"

" Calendar settings.
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" LatexBox
"let g:LatexBox_latexmk_async = 1
let g:LatexBox_latexmk_preview_continuously = 1
let g:LatexBox_viewer = "xdg-open"
" Automatically build the document.
"au BufWinEnter *.tex silent! Latexmk

" Prevent lagg from gitgutter
let g:gitgutter_realtime = 0

let g:EclimCompletionMethod = 'omnifunc'

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" Eclim mappings
autocmd FileType java call SetJavaMappings()

function! SetJavaMappings()
    nmap <leader>jf :JavaFormat<CR>
    nmap <leader>jd :JavaDelegate<CR>
    nmap <leader>jo :JavaImportOrganize<CR>
    nmap <leader>ji :JavaImpl<CR>
    nmap <leader>jg :JavaGet<CR>
    nmap <leader>js :JavaSet<CR>
    nmap <leader>jj :Java 
    nmap <leader>ju :JUnit<CR>
endfunction
