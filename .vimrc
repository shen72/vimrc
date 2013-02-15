set ts=2
set sw=2

set autoindent
set nu
set expandtab

set cuc
set hlsearch

syntax on
filetype plugin on
let g:pydiction_location = '/home/shenyi/.vim/after/ftplugin/pydiction/complete-dict'
let g:pydiction_menu_height = 10

set t_Co=256
colorscheme desert
set cc=80

if has("autocmd")
  "autocmd FileType python set complete+=k iskeyword+=.,(
  filetype plugin indent on
endif

function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

augroup filetype
  au! BufNewFile,BufRead SCons* setfiletype scons
augroup end
map <C-n> <ESC><ESC>:vsplit<CR><C-w><C-w>
