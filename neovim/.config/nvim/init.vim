set encoding=utf-8
scriptencoding utf-8

if (has("termguicolors"))
    set termguicolors
endif

let g:mapleader = "\<Space>"
" enable syntax highlighting
syntax enable
" enable 256 colours support
set t_Co=256
set t_ut=
set timeoutlen=200
set background=dark
set number
"set colorcolumn=120,121,122

if has('persistent_undo')
    set undofile
    " should be ~/.local/share
    set undodir=$HOME/.local/share/nvim/undo
    set undolevels=1000
    set undoreload=10000
endif

let g:hlstate=0
" toggle search highlight with <Space>h
nnoremap <silent> <leader>h :set hlsearch!<cr>
" write with <space>w
nnoremap <silent> <leader>w :w<cr>
" quit with nonzero exit code with ZQ
nnoremap <silent> ZQ :cq<cr>

inoremap jj <Esc>
inoremap hh <Esc>

"disable arrow keys
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>
cnoremap <C-K> <Up>
cnoremap <C-L> <Right>
cnoremap <C-H> <Left>
cnoremap <C-J> <Down>

if has('nvim')
    set inccommand=nosplit
    " copy file to system clipboard
    map <leader>y gg"+yG
endif

if !has('nvim')
    set viminfo+=~/.vim/viminfo
endif

source ~/.config/nvim/tabline.vim

" no shift for command mode
map ; :
" original ; behavior of repeating the last `f` or `t` now on ;;
noremap ;; ;

set listchars=tab:⭾ ,trail:•,precedes:≺,extends:€,nbsp:‗

" auto install plugin manager if it is not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    augroup bootstrap
	autocmd VimEnter * PlugInstall | source $MYVIMRC
    augroup END
endif


function! s:sourceConfig()
    let path = $HOME  . '/dotfiles/neovim/.config/nvim/plugins'

    let file_list = split(globpath(path, '*'), '\n')

    for file in file_list
	execute 'source' fnameescape(file)
    endfor

endfunction


call plug#begin('~/.config/nvim/plugged')

call <SID>sourceConfig()

" OTHER
" measure startuptime
Plug 'tweekmonster/startuptime.vim'
" tiny breakout game
Plug 'johngrib/vim-game-code-break'

call plug#end()

colorscheme hybrid_material
set background=dark
augroup syntaxrange
    "autocmd Syntax * call SyntaxRange#Include('Examples:$', '("""|\\n\\n)$', "python")
augroup END
