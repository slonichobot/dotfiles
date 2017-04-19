set ts=4
set sw=4
set sr
set et
set sta
set nu
set bs=2
set ai
set tw=79
set fo=c,q,r,t
set bg=dark " only dark terminal bg
set mouse=a
set hid
set cb^=unnamed,unnamedplus
filetype plugin indent on
syntax on
map <S-q> :s,^,//,<cr>
map <S-e> :s,^//,<cr>
imap jk <esc>
nmap ;w :w<CR>
set backspace=indent,eol,start

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
	let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
	let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" Tab bindings
nnoremap H gT
nnoremap L gt

" Bindings for paste mode
set pastetoggle=<F2>
