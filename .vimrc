set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()            " required

set ts=2
set sw=2
set softtabstop=2

set autoindent
set nu
set expandtab

set hlsearch
set backspace=2

syntax on
filetype plugin on
let g:pydiction_location = '/home/shenyi/.vim/after/ftplugin/pydiction/complete-dict'
let g:pydiction_menu_height = 10

set t_Co=256
colorscheme desert
set cc=80

highlight Pmenu guifg=#ffffff guibg=#000000 ctermfg=11 ctermbg=8

if has("autocmd")
  "autocmd FileType python set complete+=k iskeyword+=.,(
  filetype plugin indent on
endif

function! s:insert_cc_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i// Copyright 2018, Nuro Inc. All rights reserved."
  execute "normal! oAuthor: Yi Shen (y@nuro.ai)"
  execute "normal! o"
  execute "normal! Xx"
  execute "normal! o#ifndef " . gatename . "_"
  execute "normal! o#define " . gatename . "_"
  execute "normal! Go#endif  // " . gatename . "_"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_cc_gates()

function! s:insert_python_gates()
  execute "normal! i''' "
  execute "normal! oCopyright 2018, Nuro Inc. All rights reserved."
  execute "normal! oAuthor: Yi Shen (y@nuro.ai)"
  execute "normal! o'''"
  normal! kk
endfunction
autocmd BufNewFile *.py call <SID>insert_python_gates()

function! s:insert_proto_gates()
  execute "normal! i// Copyright 2018, Nuro Inc. All rights reserved."
  execute "normal! o// Author: Yi Shen (y@nuro.ai)"
  execute "normal! o//"
  execute "normal! o//"
endfunction
autocmd BufNewFile *.proto call <SID>insert_proto_gates()

function! s:insert_sh_gates()
  execute "normal! i# Copyright 2018, Nuro Inc. All rights reserved."
  execute "normal! o# Author: Yi Shen (y@nuro.ai)"
  normal! kk
endfunction
autocmd BufNewFile *.sh call <SID>insert_sh_gates()

augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

augroup filetype
  au! BufNewFile,BufRead SCons* setfiletype scons
augroup end
map <C-n> <ESC><ESC>:vsplit<CR><C-w><C-w>
map <C-y> <ESC><ESC>:Explore<CR>
