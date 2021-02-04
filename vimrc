" VimPlug Setup
source ~/.vim/plugins.vim

scriptencoding utf-8
set mouse+=a
set encoding=utf-8
set autoread
set autowrite
set backspace=2
set colorcolumn=+1
" set cursorcolumn
" set cursorline
set expandtab
set foldlevelstart=99
set foldmethod=indent
set hidden
set hlsearch
set incsearch
set laststatus=2
set list listchars=tab:»·,trail:·,nbsp:·
set mouse=a
set nobackup
set noswapfile
set nowrap
set number
set numberwidth=3
set relativenumber
set ruler
set showcmd
set splitbelow
set splitright
set textwidth=99
set tags^=./.git/tags
set timeoutlen=1000 ttimeoutlen=10
set wiw=100

" Change cursor shapes on mode change
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"

" Custom Mappings
    inoremap jk <ESC>
    cnoremap jk <ESC>
    nnoremap c* *Ncgn
    nnoremap <CR> :
    vnoremap <CR> :

    " places selected text in a search/replace command
    vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

    " Store relative line number jumps in the jumplist. Also treat
    " long lines as break lines (useful when moving around in them).
    noremap <expr> j v:count > 1 ? 'm`' . v:count . 'j' : 'gj'
    noremap <expr> k v:count > 1 ? 'm`' . v:count . 'k' : 'gk'

    " Make Yank behave
    vnoremap y myy`y
    vnoremap Y myY`y


" Leader Mappings
    let mapleader = " "
    map      <Leader>b  :Buffers<CR>
    map      <Leader>c  :noh<CR>
    nmap     <Leader>e  :vsp ~/.vimrc<CR>
    nmap     <Leader>ee :source ~/.vimrc<CR>
    map      <Leader>f  :Find<CR>
    nnoremap <Leader>gs :sp /tmp/scratch<CR>
    nnoremap <silent> <Leader>n :call mappings#cycle_numbering()<CR>
    map      <Leader>p  :Files<CR>
    map      <Leader>r  :BTags<CR>
    map      <Leader>t  :Tags<CR>
    map      <Leader>/  gcc
    vmap     <Leader>/  gc
    nnoremap <silent> <Leader>w :call mappings#zap()<CR>
    nnoremap <Leader>z  :wincmd _<cr>:wincmd \|<cr>
    nnoremap <Leader>Z  :wincmd =<cr>
    nmap     <Leader><Tab> :b#<CR>
    nnoremap <Leader><Up> :History:<CR>
    vnoremap  <Leader>y  "+y
    nnoremap  <Leader>u  "+p
    nnoremap  <Leader>gb :DlvToggleBreakpoint<cr>
    nnoremap  <Leader>gd :DlvDebug<cr>

" Read/Save on Focus Change
autocmd FocusLost,WinLeave * :silent! update
autocmd CursorHold * checktime

" Unmap Enter in the quickfix window
au BufReadPost quickfix nnoremap <buffer> <CR> <CR>

let &colorcolumn="100".join(range(100,999),",")

" Loads a local config, if exists
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif


