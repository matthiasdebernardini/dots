" Install vim-plug if needed
" if empty(glob('~/.vim/autoload/plug.vim'))
"   silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
"   autocmd VimEnter * PlugInstall | source $MYVIMRC
" endif
""""""""""""""""""""""""""""""""
"
" PACKAGE MANAGEMENT
"
""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-speeddating'

Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'

Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'

" Fuzzy finder in vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all', 'on': ['FZF', 'Tags', 'Buffers', 'Files', 'Helptags', 'Lines', 'Ag'] }
Plug 'junegunn/fzf.vim', { 'on': ['FZF', 'Tags', 'Buffers', 'Files', 'Helptags', 'Lines', 'Ag', 'Filetypes'] }
Plug 'jremmen/vim-ripgrep'
Plug 'mhinz/vim-grepper'

Plug 'junegunn/vim-easy-align'

Plug 'mhinz/vim-signify'

Plug 'rust-lang/rust.vim'

Plug 'vimwiki/vimwiki'

Plug 'markonm/traces.vim'

Plug 'dense-analysis/ale'
Plug 'neomake/neomake'
Plug 'sbdchd/neoformat'

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'honza/vim-snippets'

Plug 'ludovicchabant/vim-gutentags'

Plug 'terryma/vim-multiple-cursors'

Plug 'machakann/vim-highlightedyank'

Plug 'tmhedberg/SimpylFold'

Plug 'ferrine/md-img-paste.vim'

call plug#end()



""""""""""""""""""""""""""""""""
"
" SETTINGS & KEYBINDINGS
"
""""""""""""""""""""""""""""""""
set termguicolors
set encoding=utf-8
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=8
set tabstop=8
set autoindent
set smartindent
set cindent
set hidden
set ignorecase
set smartcase
set showmatch
set noshowmode
set incsearch
set hls
set ls=2
" set cursorline
set nowrap
set shell=/bin/bash
set completeopt -=preview
set textwidth=100
set cmdheight=1
" Use "hybrid" (both absolute and relative) line numbers
set number relativenumber

" Use the system clipboard
set clipboard=unnamed

" Use , as the leader key
let mapleader=","

" Use ,, to switch between buffers
nnoremap <leader><leader> <c-^>

" Press <tab>, get two spaces
set expandtab shiftwidth=4

" Show `▸▸` for tabs: 	, `·` for tailing whitespace: 
set list listchars=tab:▸▸,trail:·

" Enable mouse mode
set mouse=a


" backup/persistance settings
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backupskip=/tmp/*,/private/tmp/*"
set backup
set writebackup
set noswapfile

" persist (g)undo tree between sessions
set undofile
set history=100
set undolevels=100

" session management
let g:session_directory       = "~/.vim/session"
let g:session_autoload        = "no"
let g:session_autosave        = "no"
let g:session_command_aliases = 1

nnoremap <leader>so :OpenSession 
nnoremap <leader>ss :SaveSession 
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

set wildcharm=<C-z>
nnoremap <leader>e :e **/*<C-z><S-Tab>

