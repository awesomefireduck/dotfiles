" COMPLETION
"Plug 'autozimu/LanguageClient-neovim'
let g:LanguageClient_autoStart=0
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'go': ['go-langserver'] }

Plug 'roxma/nvim-completion-manager'
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <c-c> <ESC>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"complete words from other buffers
Plug 'fgrsnau/ncm-otherbuf'
" for vim script
Plug 'Shougo/neco-vim'
