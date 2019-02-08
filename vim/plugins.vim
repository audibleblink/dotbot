set nocompatible
filetype off
call plug#begin('~/.vim/plugged')

Plug 'cormacrelf/vim-colors-github'
Plug 'dylanaraps/wal.vim'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'kana/vim-textobj-user' 
Plug 'maralla/completor.vim'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'

Plug 'OmniSharp/omnisharp-vim',        { 'for': 'cs' }
Plug 'chrisbra/vim-zsh',               { 'for': 'zsh' }
Plug 'fatih/vim-go',                   { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'sebdah/vim-delve',               { 'for': 'go' }
Plug 'freitass/todo.txt-vim',          { 'for': 'txt' }
Plug 'mattn/emmet-vim',                { 'for': ['html', 'javascript.jsx'] }
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'suan/vim-instant-markdown',      { 'for': 'markdown' }
Plug 'thoughtbot/vim-rspec',           { 'for': 'ruby' }
Plug 'tpope/vim-bundler',              { 'for': 'ruby' }
Plug 'tpope/vim-cucumber',             { 'for': 'ruby' }
call plug#end()

filetype plugin indent on

" Instant Markdown
  let g:instant_markdown_autostart = 0

" Go Completor
  let g:completor_gocode_binary = 'gocode'
  let g:completor_cs_omni_trigger = '.*'

" Colorscheme
  syntax on
  if has('termguicolors')
    set termguicolors
    set t_ut=
  endif
  set background=dark
  colorscheme oneplus
  " colorscheme wal
  hi CursorLine cterm=None
  let g:onedark_terminal_italics = 1

" RSpec.vim mappings
  let g:rspec_command = "VtrSendCommandToRunner! zeus rspec {spec}"

" VimWiki
  let g:vimwiki_list = [{'path': '~/private/VimWiki/index.wiki'}]

" Tmux Navigator
  " Send :update when leaving vim for tmux
  let g:tmux_navigator_save_on_switch = 1

" FZF
  " Layout
  let g:fzf_layout = { 'down': '~35%'  }

" EasyAlign
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)


" FZF w/ RipGrep
set grepprg=rg\ --vimgrep
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
"  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" let g:OmniSharp_server_use_mono = 1
" let g:OmniSharp_server_path = '/home/link/.omnisharp/omnisharp-roslyn/OmniSharp.exe'
let g:ale_linters = { 'cs': ['OmniSharp'] }
" let g:OmniSharp_selector_ui = 'fzf'
" let g:OmniSharp_host = 'http://localhost:2000'
" let g:OmniSharp_proc_debug = 1
" let g:OmniSharp_loglevel = 'debug'

augroup omnisharp_commands
    autocmd!
    autocmd FileType *.cs :call OmniSharp#HighlightTypes()

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <C-]> :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>r :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tp :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>cc :ccl<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>zz
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>zz
    autocmd FileType cs nnoremap <buffer> c* :OmniSharpRename<CR>
    autocmd FileType cs nnoremap <Leader>l :OmniSharpCodeFormat<CR>:OmniSharpFixUsings<CR>
augroup END

