" Plugins "
call plug#begin('~/.nvim/plugged')
Plug 'chriskempson/base16-vim'   " Theme
"Plug 'morhetz/gruvbox'			" Theme
Plug 'cohama/lexima.vim'		" Autoclose paranthesis
Plug 'scrooloose/nerdtree'		" CTRL+n for some sick directory viewer
Plug 'scrooloose/nerdcommenter'	" Easily comment stuff with \cm, toggle hidden files Shift+i
Plug 'dpc/vim-smarttabs'	    " Tabs for indentation, spaces for allignement
call plug#end()

""" VISUALS
syntax on
"colorscheme gruvbox
"set background=dark
colorscheme base16-grayscale-dark
highlight clear LineNr
highlight clear CursorLineNr
highlight LineNr ctermfg=blue
highlight CursorLineNr ctermfg=blue
highlight clear StatusLine
highlight clear VertSplit
set numberwidth=3

set number
"set relativenumber

set guicursor=

set nowrap
set scrolloff=5
"set title
set matchtime=2

set backspace=2
set tabstop=4
set shiftwidth=4
"set softtabstop=2
"set noexpandtab
"set smartindent
"set smarttab

nnoremap <esc> :noh<return><esc>
vmap <a-y> "+y
inoremap <a-p> "+p

set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#32302f ctermbg=234


""" INTERNAL SETTINGS
" C settings
" edit /usr/share/nvim/runtime/syntax/c.vim and add NOTE to FIXME TODO 
" NOTE: Indent case curly bracket on same line
set cinoptions+=(0
set cinoptions+=t0
set cinoptions+=l1 
augroup project
        autocmd!
        autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup project

augroup END
filetype plugin on

set undodir=~/.vim/undos/
set undofile

set autochdir

set confirm

tnoremap <esc> <C-\><C-N><C-w>h

" INPUT BINDS
inoremap <a-y> // NOTE(Felix): 
inoremap <a-t> // TODO(Felix): 

""" PLUGIN CONFIG
map <C-n> :NERDTreeToggle<CR>

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

