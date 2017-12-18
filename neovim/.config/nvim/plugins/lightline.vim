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
