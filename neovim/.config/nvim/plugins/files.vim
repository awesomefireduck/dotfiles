" FILES
" file finder using fzf, see https://github.com/junegunn/fzf#as-vim-plugin
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" file finder using fzy. see 'cloudhead/neovim-fuzzy' and jhawthorn/fzy
" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'jhawthorn/fzy', { 'dir': '~/.fzy', 'do': 'make && sudo make install' }
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
