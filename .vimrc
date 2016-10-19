set number
syntax on
set ruler
set tabstop=2
set shiftwidth=2
set tw=80	
set ai
set hlsearch
set ic

" Show git status
" Doesn't seem to work..
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Mappings - buffer navigation
nnoremap <C-K> :bp <CR>
nnoremap <C-J> :bn <CR>

" Mappings - save
imap <D-S> <Esc> :w <CR>

" Mappings - date/time
imap <F4>          <C-R>=strftime("%Y%m%d")<CR>
imap <F3>          <C-R>=strftime("%H%M%S")<CR><CR>
map <F5>	:call RunThisFile() <CR>

" Use with gqip for justified paragraph!
" (I'm probably never going to use this!)
" 20160923 I'm disabling this for now because it affects gqq too
" set formatprg=par\ -w80\ -j

" Auto commit vimwiki files!
" I can't fucking get this to work and it's frustrating as shit.
" :autocmd BufWritePost *.wiki call CommitWikiEntry()

function! CommitWikiEntry()
	call Gadd
	Gcommit -a
endfunction

" Let's just throw some mapping in instead so I can actually add meaningful
" comments to my commits
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>



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

" vim-plug
" NOTE: 
" 	:PlugUpdate - install or update
" 	:PlugUpgrade - update vim-plug itself
" 	:PlugStatus 
" 	:PlugInstall - install new plugins 
" --------
call plug#begin('~/.vim/plugged')
" plugins
Plug 'https://github.com/freeo/vim-kalisi'
Plug 'https://github.com/ryanlaws/vimwiki.git'
Plug 'https://github.com/vim-scripts/Shades-of-Amber'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/marijnh/tern_for_vim.git', { 'for': 'js' }
Plug 'https://github.com/tpope/vim-sensible.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
call plug#end()
" end plugins
" --------
" end vim-plug

" Plugins-dependent stuff
"colorscheme shadesofamber
colorscheme kalisi
set t_Co=256
