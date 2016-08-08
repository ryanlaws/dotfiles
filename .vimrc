set number
syntax on
set ruler
set tabstop=2
set shiftwidth=2
set tw=80	
set ai

" Mappings - buffer navigation
nnoremap <C-K> :bp <CR>
nnoremap <C-J> :bn <CR>

" Mappings - save
imap <D-S> <Esc> :w <CR>

" Mappings - date/time
imap <F4>          <C-R>=strftime("%Y%m%d")<CR>
imap <F3>          <C-R>=strftime("%H%M%S")<CR><CR>
map <F5>	:call RunThisFile() <CR>

" Everybody loves pressing F5
function! RunThisFile()
	let ext = split(expand("%"), '\.')[-1]
	if ext == "js"
!node %
	elseif ext == "c"
"!gcc % -lncurses -lportmidi
!gcc % 
!./a.out
	elseif ext == "vimrc"
echo "Configuration... how do I run this again?"
	else
echo "What kind of file is this?"
	endif
endfunction

set background=dark 

" At vimwiki's behest
" -------------------
set nocompatible
filetype plugin on
" -------------------
" This is the magic line to change in vimwiki to make the dates how I
" want 'em (stop editing vimwiki locally dude):
"let s:vimwiki_defaults.diary_link_fmt = '%y%m%d'

" vim-plug
" --------
call plug#begin('~/.vim/plugged')
" plugins
Plug 'https://github.com/freeo/vim-kalisi'
Plug 'https://github.com/vimwiki/vimwiki.git'
Plug 'https://github.com/vim-scripts/Shades-of-Amber'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/marijnh/tern_for_vim.git', { 'for': 'js' }
call plug#end()
" end plugins
" --------
" end vim-plug

" Plugins-dependent stuff
"colorscheme shadesofamber
colorscheme kalisi
