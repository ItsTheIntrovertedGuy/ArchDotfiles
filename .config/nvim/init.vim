" Plugins "
call plug#begin('~/.nvim/plugged')
Plug 'chriskempson/base16-vim'  " Theme
Plug 'cohama/lexima.vim'		" Autoclose paranthesis
Plug 'dpc/vim-smarttabs'	    " Tabs for indentation, spaces for allignement
Plug 'xolox/vim-session'        " Vim Sessions
Plug 'xolox/vim-misc'           " Used by vim-sessions for some reason
Plug 'airblade/vim-rooter'      " Set working directory to opened one
call plug#end()

""" VISUALS
syntax on
colorscheme base16-grayscale-dark
highlight clear LineNr
highlight clear CursorLineNr
highlight LineNr ctermfg=blue
highlight CursorLineNr ctermfg=blue
highlight clear StatusLine
highlight clear VertSplit
highlight cTodo ctermfg=0 ctermbg=10 guibg=gray17
set numberwidth=3

set number
"set relativenumber

set guicursor=

set nowrap
set scrolloff=5
set matchtime=2

set backspace=2
set tabstop=4
set shiftwidth=4

nnoremap <esc> :noh<return><esc>
vmap <a-y> "+y
nnoremap <a-p> "+p

set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#32302f ctermbg=234


""" INTERNAL SETTINGS
set undodir=~/.nvim/undos/
set undofile

set exrc
set secure
set confirm

set ignorecase
set smartcase " Search is case insensitive if all letters are lower case

tnoremap <esc> <C-\><C-N><C-w>h

" Programming settings
"autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost [^l]* nested copen
autocmd QuickFixCmdPost [^l]* nested wincmd p
autocmd QuickFixCmdPost    l* nested lwindow
autocmd VimResized * wincmd =
autocmd VimLeavePre * cclose | lclose
map <F1> :wa<cr>:silent make! -B build<cr>
map <F2> :silent make! -B run<cr>
nmap <C-j> :cnext<cr>
nmap <C-k> :cprevious<cr>

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

" INPUT BINDS
inoremap <a-y> // NOTE(Felix): 
inoremap <a-t> // TODO(Felix): 
map <Space> <Leader>

" Own function, using scpl, open up a window containing info about the project
nnoremap <silent> <C-l> <esc>:call SimpleCProgrammingList()<cr>
function SimpleCProgrammingList()
	let bnr = bufwinnr('SimpleCProgrammingListBuffer')
	if bnr > 0
		silent bdelete SimpleCProgrammingListBuffer
	else
		silent badd SimpleCProgrammingListBuffer
		silent vs
		silent wincmd H
		silent vertical resize 40
		silent b SimpleCProgrammingListBuffer
		silent set buftype=nofile
		silent r ! scpl *.c *.h
		silent 0d_
		silent setlocal nonumber
		silent setlocal noma

		" Highlighting
		syn region SimpleCProgrammingListSyntaxFunctionParams start=+(+ end=+)+
		syn keyword SimpleCProgrammingListSyntaxSeperator structs enums defines globals functions
		hi SimpleCProgrammingListSyntaxFunctionParams ctermfg=8
		hi SimpleCProgrammingListSyntaxSeperator ctermfg=5
		silent wincmd p
	endif
endfunction

""" PLUGIN CONFIG
" vim-session
let g:session_autosave = 'yes'
let g:session_autosave_silent = 1
let g:session_default_to_last = 1
let g:session_autoload = 'yes'
let g:session_directory = '~/.nvim/sessions'
set sessionoptions-=blank

" vim-rooter
let g:rooter_patterns = ['makefile', 'make', 'Rakefile', '.git/']
