"let $VIMRUNTIME = '~/git/neovim/runtime'
"let g:airline#extensions#tabline#enabled = 1
let mapleader = "\<Space>"
let normalcolorscheme = "PaperColor"
let diffcolorscheme = "iceberg"

syntax enable
syntax on
set t_Co=256
set timeoutlen=200

" always show sign column
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')


set background=light

set cursorline
set laststatus=2
set nu

if has('persistent_undo')
  set undofile
  set undodir=$HOME/.nvim/undo
  set undolevels=1000
  set undoreload=10000
endif

let hlstate=0
nnoremap <silent> <leader>h :set hlsearch!<cr>
nnoremap <silent> <leader>w :w<cr>
nnoremap <silent> <leader>w :w<cr>
nnoremap <silent> ZQ :cq<cr>

nnoremap jk <Esc>
nnoremap kj <Esc>

source ~/.config/nvim/tabline.vim


" no shift for command mode
map ; :
" original ; behavior of repeating the last `f` or `t` now on ;;
noremap ;; ;


if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

if ! has('nvim')
" some sensible defaults for regular vim
Plug 'tpope/vim-sensible'
endif

"status bar at the bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"colorschemes
"Plug 'vim-scripts/xoria256.vim'
"Plug 'nanotech/jellybeans.vim'
"Plug 'altercation/vim-colors-solarized'
"Plug 'flazz/vim-colorschemes' " a whole bunch
Plug 'NLKNguyen/papercolor-theme'
let g:PaperColor_Light_Override = { 'background' : '#ffffff', 'cursorline' : '#dfdfdf', 'matchparen' : '#d6d6d6' , 'comment' : '#8e908c' , 'linenumbers_fg': '#FF0000', 'diffadd_fg': '#00FF00', 'diffadd_bg': '#000000'}
"Plug 'wellsjo/wells-colorscheme.vim'
Plug 'romainl/Apprentice'

"# git
" git commands (:Gdiff !)
"Plug 'tpope/vim-fugitive'
"set statusline=%{fugitive#statusline()}
"git branches (needs fugitive)
"Plug 'vim-scripts/Merginal'
" colorscheme that works for git diff. requires: syntax enable
"Plug 'andreicristianpetcu/vim-modokay'
"syntax enable
"let diffcolorscheme = 'modokay'

"better commit message editing
Plug 'rhysd/committia.vim',

" git status in sidebar
Plug 'airblade/vim-gitgutter'
let g:gitgutter_sign_column_always = 1


"# search
" regex search through all buffers with :Bsgrep
Plug 'jeetsukumaran/vim-buffersaurus'
nnoremap <leader>f :Bsgrep<space>

" move through visible lines with binary search-like movement
Plug 'hoelzro/vim-split-navigate'
let g:splitnavigate_start_key = "<leader>s"
let g:splitnavigate_up_key = "u"
let g:splitnavigate_down_key = "d"
let g:splitnavigate_abort_key = "q"
" custom blue on white
highlight TopHighlight term=bold ctermfg=18 ctermbg=152
" custom red on white
highlight BottomHighlight term=bold ctermfg=88 ctermbg=252

" search through https://www.greppage.com with :G <query>
" N.B. requires https://github.com/evidanary/grepg-python
"Plug 'evidanary/grepg.vim'

" file finder using fzy. see 'cloudhead/neovim-fuzzy' and jhawthorn/fzy
Plug 'cloudhead/neovim-fuzzy'
nnoremap <silent> <leader>o :FuzzyOpen<CR>
let g:fuzzy_tabopen = 1
let g:fuzzy_jump_if_open = 1


" open file at a line from shell:
" `$ vim path/to/file.txt:20` will open the file at line 20
Plug 'bogado/file-line'

Plug 'mptre/vim-printf'
autocmd FileType vim let b:printf_pattern = 'echom printf("%s", %s)'
autocmd FileType rust let b:printf_pattern = 'println!("%s {}", %s);'
autocmd FileType php let b:printf_pattern = 'error_log(var_export(["%s" => %s], true);'
autocmd FileType javascript let b:printf_pattern = 'console.debug("%s: ",%s);'

nnoremap <Leader>p :Printf<CR>

" navigate seamlessly between tmux & vim. requires tmux config (see repo)
Plug 'christoomey/vim-tmux-navigator'
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" generate UUIDs
"Plug 'kburdett/vim-nuuid'
"let g:nuuid_no_mappings = 1
" display tags in a window
"Plug 'majutsushi/tagbar'


