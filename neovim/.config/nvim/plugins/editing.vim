" EDITING
if has('nvim')
    " edit browser text fields with neovim
    Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
    let g:ghost_autostart = 0
    augroup ghost
	au!
	autocmd BufNewFile,BufRead *stackexchange.com*	set filetype=markdown   | set spell   | set spelllang=en
	autocmd BufNewFile,BufRead *stackoverflow.com*	set filetype=markdown   | set spell   | set spelllang=en
	autocmd BufNewFile,BufRead *github.com*		set filetype=markdown   | set spell   | set spelllang=en
	autocmd BufNewFile,BufRead *gitlab.com*		set filetype=markdown   | set spell   | set spelllang=en
	autocmd BufNewFile,BufRead *service-now.com*	set filetype=javascript | set nospell
    augroup END
endif
"easily add print statements
Plug 'mptre/vim-printf'
augroup vim_printf
    autocmd FileType vim let b:printf_pattern = 'echom printf("%s", %s)'
    autocmd FileType rust let b:printf_pattern = 'println!("%s {}", %s);'
    autocmd FileType php let b:printf_pattern = 'error_log(var_export(["%s" => %s], true);'
    autocmd FileType javascript let b:printf_pattern = 'console.debug("%s: ", %s);'
    autocmd FileType elixir let b:printf_pattern = 'IO.puts " %s: #{%s}"'
    autocmd FileType python let b:printf_pattern = 'print("{}".format(%s))'
augroup END
nnoremap <Leader>p :Printf<CR>
" auto insert matching parens, brackets and quotes
"Plug 'jiangmiao/auto-pairs'
"Plug 'Raimondi/delimitMate'
" auto align titles
Plug 'guywald1/vim-prismo'
" surround words with anything (parentheses, quotes)
Plug 'tpope/vim-surround'

" strip trailing whitespace on edited lines only
Plug 'thirtythreeforty/lessspace.vim'
let g:lessspace_blacklist = ['md', 'markdown', 'whitespace']

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



