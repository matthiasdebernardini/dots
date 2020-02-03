set nocompatible              " be iMproved, required
filetype off                  " requireod

set relativenumber

set tabstop=8     " tabs are at proper location
set expandtab     " don't use actual tab character (ctrl-v)
set shiftwidth=4  " indenting is 4 spaces

set autoindent    " turns it on
set smartindent   " does the right thing (mostly) in programs
set cindent       " stricter rules for C programs
"neovim clipboard
set clipboard+=unnamedplus

let mapleader = " "

" .............................................................................
" matthiasdebernardini/python
" .............................................................................
" writes the file, clears the terminal and runs the pyton file in the current buffer
map <F5> <Esc>:Gwrite<CR>:!clear;python %<CR>

" .............................................................................
" junegunn/vim-plug
" .............................................................................
call plug#begin('~/.vim/plugged')

Plug 'mattn/webapi-vim'
Plug 'mattn/vim-gist'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'

Plug 'luochen1990/rainbow'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'junegunn/vim-peekaboo'

Plug 'mhinz/vim-grepper'

Plug 'rust-lang/rust.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vimwiki/vimwiki'

call plug#end()

" .............................................................................
" mattn/webapi-vim
" .............................................................................
let g:gist_post_private = 1

" .............................................................................
" vimwiki/vimwiki
" .............................................................................
" prefer markdown
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" .............................................................................
" rust-lang/rust.vim
" .............................................................................
nnoremap <Leader>cr :Gwrite<CR> :Cargo run<CR>
nnoremap <Leader>ct :Gwrite<CR> :Cargo test<CR>

" .............................................................................
" sirver/ultisnips
" .............................................................................
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" .............................................................................
" luochen1990/rainbow
" .............................................................................
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" .............................................................................
" tpope/vim-fugitive
" .............................................................................
nnoremap <Leader>w :Gwrite<CR>

" .............................................................................
" junegunn/fzf.vim
" .............................................................................
"search for lines and files
nnoremap <silent> <Leader>l :Lines<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader><Enter> :Buffers<CR>

"Launch FZF with -m which lets you select multi lines - similar functionality
"to sublime and vscode
nnoremap <silent> <C-p> :FZF -m<CR>

" .............................................................................
" mhinz/vim-grepper
" .............................................................................

let g:grepper={}
let g:grepper.tools=["rg"]

nnoremap <Leader>r :%s//gc<Left><Left><Left>
xmap gr <plug>(GrepperOperator)

" After searching for text, press this mapping to do a project wide find and
" replace. It's similar to <leader>r except this one applies to all matches
" across all files instead of just the current file.
nnoremap <Leader>R
  \ :let @s='\<'.expand('<cword>').'\>'<CR>
  \ :Grepper -cword -noprompt<CR>
  \ :cfdo %s/<C-r>s//g \| update
  \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" The same as above except it works with a visual selection.
xmap <Leader>R
    \ "sy
    \ gvgr
    \ :cfdo %s/<C-r>s//g \| update
     \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>kk

