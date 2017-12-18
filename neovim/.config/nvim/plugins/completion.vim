" COMPLETION
Plug 'roxma/nvim-completion-manager'
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <c-c> <ESC>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"complete words from other buffers
Plug 'fgrsnau/ncm-otherbuf'
" for vim script
Plug 'Shougo/neco-vim'
