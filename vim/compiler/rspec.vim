" Vim compiler file
" Language:		RSpec
" Maintainer:		Tim Pope <vimNOSPAM@tpope.org>
" Last Change:		2009 Dec 22
" URL:			http://vim-ruby.rubyforge.org
" Anon CVS:		See above site
" Release Coordinator:	Doug Kearns <dougkearns@gmail.com>
echom 'INT HE COMPOILER'
echom 'INT HE COMPOILER'
if exists("current_compiler")
  finish
endif
let current_compiler = "rspec"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

CompilerSet makeprg=rspec

CompilerSet errorformat=rspec\ %f:%l\ #%m

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: nowrap sw=2 sts=2 ts=8:
