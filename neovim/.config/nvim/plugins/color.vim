" COLOURS
"Plug 'NLKNguyen/papercolor-theme'
Plug 'kristijanhusak/vim-hybrid-material'
colorscheme hybrid_material
set background=dark
" give paretheses matching colours
Plug 'luochen1990/rainbow'
let g:rainbow_conf = {
	    \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	    \	'ctermfgs': ['fg', '14', '208', '34', '196', '4', '11', '167', '76', '163'],
	    \	'operators': '_,\|(:!^)+\|(:!^)-\|%\|=\|==\|===\|!=\|!==\|<\|>\|:_',
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

autocmd FileType diff RainbowToggleOff
" syntax highlighting within another syntax
"Plug 'inkarkat/vim-ingo-library'
"Plug 'inkarkat/vim-SyntaxRange'
" Highlight and fix trailing whitespace with :FixWhitespace
"Plug 'bronson/vim-trailing-whitespace'
augroup whitespace
    "  au BufEnter nowrite
augroup END

