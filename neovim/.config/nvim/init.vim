let mapleader = "\<Space>"
" enable syntax highlighting
syntax enable
" enable 256 colours support
set t_Co=256
"set timeoutlen=200

if has('persistent_undo')
  set undofile
  set undodir=$HOME/.nvim/undo
  set undolevels=1000
  set undoreload=10000
endif

let hlstate=0
" toggle search highlight with <Space>h
nnoremap <silent> <leader>h :set hlsearch!<cr>
nnoremap <silent> <leader>w :w<cr>
nnoremap <silent> ZQ :cq<cr>
inoremap jk <Esc>
inoremap kj <Esc>
if has('nvim')
	set inccommand=nosplit
endif

source ~/.config/nvim/tabline.vim

" no shift for command mode
map ; :
" original ; behavior of repeating the last `f` or `t` now on ;;
noremap ;; ;


" auto install plugin manager if it is not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
" COLOURS
Plug 'NLKNguyen/papercolor-theme'
" give paretheses matching colours
Plug 'luochen1990/rainbow'
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['fg', 'lightblue', '208', '34', 'lightmagenta', 'darkblue', 'yellow', '167', '76', 'red'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}
let g:rainbow_active = 1
" syntax highlighting within another syntax
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-SyntaxRange'

" GIT
"better commit message editing
Plug 'rhysd/committia.vim'
" git status in sidebar
Plug 'airblade/vim-gitgutter'
let g:gitgutter_sign_column_always = 1
" git commands (:Gdiff !)
Plug 'tpope/vim-fugitive'

" FILES
" file finder using fzy. see 'cloudhead/neovim-fuzzy' and jhawthorn/fzy
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'jhawthorn/fzy', { 'dir': '~/.fzy', 'do': 'make && sudo make install' }
Plug 'cloudhead/neovim-fuzzy'
nnoremap <silent> <leader>o :FuzzyOpen<CR>
let g:fuzzy_tabopen = 1
let g:fuzzy_jump_if_open = 1
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
" make vim ignore files in gitignore
Plug 'vim-scripts/gitignore.vim'

" EDITING
"easily add print statements
Plug 'mptre/vim-printf'
autocmd FileType vim let b:printf_pattern = 'echom printf("%s", %s)'
autocmd FileType rust let b:printf_pattern = 'println!("%s {}", %s);'
autocmd FileType php let b:printf_pattern = 'error_log(var_export(["%s" => %s], true);'
autocmd FileType javascript let b:printf_pattern = 'console.debug("%s: ", %s);'
nnoremap <Leader>p :Printf<CR>
" auto insert matching parens, brackets and quotes
Plug 'jiangmiao/auto-pairs'
"Plug 'Raimondi/delimitMate'
" strip trailing whitespace on edited lines only
Plug 'thirtythreeforty/lessspace.vim'
let g:lessspace_blacklist = ['md', 'markdown']
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

" to make sure functions do not become massive
Plug 'dodie/vim-disapprove-deep-indentation'
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map j <Plug>(easymotion-j)
map k <Plug>(easymotion-k)
map w <Plug>(easymotion-w)
map b <Plug>(easymotion-b)
map e <Plug>(easymotion-e)

" WRITING
Plug 'vimwiki/vimwiki', {'for': ['vimwiki', 'markdown', 'text']}
nmap <Leader>W <Plug>VimwikiTabIndex
nmap <Leader>d <Plug>VimwikiTabMakeDiaryNote
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'Konfekt/vim-guesslang' "guess the language for spell checking
let g:guesslang_langs = [ 'en_US', 'nl_NL', 'nl' ]
autocmd FileType text,markdown,mail,gitcommit setlocal spell
autocmd FileType help setlocal nospell

" RUST
" highlighting for rust
Plug 'rust-lang/rust.vim', {'for': 'rust'}
" highlighting for Cargo.toml
Plug 'cespare/vim-toml'

" PYTHON
Plug 'vim-scripts/indentpython.vim' , {'for': 'python'} "better indent detection

" ELM
Plug 'ElmCast/elm-vim' , {'for': 'elm'}
Plug 'hoelzro/vim-elm-help', {'for': 'elm'}

" NIX config files
Plug 'LnL7/vim-nix', {'for': 'nix'}

" HTML
" easy html writing:  div.someclass#somediv => <Space>, => <div class="someclass" id="somediv"></div>
Plug 'mattn/emmet-vim', {'for': ['html', 'css', 'javascript', 'php']}
let g:user_emmet_leader_key='<leader>'

" MARKDOWN
" markdown highlighting, see https://github.com/plasticboy/vim-markdown/#mappings
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', {'for': 'markdown', 'do': 'make' }
let g:vim_markdown_folding_disabled = 1
" easy table of contents insert
Plug 'mzlogin/vim-markdown-toc'

" OTHER
" measure startuptime
Plug 'tweekmonster/startuptime.vim'
" tiny breakout game
Plug 'johngrib/vim-game-code-break'
" lightweight statusbar
Plug 'itchyny/lightline.vim'
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
call plug#end()

set background=dark
colorscheme PaperColor
autocmd Syntax * call SyntaxRange#Include('Examples:$', '("""|\\n\\n)$', "python")
