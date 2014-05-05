" Autoreload .vimrc on save
autocmd! bufwritepost .vimrc source %

" Mapped the leader key from \ to , as \ is difficult to type on a german keyboard.
let mapleader="," 

" I like numbers in front
" of my (unwrapped) lines
set number
set wrap!

" Tabs are spaces, not tabs!
" Except for Makefiles!
set expandtab
set shiftwidth=4
set tabstop=4
autocmd FileType make setlocal noexpandtab

" Don't switch to VI behavoir, use all of
" the 'improved' there is.
set nocompatible

" Don't create any swap or backup files.
set nobk
set nowritebackup
set noswapfile

" No spellchecking by defautlt
setlocal nospell

" Enable Syntax Highlightning
syn on

" Change Working directory
" to path of the edited file
" on startup.
"cd %:p:h

"See help: smartindent for explanation
" CTRL-V CTRL-H  = ^H
inoremap # X#

" Press <F2> to set the working directory
" to the path of the currently opened file/buffer
map <f2> <esc><esc>:cd %:p:h<cr>
"noremap <f6> :set invspell<cr>

" Press <F3> to insert a timestampl
"nmap <F3> a<C-R>=strftime("%Y-%m-%d, %H:%M:%S")<CR><Esc>
"imap <F3> <C-R>=strftime("%Y-%m-%d, %H:%M:%S")<CR>

" Enable file specific configuration using modlines
set modeline
set modelines=5

" Man, it's the 21. century, don't use ascii!
set encoding=UTF-8


" I don't what the search highlighted by default.
set nohlsearch

" incsearch shows the results as you type
set incsearch

" By default I wan't only folds that I explicitly
" set.
set foldmethod=marker

" The smartindent method seems to fit best with
" what I would expect.
set smartindent

" Easy Split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Reselect visual block after indent/outdent 
vnoremap < <gv
vnoremap > >gv

" Improve up/down movement on wrapped lines 
nnoremap j gj
nnoremap k gk


" Other stuff I need to comment.
set hid 
set sc

" make TAB behave like in bash
set wildmode=list:longest 

" Vundle
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Other Vundle Packages
"
" Flake8 Plugins
Plugin 'nvie/vim-flake8' " Don't forget to install flake8: pip install flake8

" Vim GPG Plugin
Plugin 'jamessan/vim-gnupg'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" nvie/vim-flake8 Settings
autocmd BufWritePost *.py call Flake8()


" vim-gnupg Settings
" gnupg shall use the amored filetype as default
let g:GPGPreferArmor=1
