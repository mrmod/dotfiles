set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'Vimjas/vim-python-pep8-indent'
"Plugin 'fatih/vim-go'
"Plugin 'vim-jp/vim-go-extra'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'mdempsky/gocode', {'rtp': 'vim/'}
call vundle#end()
" Colors
hi Comment ctermfg=DarkGrey
" Tabs are 4 spaces wide but use spaces
set expandtab " Use spaces instead of tab
set tabstop=2
set softtabstop=2 " # of spaces a TAB counts for
set shiftwidth=2
set smarttab
set background=dark
function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2> /dev/null | tr -d '\n'")
endfunction
" Many colors
set t_Co=88
"set t_AB=<Esc>[%?%p1%{8}%<%t25;%p1%{40}%+%e5;%p1%{32}%+%;%dm
"set t_AF=<Esc>[%?%p1%{8}%<%t22;%p1%{30}%+%e1;%p1%{22}%+%;%dm
colorscheme desert
" Tabs
hi TabLine ctermbg=237 ctermfg=245
hi TabLineSel ctermbg=237 ctermfg=182
hi TabLineFill ctermbg=233 ctermfg=240
" Statusline
hi PmenuSel ctermfg=148 ctermbg=235 cterm=bold
hi LineNr ctermfg=182 ctermbg=238
hi CursorColumn ctermfg=148 ctermbg=240
set laststatus=2
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{GitBranch()}\  
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\  
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=%y\  
set statusline+=%p%%\  
set statusline+=L:%l\ C:%c
" Highlight current line
set cursorline
hi CursorLine cterm=none ctermbg=233
set number
filetype plugin indent on
" Paste
map <F5> :r!xclip -o -sel clipboard<CR>
" Code completion
if has("autocmd") && exists("+omnifunc")
autocmd Filetype *
	\	if &omnifunc == "" |
	\		setlocal omnifunc=syntaxcomplete#Complete |
	\	endif
endif
filetype plugin on
set omnifunc=syntaxcomplete#Complete
