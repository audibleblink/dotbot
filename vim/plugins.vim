set nocompatible
filetype off
call plug#begin('~/.vim/plugged')

Plug 'audibleblink/hackthebox.vim'
Plug 'cormacrelf/vim-colors-github'
Plug 'dylanaraps/wal.vim'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'jpalardy/vim-slime'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'kana/vim-textobj-user' 
Plug 'maralla/completor.vim'
Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'dense-analysis/ale'
Plug 'dylanaraps/wal.vim'


Plug 'yaunj/vim-yara',                 { 'for': 'yar'  }
Plug 'OmniSharp/omnisharp-vim',        { 'for': 'cs'   }
Plug 'chrisbra/vim-zsh',               { 'for': 'zsh'  }
Plug 'fatih/vim-go',                   { 'for': 'go'   }
Plug 'freitass/todo.txt-vim',          { 'for': 'txt'  }
Plug 'mattn/emmet-vim',                { 'for': ['html', 'javascript.jsx'] }
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'thoughtbot/vim-rspec',           { 'for': 'ruby' }
Plug 'tpope/vim-bundler',              { 'for': 'ruby' }
Plug 'tpope/vim-cucumber',             { 'for': 'ruby' }
call plug#end()

filetype plugin indent on

" Instant Markdown
  let g:instant_markdown_autostart = 0

" Go Completor
  let g:completor_cs_omni_trigger = '.*'

  " Enable lsp for go by using gopls
  let g:completor_filetype_map = {}
  let g:completor_filetype_map.go = {'ft': 'lsp', 'cmd': 'gopls'}

" Colorscheme
  syntax on
  if has('termguicolors')
    set termguicolors
    set t_ut=
  endif
  colorscheme onedark


  " set background=dark
  " colorscheme oneplus
  " let g:onedark_terminal_italics = 1

" RSpec.vim mappings
  let g:rspec_command = "VtrSendCommandToRunner! zeus rspec {spec}"

" VimWiki
  let g:vimwiki_list = [{'path': '~/private/VimWiki/index.wiki'}]
  let g:vimwiki_folding = "expr:quick"
  let g:vimwiki_auto_tags = 1

" Tmux Navigator
  " Send :update when leaving vim for tmux
  let g:tmux_navigator_save_on_switch = 1

" FZF
  " Layout
  let g:fzf_layout = { 'down': '~35%'  }

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

" EasyAlign
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)

  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)


" Ale
  let g:ale_completion_enabled = 1
  let g:ale_linters = { 'cs': ['OmniSharp'], 'rust': ['rls', 'cargo'] }
  " let g:OmniSharp_server_use_mono = 1
  " let g:OmniSharp_server_path = '/home/link/.omnisharp/omnisharp-roslyn/OmniSharp.exe'
  " let g:OmniSharp_selector_ui = 'fzf'
  " let g:OmniSharp_host = 'http://localhost:2000'
  " let g:OmniSharp_proc_debug = 1
  " let g:OmniSharp_loglevel = 'debug'

augroup ruby
    autocmd FileType rb nmap <Leader>ra :call RunAllSpecs()<CR>
    autocmd FileType rb nmap <Leader>rl :call RunLastSpec()<CR>
    autocmd FileType rb nmap <Leader>rs :call RunNearestSpec()<CR>
    autocmd FileType rb nmap <Leader>rt :call RunCurrentSpecFile()<CR>
augroup END

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

au! BufNewFile,BufRead *.svelte set ft=html
"
" Python Dev
  let g:completor_python_binary = '/usr/bin/python3'

" Rust
  let g:rustfmt_autosave = 1

" Slime
  let g:slime_target = "tmux"
  let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}
  let g:slime_python_ipython = 1
