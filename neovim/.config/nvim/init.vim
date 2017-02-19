"let $VIMRUNTIME = '~/git/neovim/runtime'
"let g:airline#extensions#tabline#enabled = 1
let mapleader = "\<Space>"
let normalcolorscheme = "iceberg"
let diffcolorscheme = "iceberg"

syntax enable
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
" some sensible defaults
"Plug 'tpope/vim-sensible'

"status bar at the bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"colorschemes
Plug 'vim-scripts/xoria256.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes' " a whole bunch
Plug 'NLKNguyen/papercolor-theme'
Plug 'wellsjo/wells-colorscheme.vim'
Plug 'romainl/Apprentice'

"# git 
" git commands (:Gdiff !)
Plug 'tpope/vim-fugitive' 
"git branches (needs fugitive)
Plug 'vim-scripts/Merginal' 
" colorscheme that works for git diff. requires:
Plug 'andreicristianpetcu/vim-modokay' 
syntax enable
let diffcolorscheme = 'modokay'

"better commit message editing
Plug 'rhysd/committia.vim' 

" git status in statusline
Plug 'airblade/vim-gitgutter'

Plug 'vimwiki/vimwiki'

"# search
" regex search through all buffers with :Bsgrep
Plug 'jeetsukumaran/vim-buffersaurus' 

" move through visible lines with binary search-like movement
Plug 'hoelzro/vim-split-navigate' 
let g:splitnavigate_start_key = "<leader>s"
let g:splitnavigate_up_key = "u"
let g:splitnavigate_down_key = "d"
let g:splitnavigate_abort_key = "q"

" search through https://www.greppage.com with :G <query>
" N.B. requires https://github.com/evidanary/grepg-python
Plug 'evidanary/grepg.vim'

" file finder using fzy. see 'cloudhead/neovim-fuzzy' and jhawthorn/fzy
Plug 'cloudhead/neovim-fuzzy' 


" open file at a line from shell:
" `$ vim path/to/file.txt:20` will open the file at line 20
Plug 'bogado/file-line'

Plug 'mptre/vim-printf'
autocmd FileType vim let b:printf_pattern = 'echom printf("%s", %s)'
autocmd FileType rust let b:printf_pattern = 'println!("%s {}", %s);'
autocmd FileType php let b:printf_pattern = 'error_log(var_export(["%s" => %s], true);'
nnoremap <Leader>p :Printf<CR>

" navigate seamlessly between tmux & vim. requires tmux config (see repo)
Plug 'christoomey/vim-tmux-navigator' 

" generate UUIDs
Plug 'kburdett/vim-nuuid' 
" display tags in a window
Plug 'majutsushi/tagbar' 


"# highlighting
" better javascript highlighting
Plug 'pangloss/vim-javascript', {'for': 'javascript'} 
" highlighting for JSX (react)
Plug 'mxw/vim-jsx', {'for': 'javascript.jsx'}
" rust highlighting
Plug 'rust-lang/rust.vim', {'for': 'rust'} 



" detect indentation of the current file
Plug 'roryokane/detectindent' 

" (un)comment code easily
Plug 'scrooloose/nerdcommenter'
" <leader>cA  add comment at end of line
" [count]<leader>c<space> toggle comments according to the topmost line
filetype plugin on
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting

"Plug 'tmhedberg/SimpylFold', {'for': 'python' } " better folding for python

" better folding
Plug 'pseewald/vim-anyfold'
filetype plugin indent on
syntax on
let anyfold_activate=1
set foldlevel=0

" better session management
Plug 'manasthakur/VimSessionist' 
"SS save
"SO open
"SP restore prev
"SL list
"SD delete

" strip trailing whitespace on edited lines only
Plug 'thirtythreeforty/lessspace.vim'
let g:lessspace_blacklist = ['md', 'markdown']


"prose writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" detect mixed indents within a file
Plug 'vim-scripts/IndentConsistencyCop'
" undo tree visualiser with live diff
Plug 'mbbill/undotree'
" flips words around a delimiter
Plug 'mmahnic/vim-flipwords'

"Plug 'mhinz/vim-startify'
"Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'tpope/vim-five.git'
"Plug 'cazador481/fakeclip.neovim'
"Plug 'kien/ctrlp.vim'
"Plug 'vim-scripts/indentpython.vim'
"Plug 'vim-scriptsignore.git'
"Plug 'luochen1990/indent-detector.vim'

" markdown highlighting
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', {'do': 'make' }

" vim commands with simultaneous keypreses
Plug 'kana/vim-arpeggio'

if has('nvim') && has('python3')
  function! DoRemote(arg)
    UpdateRemotePlugins
  endfunction
  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
  let g:deoplete#enable_at_startup = 1
endif
if has('nvim')
  Plug 'neomake/neomake'
  autocmd InsertChange,TextChanged * update | Neomake
  let g:neomake_javascript_enabled_makers = ['./node_modules/.bin/eslint']
endif

if has('mac')
  " preview markdown on OSX
  Plug 'junegunn/vim-xmark', { 'do': 'make' }
endif

call plug#end()
let g:nuuid_no_mappings = 1
let g:undotree_WindowLayout = 4
let g:undotree_DiffAutoOpen = 1
let g:undotree_ShortIndicators = 1
let g:undotree_DiffpanelHeight = 10
let g:fuzzy_tabopen = 1
let g:fuzzy_jump_if_open = 1
let g:gitgutter_sign_column_always = 1
set t_Co=256
set timeoutlen=200

" always show sign column
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')


colorscheme apprentice " for base colours of bottom bar

set background=light
if &diff | exe 'colorscheme'.diffcolorscheme | else | exe 'colorscheme '.normalcolorscheme | endif
au FilterWritePre * if &diff | exe 'colorscheme '.diffcolorscheme | else | exe 'colorscheme '. normalcolorscheme | endif


set cursorline
set statusline=%{fugitive#statusline()}
set laststatus=2
set nu
set expandtab
set shiftwidth=2
set softtabstop=2
if has('persistent_undo')
  set undofile
  set undodir=$HOME/.nvim/undo
  set undolevels=1000
  set undoreload=10000
endif

let hlstate=0
nnoremap <silent> <leader>h :set hlsearch!<cr>
nnoremap <silent> <leader>u :UndotreeToggle\|UndotreeFocus<cr>
nnoremap <silent> <leader>o :FuzzyOpen<CR>
nnoremap <leader>f :Bsgrep<space>
let g:PaperColor_Light_Override = { 'background' : '#ffffff', 'cursorline' : '#dfdfff', 'matchparen' : '#d6d6d6' , 'comment' : '#8e908c' , 'linenumbers_fg': '#FF0000'}
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
nnoremap <silent> <leader>w :w<cr>
nnoremap <silent> <leader>w :w<cr>
nnoremap <silent> ZQ :cq<cr>
call arpeggio#load()
Arpeggio inoremap jk  <Esc>

source ~/.config/nvim/tabline.vim
let g:PaperColor_Light_Override = { 'background' : '#ffffff', 'cursorline' : '#dfdfdf', 'matchparen' : '#d6d6d6' , 'comment' : '#8e908c' , 'linenumbers_fg': '#FF0000', 'diffadd_fg': '#00FF00', 'diffadd_bg': '#000000'}

" custom blue on white
highlight TopHighlight term=bold ctermfg=18 ctermbg=252
" custom red on white
highlight BottomHighlight term=bold ctermfg=88 ctermbg=252

" no shift for command mode
map ; :
" original ; behavior of repeating the last `f` or `t` now on ;;
noremap ;; ;


