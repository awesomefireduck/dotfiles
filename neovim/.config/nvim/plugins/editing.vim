" EDITING
if has('nvim')
    " edit browser text fields with neovim
    Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
    let g:ghost_autostart = 1
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
"map <leader>w <Plug>(easymotion-w)
map <leader>b <Plug>(easymotion-b)
map <leader>e <Plug>(easymotion-e)

" auto resize active window
Plug 'roman/golden-ratio'

" insert UUIDs
" use :NuuidAll to replace all instances of nuuid and nguid
Plug 'kburdett/vim-nuuid'
let g:nuuid_no_mappings = 1
