
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
endif

if !has('nvim')
    set viminfo+=~/.vim/viminfo
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
  augroup bootstrap
  autocmd VimEnter * PlugInstall | source $MYVIMRC
  augroup END
endif

call plug#begin('~/.config/nvim/plugged')
" COLOURS
"Plug 'NLKNguyen/papercolor-theme'
Plug 'kristijanhusak/vim-hybrid-material'
" give paretheses matching colours
Plug 'luochen1990/rainbow'
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['fg', '14', '208', '34', '196', '4', '11', '167', '76', '163'],
	\	'operators': '_,\|+\|-\|%\|/[^/]\|=\|==\|===\|!=\|!==\|<\|>\|:_',
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
	\		    'operators': '_=_',
	\		},
	\		'css': 0,
	\		'help': 0,
	\	}
	\}
let g:rainbow_active = 1
" syntax highlighting within another syntax
"Plug 'inkarkat/vim-ingo-library'
"Plug 'inkarkat/vim-SyntaxRange'
" Highlight and fix trailing whitespace with :FixWhitespace
"Plug 'bronson/vim-trailing-whitespace'
augroup whitespace
"  au BufEnter nowrite
augroup END


" GIT
"better commit message editing
Plug 'rhysd/committia.vim'
" git status in sidebar
Plug 'airblade/vim-gitgutter'
set signcolumn=yes
" git commands (:Gdiff !)
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim' "requires fugitive

" FILES
" file finder using fzf, see https://github.com/junegunn/fzf#as-vim-plugin
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
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
augroup vim_printf
autocmd FileType vim let b:printf_pattern = 'echom printf("%s", %s)'
autocmd FileType rust let b:printf_pattern = 'println!("%s {}", %s);'
autocmd FileType php let b:printf_pattern = 'error_log(var_export(["%s" => %s], true);'
autocmd FileType javascript let b:printf_pattern = 'console.debug("%s: ", %s);'
autocmd FileType elixir let b:printf_pattern = 'IO.puts " %s: #{%s}"'
augroup END
nnoremap <Leader>p :Printf<CR>
" auto insert matching parens, brackets and quotes
Plug 'jiangmiao/auto-pairs'
"Plug 'Raimondi/delimitMate'
" auto align titles
Plug 'guywald1/vim-prismo'
" surround words with anything (parentheses, quotes)
Plug 'tpope/vim-surround'

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
"Plug 'dodie/vim-disapprove-deep-indentation'

Plug 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_keys = "aoeidtn;,.pyfgcrl/@'qjkxbmwvzuhs-" " programmer dvorak version of the default

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap S <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>w <Plug>(easymotion-w)
map <leader>b <Plug>(easymotion-b)
map <leader>e <Plug>(easymotion-e)

" auto resize active window
Plug 'roman/golden-ratio'

" insert UUIDs
" use :NuuidAll to replace all instances of nuuid and nguid
Plug 'kburdett/vim-nuuid'
let g:nuuid_no_mappings = 1


" COMPLETION
Plug 'roxma/nvim-completion-manager'
Plug 'Shougo/neco-vim'

" LINTING
let g:ale_linters_install = 'sudo apt-get install -y tidy shellcheck npm python3-flake8 python3-pip yamllint && pip3 install vint proselint neovim; sudo npm install -g xo jshint htmlhint stylelint'
Plug 'w0rp/ale', {'do': g:ale_linters_install}
let g:ale_linters = {
\	'rust': ['rls'],
\	'text': ['proselint'],
\	'markdown': ['proselint'],
\	'gitcommit': ['proselint'],
\}
let g:ale_sh_shellcheck_options = '-x'


" WRITING / PROSE
" emoji
Plug 'junegunn/vim-emoji'
" for writing
Plug 'junegunn/vim-journal'
Plug 'vimwiki/vimwiki', {'for': ['vimwiki', 'markdown', 'text']}
nmap <Leader>W <Plug>VimwikiTabIndex
nmap <Leader>d <Plug>VimwikiTabMakeDiaryNote
" distraction free writing
Plug 'junegunn/goyo.vim'
" only highlight current paragragh
Plug 'junegunn/limelight.vim'
Plug 'Konfekt/vim-guesslang' "guess the language for spell checking
let g:guesslang_langs = [ 'en_US', 'nl_NL', 'nl' ]
augroup spell
autocmd FileType text,markdown,mail,gitcommit setlocal spell
autocmd FileType help setlocal nospell
augroup END

" RUST
" highlighting for rust
Plug 'rust-lang/rust.vim', {'for': 'rust'}
" highlighting for Cargo.toml
Plug 'cespare/vim-toml', {'for': 'toml'}
" rust completion for nvim-completion-manager
Plug 'roxma/nvim-cm-racer'
" completion using racer
Plug 'racer-rust/vim-racer', {'for': 'rust', 'do': 'cargo install racer'}
let g:racer_experimental_completer = 1
"set hidden
" plugin needs to know where it can find racer
let g:racer_cmd = '/home/vince/.cargo/bin/racer'
augroup rust
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
augroup END



" PYTHON
Plug 'vim-scripts/indentpython.vim' , {'for': 'python'} "better indent detection
augroup python
" since the body of a class method requires two indents, that leaves 5 for use
" within the function body
au FileType python set tabstop=4 expandtab shiftwidth=4
au FileType python let g:LookOfDisapprovalTabThreshold=7 | let g:LookOfDisapprovalSpaceThreshold=(&tabstop*7)
" default is E121,E123,E126,E226,E24,E704,W503,W504
au FileType python let b:ale_python_flake8_options = '--max-line-length=100 --ignore=E221,E241'
augroup END

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

" ELIXIR
Plug 'elixir-editors/vim-elixir', {'for': 'elixir'}
au FileType elixir set tabstop=4
au FileType elixir let g:LookOfDisapprovalTabThreshold=10000 | let g:LookOfDisapprovalSpaceThreshold=(&tabstop*10000)

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
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

colorscheme hybrid_material
set background=dark
augroup syntaxrange
autocmd Syntax * call SyntaxRange#Include('Examples:$', '("""|\\n\\n)$', "python")
augroup END
