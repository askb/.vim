set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syn on se title
syntax enable
filetype indent on
set et
set sw=4
set smarttab
map <f2> :w\|!python %
map <f2> :w\|!go run %


autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py set nocindent
" autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
autocmd BufWritePre *.py :%s/\s\+$//e

filetype plugin indent on
syn on se title

" set wrap
" set linebreak
" note trailing space at end of next line
set showbreak=>\ \ \


autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e

highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/
set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab

" contents of minimal .vimrc
execute pathogen#infect()
syntax on
filetype plugin indent on

" set background=default
" colorscheme solarized
" colorscheme molokai

syntax enable
filetype plugin on
color desert
set relativenumber
set number
"set cursorline
"set cursorcolumn
hi CursorLine term=bold cterm=bold guibg=Grey40
let g:go_disable_autoinstall = 0

" use goimports for formatting
let g:go_fmt_command = "goimports"

" Highlight
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']


" Open go doc in vertical window, horizontal, or tab
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>


" gotags to work
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }



" plugins expect bash - not fish, zsh, etc
 set shell=bash

" which key should be the <leader>
" (\ is the default, but ',' is more common, and easier to reach)
let mapleader=","

" pathogen will load the other modules
execute pathogen#infect()

" we want to tell the syntastic module when to run
" we want to see code highlighting and checks when  we open a file
" but we don't care so much that it reruns when we close the file
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" we also want to get rid of accidental trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" tell vim to allow you to copy between files, remember your cursor
" position and other little nice things like that
set viminfo='100,\"2500,:200,%,n~/.viminfo


nmap <F8> :TagbarToggle<CR>
nmap <C-n> :NERDTreeToggle<CR>

" default leader key is ',' / comma
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>


