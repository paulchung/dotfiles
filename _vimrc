"set background=dark

set cindent
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline

"set nu

set nocompatible
set backspace=2
set laststatus=2   " Always show the statusline


highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"statusline setting
set ls=2

let g:EasyGrepRecursive = 1
let g:EasyGrepIgnoreCase= 1

"search setting
set incsearch
set hlsearch

" enhanced command completion
set wildmenu

filetype off

set t_Co=256

"colorscheme darkdevel

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'git://github.com/gmarik/vundle.git'
Bundle 'git://github.com/vim-scripts/L9.git'
Bundle 'git://github.com/vim-scripts/FuzzyFinder.git'
Bundle 'git://github.com/ap/vim-css-color.git'
" super usefull grep tool
Bundle 'git://github.com/vim-scripts/EasyGrep.git'
Bundle 'git://github.com/scrooloose/nerdtree.git'
Bundle 'git://github.com/beyondwords/vim-twig.git'

set fileencodings=utf-8,gb2312,ucs-bom,big5
set termencoding=utf-8
set fileencoding=utf-8
set encoding=utf-8

set statusline=%4*%<\ %1*[%F]
set statusline+=%4*\ %5*%m " encoding
set statusline+=%4*%=[%{&encoding},%{&fenc},%{&fileformat}
set statusline+=%{\"\".((exists(\"+bomb\")\ &&\ &bomb)?\",BOM\":\"\").\"\"}]\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>

syntax on

au BufNewFile,BufRead *.json setf json

" template
function LoadHTMLTemplate()
    0r ~/.vim/template/production.html
    normal Gdd
endfunction
function LoadPHPTemplate()
    0r ~/.vim/template/production.php
    normal Gdd
endfunction

autocmd BufNewFile *.html call LoadHTMLTemplate()
autocmd BufNewFile *.php call LoadPHPTemplate()
autocmd FileType css set omnifunc=csscomplete

autocmd FileType php set omnifunc=phpcomplete#CompletePHP

highlight Search ctermbg=black  ctermfg=white guifg=white guibg=black
highlight Comment ctermfg=darkgreen guibg=darkblue guifg=lightred

filetype plugin indent on

set listchars=tab:=.,trail:.
set list

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

:vnoremap < <gv
:vnoremap > >gv
let loaded_matchparen = 1

nmap <F1> :NERDTreeToggle<CR>

map <F5> :!php -l %<CR>
