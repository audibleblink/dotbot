" Vim color file

" YouCompleteMe Menu Accents
highlight Pmenu         ctermfg=15 ctermbg=237
highlight PmenuSel      ctermfg=16 ctermbg=51

" Solid Split Bar
highlight ColorColumn   ctermbg=24
highlight VertSplit     ctermbg=0  ctermfg=0 guifg=white guibg=white

function! BrightHighlightOn()
  hi CursorLine ctermbg=cyan ctermfg=16
endfunction

function! BrightHighlightOff()
  hi CursorLine ctermbg=none
endfunction

" Search results and quickfix highlights
highlight Search cterm=NONE ctermfg=grey ctermbg=blue
