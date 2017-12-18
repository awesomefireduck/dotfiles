" RUST
" highlighting for rust
Plug 'rust-lang/rust.vim', {'for': 'rust'}
" highlighting for Cargo.toml
Plug 'cespare/vim-toml', {'for': 'toml'}
" rust completion for nvim-completion-manager
Plug 'roxma/nvim-completion-manager'
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