"# highlighting
" better javascript highlighting
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
" highlighting for JSX (react)
Plug 'mxw/vim-jsx', {'for': 'javascript.jsx'}
" rust highlighting
Plug 'rust-lang/rust.vim', {'for': 'rust'}
"Plug 'octol/vim-cpp-enhanced-highlight', {'for', 'cpp'}
"Plug 'tmhedberg/SimpylFold', {'for': 'python'} " better folding for python
Plug 'vim-scripts/indentpython.vim' , {'for': 'python'} "better indent detection



" detect indentation of the current file
"Plug 'roryokane/detectindent'

" (un)comment code easily
Plug 'scrooloose/nerdcommenter'
" <leader>cA  add comment at end of line
" [count]<leader>c<space> toggle comments according to the topmost line
filetype plugin on
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting


" better folding
"Plug 'pseewald/vim-anyfold'
filetype plugin indent on
syntax on
let anyfold_activate=0
set foldlevel=0
Plug 'Konfekt/FastFold'
let g:tex_fold_enabled=1
let g:vimsyn_folding='af'
let g:xml_syntax_folding = 1
let g:php_folding = 1
let g:perl_fold = 1
let g:javascript_fold = 1

" better session management
Plug 'manasthakur/VimSessionist'
"SS save
"SO open
"SP restore prev
"SL list
"SD delete

" Keep cursor between file openings / buffer switches
Plug 'kopischke/vim-stay'
set viewoptions=cursor,folds,slash,unix

" auto insert matching parens, brackets and quotes
Plug 'jiangmiao/auto-pairs'


" strip trailing whitespace on edited lines only
Plug 'thirtythreeforty/lessspace.vim'
let g:lessspace_blacklist = ['md', 'markdown']

"#prose writing
Plug 'vimwiki/vimwiki', {'for': ['vimwiki', 'markdown', 'text']}
nmap <Leader>W <Plug>VimwikiTabIndex
nmap <Leader>d <Plug>VimwikiTabMakeDiaryNote
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'Konfekt/vim-guesslang' "guess the language for spell checking
let g:guesslang_langs = [ 'en_US', 'nl_NL', 'nl' ]
autocmd FileType text,markdown,mail,gitcommit setlocal spell
autocmd FileType help setlocal nospell


" detect mixed indents within a file
Plug 'vim-scripts/IndentConsistencyCop'

" undo tree visualiser with live diff
Plug 'mbbill/undotree'
nnoremap <silent> <leader>u :UndotreeToggle\|UndotreeFocus<cr>
let g:undotree_WindowLayout = 4
let g:undotree_DiffAutoOpen = 1
let g:undotree_ShortIndicators = 1
let g:undotree_DiffpanelHeight = 10

" flips words around a delimiter
Plug 'mmahnic/vim-flipwords'
" Examples
" |a b        :Flip        b a
" |a, b       :Flip        b a,       "oops...
" |a, b       :Flip ,      b, a
" (a, |b, c)  :Flip ,      (a, c), b  "oops...
" (a, |b, c)  :Flip , )    (a, c, b)

"Plug 'mhinz/vim-startify'
Plug 'cazador481/fakeclip.neovim'
let g:vim_fakeclip_tmux_plus=1
Plug 'vim-scripts/gitignore.vim'
"Plug 'luochen1990/indent-detector.vim'

" markdown highlighting, see https://github.com/plasticboy/vim-markdown/#mappings
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', {'for': 'markdown', 'do': 'make' }
let g:vim_markdown_folding_disabled = 1


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
  "Plug 'neomake/neomake'
  "autocmd InsertChange,TextChanged * update | Neomake
  "let g:neomake_javascript_enabled_makers = ['./node_modules/.bin/eslint']
endif

if has('mac')
  " preview markdown on OSX
  "Plug 'junegunn/vim-xmark', { 'do': 'make' }
endif

Plug 'tweekmonster/startuptime.vim'

Plug 'dodie/vim-disapprove-deep-indentation'

Plug 'LnL7/vim-nix', {'for': 'nix'}

call plug#end()

call arpeggio#load()
Arpeggio inoremap jk  <Esc>

colorscheme apprentice " for base colours of bottom bar
set background=light
if &diff | exe 'colorscheme'.diffcolorscheme | else | exe 'colorscheme '.normalcolorscheme | endif
au FilterWritePre * if &diff | exe 'colorscheme '.diffcolorscheme | else | exe 'colorscheme '. normalcolorscheme | endif