set path-=/usr/include
nnoremap <leader>f :find **/*<C-z><S-Tab>

" open vimrc
nnoremap <leader>v :e      $MYVIMRC<CR>
nnoremap <leader>V :tabnew $MYVIMRC<CR>

map  <F5>      <Esc>:Gwrite<CR>:!clear;python %<CR>
imap ii        <Esc>
imap zz        <Esc>:wq<CR>
imap <leader>; <Esc>A;<CR>


autocmd FileType python map  <buffer> <Leader>p  :w<CR>:exec      '!python3' shellescape(@%, 1)<CR>
autocmd FileType python map  <buffer> <Leader>pt :w<CR>:exec      '!python3 -m unittest' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <Leader>p  <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" General file runners for various languages
function! LangRunner()
  if(&ft=="python")
    nnoremap <leader>R :!python3 %<cr>
  elseif(&ft=="javascript")
    nnoremap <leader>R :!node %<cr>
  elseif(&ft=="c")
    nnoremap <leader>R :!make run<cr>
  endif
endfunction

au BufEnter * call LangRunner()

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

hi HighlightedyankRegion cterm=reverse gui=reverse
" set highlight duration time to 1000 ms, i.e., 1 second
let g:highlightedyank_highlight_duration = 1000
" .............................................................................
" arcticicestudio/nord-vim
" .............................................................................
colorscheme nord

let g:lightline = {
      \ 'colorscheme': 'nord',
      \      'active': {
      \        'left': 
      \           [
      \             [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'helloworld' ] 
      \           ]
      \ },
      \ 'component_function': {
      \          'gitbranch': 'FugitiveHead'
      \ },
      \ }

" .............................................................................
" vimwiki/vimwiki
" .............................................................................
let g:vimwiki_list = [ {'path': '~/Documents/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

au FileType vimwiki setlocal shiftwidth=6 tabstop=6 noexpandtab

" .............................................................................
" rust-lang/rust.vim
" .............................................................................
nnoremap <Leader>cr  :Gwrite<CR> :Cargo run<CR>
nnoremap <Leader>ct  :Gwrite<CR> :Cargo test<CR>
nnoremap <Leader>cti :Gwrite<CR> :Cargo test -- --ignored<CR>
nnoremap <Leader>cc  :Gwrite<CR> :Cargo clippy --all-targets<CR>

let g:rustfmt_autosave = 1

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
set rtp+=~/.fzf
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
      \ 'ctrl-f': function('s:build_quickfix_list'),
      \ 'ctrl-t': 'tabedit',
      \ 'ctrl-p': 'split',
      \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = {'window': { 'width': 0.9, 'height': 0.4 } }
let g:fzf_preview_window = 'right:60%'

" Jump to existing buffer/window if possible
let g:fzf_buffers_jump = 1

nnoremap <leader>Enter :Buffers<CR>
nnoremap <leader>W :BLines<CR>
nnoremap <leader>? :Helptags<CR>
nnoremap <leader>T :Tags<CR>
nnoremap <leader>M :Marks<CR>
"search for lines and files
nnoremap <silent> <Leader>l :Lines<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader><Enter> :Buffers<CR>
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }

"Launch FZF with -m which lets you select multi lines - similar functionality
nnoremap <silent> <C-p> :FZF<CR>

" .............................................................................
" junegunn/vim-easy-align
" .............................................................................
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

if executable("rg")
    command! -bang -nargs=* Rg
          \ call fzf#vim#ripgrep(
          \   'rg --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
          \   <bang>0 ? fzf#vim#with_preview('up:60%')
          \           : fzf#vim#with_preview('right:50%:hidden', '?'),
          \   <bang>0)
    nnoremap <C-e>a :Rg
endif

let g:neomake_python_enabled_makers = ['pylint']
call neomake#configure#automake('nrwi', 500)

" custom setting for clangformat
let g:neoformat_cpp_clangformat = {
    \ 'exe':  'clang-format',
    \ 'args': ['--style="{IndentWidth: 4}"']
    \ }

let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c   = ['clangformat']

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" .............................................................................
" dense-analysis/ale
" .............................................................................
let g:ale_linters = {
    \ 'python': ['pylint'],
    \ 'vim':    ['vint'],
    \ 'cpp':    ['clang'],
    \ 'c':      ['clang']
    \ }

" .............................................................................
" ferrine/md-img-paste
" .............................................................................
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
autocmd FileType wiki     nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>

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

" .............................................................................
" neoclide/coc.nvim
" .............................................................................


inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB>   <Plug>(coc-range-select)
xmap <silent> <TAB>   <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold   :call CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR     :call CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc listen
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Coc Snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)


imap <F2> <C-R>=strftime('%c')<C-M>

imap <leader>ff <C-R>=getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bWn'))<C-M>
