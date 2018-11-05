" RUST
" highlighting for rust
let g:install_rustup_and_rust = 'curl https://sh.rustup.rs -sSf > /tmp/rustup.sh
			\ && sh /tmp/rustup.sh --default-toolchain none --no-modify-path -y
			\ && rustup self update
			\ && rustup toolchain install nightly
			\ && rustup default nightly'

Plug 'rust-lang/rust.vim', {'for': 'rust'}
", 'do': g:install_rustup_and_rust }
let g:rust_recommended_style=1
let g:rust_bang_comment_leader=0
let g:rustfmt_autosave=1
" highlighting for Cargo.toml
Plug 'cespare/vim-toml', {'for': 'toml'}
" rust completion for nvim-completion-manager
"Plug 'roxma/nvim-completion-manager'
Plug 'roxma/nvim-cm-racer'
" completion using racer
Plug 'racer-rust/vim-racer', {'for': 'rust', 'do': 'rustup run nightly cargo install -f racer'}
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
