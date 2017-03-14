set nocompatible

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))

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
NeoBundle 'https://bitbucket.org/kovisoft/slimv'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'Shougo/vimproc.vim', {
        \   'build' : {
        \       'unix' : 'make -f make_unix.mak',
        \   },
        \}
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'tommcdo/vim-exchange'
NeoBundle 'rking/ag.vim'
NeoBundle 'LaTeX-Box-Team/LaTeX-Box'
NeoBundle 'mtth/scratch.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'shime/vim-livedown'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'alessandroyorba/despacio'


call neobundle#end()

filetype plugin indent on

NeoBundleCheck

syntax enable
set background=dark
set laststatus=2 " Show own statusline with additional information.
set encoding=utf-8
set t_Co=256

colorscheme despacio

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
set lazyredraw

" Remap leader and localleader.
let mapleader = ","
let maplocalleader = "\\"

" Timeout mappings after 1 second (default), timeout on specialkeys on 0.1
" second. (Makes <Esc>O not display a capital O for 1 second after keypress)
set timeoutlen=1000 ttimeoutlen=100

set history=1000 " Remember 1000 moves.
"set cursorline " Display which line cursor is currently on.
set list " Show special characters.
set listchars=tab:>\ ,trail:·" Display the tab as "> ".
set hidden " Allow to move away from dirty buffer.
set hlsearch " Display the search match.
set autoindent " Automatically indent when a new line
set smartindent " Smart indenting.
set pastetoggle=<F3> "Toggle paste with <F3>.
set title " Changes title to the buffer open.
set textwidth=0 " no brakes!
"set colorcolumn=80 " Shows the 80'th column.
set showbreak=… " Show breaks by displaying this character first in the line.
set wildmenu " Use wildmenu.
set wildmode=longest:full " Show all the possible outcomes.
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set nospell
set ignorecase " Ignores case when searchin.
set smartcase " Search using smartcase.
set viewoptions=cursor,folds
set nojoinspaces " Only one space after a period when joining lines.
set incsearch
"set splitbelow
set splitright
"set complete+=k

set showmode " Show which mode is currently used.
set statusline=\|%<\ %{mode()}\ \|
set statusline+=\ %F%=\ %l:%c\ \|
"set statusline+=\ %{noscrollbar#statusline()}
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
map <leader>n :set hls!<CR>

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

" Open scratch window
nmap <leader>S :Scratch<cr>

" Dont use the arrowkeys
map <Up> <C-w>+
map <Down> <C-w>-
map <Left> <C-w><
map <Right> <C-w>>

" Visual mode of entire line.
nmap vv 0vg$

nmap <leader><Space> :set hlsearch!<CR>
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
let g:LatexBox_viewer = "evince"
" Automatically build the document.
"au BufWinEnter *.tex silent! Latexmk

" Prevent lagg from gitgutter
let g:gitgutter_realtime = 0
let g:scratch_insert_autohide = 0
"
" YCM config
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_extra_conf_globlist = ['~/*']

let g:UltiSnipsExpandTrigger = "<leader>s"
let g:UltiSnipsJumpForwardTrigger = "<leader>s"
let g:UltiSnipsJumpBackwardTrigger = "<leader>b"

" Eclim config
"let g:EclimCompletionMethod = 'omnifunc'

" Eclim mappings
"autocmd FileType java call SetJavaMappings()

function! SetJavaMappings()
    nmap <leader>jf :%JavaFormat<CR>
    nmap <leader>jd :JavaDelegate<CR>
    nmap <leader>jo :JavaImportOrganize<CR>
    nmap <leader>ji :JavaImpl<CR>
    nmap <leader>jg :JavaGet<CR>
    nmap <leader>js :JavaSet<CR>
    nmap <leader>jj :Java
    nmap <leader>ju :JUnit<CR>
    nmap <leader>jc :JavaCorrect<CR>
endfunction

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:ctrlp_map = '<leader>b'
let g:ctrlp_cmd = 'CtrlP'

let g:syntastic_mode_map = {
            \ "mode": "active",
            \ "active_filetypes": [],
            \ "passive_filetypes": ["java"] }
" XML formatter
function! DoFormatXML() range
    " Save the file type
    let l:origft = &ft

    " Clean the file type
    set ft=

    " Add fake initial tag (so we can process multiple top-level elements)
    exe ":let l:beforeFirstLine=" . a:firstline . "-1"
    if l:beforeFirstLine < 0
        let l:beforeFirstLine=0
    endif
    exe a:lastline . "put ='</PrettyXML>'"
    exe l:beforeFirstLine . "put ='<PrettyXML>'"
    exe ":let l:newLastLine=" . a:lastline . "+2"
    if l:newLastLine > line('$')
        let l:newLastLine=line('$')
    endif

    " Remove XML header
    exe ":" . a:firstline . "," . a:lastline . "s/<\?xml\\_.*\?>\\_s*//e"

    " Recalculate last line of the edited code
    let l:newLastLine=search('</PrettyXML>')

    " Execute external formatter
    exe ":silent " . a:firstline . "," . l:newLastLine . "!xmllint --noblanks --format --recover -"

    " Recalculate first and last lines of the edited code
    let l:newFirstLine=search('<PrettyXML>')
    let l:newLastLine=search('</PrettyXML>')

    " Get inner range
    let l:innerFirstLine=l:newFirstLine+1
    let l:innerLastLine=l:newLastLine-1

    " Remove extra unnecessary indentation
    exe ":silent " . l:innerFirstLine . "," . l:innerLastLine "s/^  //e"

    " Remove fake tag
    exe l:newLastLine . "d"
    exe l:newFirstLine . "d"

    " Put the cursor at the first line of the edited code
    exe ":" . l:newFirstLine

    " Restore the file type
    exe "set ft=" . l:origft
endfunction
command! -range=% FormatXML <line1>,<line2>call DoFormatXML()

nmap <silent> <leader>x :%FormatXML<CR>
vmap <silent> <leader>x :FormatXML<CR>

" JsBeautify mapping
autocmd FileType javascript noremap <buffer>  <leader>j :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <leader>j :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <leader>j :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <leader>j :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <leader>j :call CSSBeautify()<cr>
