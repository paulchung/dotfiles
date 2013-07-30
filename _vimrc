"GENERIC:$Id: .vimrc,v 1.2 2008/01/21 04:17:07 mcl Exp $

let g:default_charset="utf8"
let g:sql_type_default = 'mysql'
set background=dark

set nocompatible	" Use Vim defaults (much better!)
set bs=2		" allow backspacing over everything in insert mode
set ai			" always set autoindenting on
set nobackup		" keep a backup file
set viminfo='800,\"800	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set t_Co=16		" number of colors
set t_Sf=[1;3%dm	" set foreground color
set t_Sb=[1;4%dm	" set background color
set sw=2		" set soft width
set number
"set tabstop=2

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " In text files, always limit the width of text to 78 characters
"  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost * if line("'\"") | exe "'\"" | endif
endif

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
" map Q gq

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
syntax on
set hlsearch

if has("autocmd")
 augroup cprog
  " Remove all cprog autocommands
  au!

  " When starting to edit a file:
  "   For C and C++ files set formatting of comments and set C-indenting on.
  "   For other files switch it off.
  "   Don't change the order, it's important that the line with * comes first.
  autocmd FileType *      set formatoptions=tcql nocindent comments&
  autocmd FileType c,cpp  set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
  autocmd FileType php    set dictionary-=~/.dict/php.dat dictionary+=~/.dict/php.dat
 augroup END

 augroup gzip
  " Remove all gzip autocommands
  au!

  " Enable editing of gzipped files
  "	  read:	set binary mode before reading the file
  "		uncompress text in buffer after reading
  "	 write:	compress file after writing
  "	append:	uncompress file, append, compress file
  autocmd BufReadPre,FileReadPre	*.gz set bin
  autocmd BufReadPost,FileReadPost	*.gz let ch_save = &ch|set ch=2
  autocmd BufReadPost,FileReadPost	*.gz '[,']!gunzip
  autocmd BufReadPost,FileReadPost	*.gz set nobin
  autocmd BufReadPost,FileReadPost	*.gz let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost	*.gz execute ":doautocmd BufReadPost " . expand("%:r")

  autocmd BufWritePost,FileWritePost	*.gz !mv <afile> <afile>:r
  autocmd BufWritePost,FileWritePost	*.gz !gzip <afile>:r

  autocmd FileAppendPre			*.gz !gunzip <afile>
  autocmd FileAppendPre			*.gz !mv <afile>:r <afile>
  autocmd FileAppendPost		*.gz !mv <afile> <afile>:r
  autocmd FileAppendPost		*.gz !gzip <afile>:r
 augroup END
endif

" highlight Cursor ctermfg=Green ctermbg=white guifg=Green guibg=white
" highlight NonText ctermfg=grey ctermbg=black guifg=gray guibg=black
" highlight Constant ctermfg=6 ctermbg=black guifg=6 guibg=black
" highlight Special ctermfg=red ctermbg=black guifg=red guibg=black
" highlight nontext ctermfg=gray ctermbg=black guifg=gray guibg=black
" highlight directory ctermbg=black guibg=black
" highlight moremsg ctermbg=black guibg=black
" highlight modemsg ctermbg=black guibg=black
" highlight Linenr ctermfg=cyan ctermbg=black guifg=cyan guibg=black
" highlight Normal ctermfg=gray ctermbg=black guifg=gray guibg=black
" highlight IncSearch ctermbg=white ctermfg=black gui=reverse guibg=black
" highlight Search ctermbg=14  ctermfg=white guifg=white guibg=black
highlight Search ctermbg=black  ctermfg=white guifg=white guibg=black
" highlight Comment term=standout cterm=bold ctermfg=0
" highlight Comment ctermbg=yellow ctermfg=red guifg=white guibg=red
highlight Comment ctermfg=darkgreen guibg=darkblue guifg=lightred
" highlight PreProc ctermbg=4 ctermfg=7 guifg=7 guibg=4
" highlight Error ctermbg=1 ctermfg=2 guifg=2 guibg=1
" highlight Visual ctermbg=yellow ctermfg=white guifg=white guifg=yellow

set tags=./tags,./TAGS,../tags,../TAGS
set smartindent
set smarttab
set incsearch
set vb t_vb=
" set nowrap

" set fileencoding=taiwan
set enc=utf8
set tenc=utf8
set fileencoding=utf8
set fileencodings=utf8,cp950,cp936,ucs-bom,default
set termencoding=utf8

" folder(zc, zo)
" set foldmethod=indent
" set foldnestmax=2
" let php_folding=2

" ??PHP???C?????n??
let php_sql_query = 1
let php_htmlInStrings = 1
let php_minlines = 3000
let php_baselib = 1
let php_asp_tags = 1

" Column highlight ?]???O?C?о??C?|?е??C??
" set cursorline 
" set cursorcolumn 
" highlight CursorLine cterm=none ctermbg=7 ctermfg=0 
" highlight CursorColumn cterm=none ctermbg=7 ctermfg=0 
" ?C?⪺?e?????P?I?????n?p??

" Find cursor position , highlight near word of cursor.
function VIMRCWhere()
	if !exists("s:highlightcursor")
	match Todo /\k*\%#\k*/
	let s:highlightcursor=1
	else
	match None
	unlet s:highlightcursor
	endif
endfunction
map <C-K> :call VIMRCWhere()<CR>

" Shifting blocks visually
:vnoremap < <gv
:vnoremap > >gv

" Vim online Tip #195: Switching between files
map <C-J> <C-W>w

" Vim Online  Tip #91: Dictionary completions
"set dictionary-=~/.dict/mydict.dat dictionary+=~/.dict/mydict.dat
set complete-=k complete+=k

set cindent
set expandtab
set shiftwidth=4
