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

" write with :W
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))

" quit with nonzero exit code with ZQ
nnoremap <silent> ZQ :cq<cr>

inoremap jj <Esc>
inoremap hh <Esc>

"disable arrow keys
noremap  <Up> ""
noremap  <Down> ""
noremap  <Left> ""
noremap  <Right> ""
inoremap <Up> <Esc>
inoremap <Down> <Esc>
inoremap <Left> <Esc>
inoremap <Right> <Esc>
cnoremap <C-K> <Up>
cnoremap <C-L> <Right>
cnoremap <C-H> <Left>
cnoremap <C-J> <Down>

if has('nvim')
    set inccommand=nosplit
    " copy file to system clipboard
    map <silent> <leader>y :execute '%s/'.$USER.'/techhazard/ge'gg"+yGu:set nohlsearch
endif

if !has('nvim')
    set viminfo+=~/.vim/viminfo
endif


"   :BufMessage registers
"   :WinMessage ls
"   :TabMessage echo "Key mappings for Control+A:" | map <C-A>
"source ~/.config/nvim/plugins/redir_messages.vim

" no shift for command mode
map ; :
" original ; behavior of repeating the last `f` or `t` now on ;;
noremap ;; ;

set listchars=tab:>-,space:◦,trail:•,precedes:≺,extends:€,nbsp:‗

" soft-wrap at window border (any char)
set wrap

" wrap only at characters in breakat
set linebreak

" wrap at <Space><Tab>!@*-+;:,./?
set breakat=" ^I!@*-+;:,./?"

" start soft-wrapped lines with an ellipsis
set showbreak=…

" auto-wrap Comments at text-width, insert comment leader with <Return>,
"   and with 'o' and 'O', format comments with gQ, trailing Whitespace
"   indicates continuation of paragraph, Auto format paragraphs, format
"   Number lists, indent comments with <, break at Multibyte chars,
"   don't break a line after 1 char word, remove comment leader when Joining
"   lines with another comment
set formatoptions="croqwan<m1j"


" auto install plugin manager if it is not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    augroup bootstrap
	autocmd VimEnter * PlugInstall | source $MYVIMRC
    augroup END
endif

function! s:sourceConfig()
    let path = $HOME  . '/.config/nvim/plugins'

    let file_list = split(globpath(path, '*.vim'), '\n')

    for file in file_list
	execute 'source' fnameescape(file)
    endfor

endfunction


" load plugins
call plug#begin('~/.local/share/nvim/plugins')
call <SID>sourceConfig()
call plug#end()

colorscheme hybrid_material
set background=dark

augroup syntaxrange
    autocmd Syntax * call SyntaxRange#Include('Examples:$', '("""|\\n\\n)$', "python")
augroup END
