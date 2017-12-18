" ELIXIR
Plug 'elixir-editors/vim-elixir', {'for': 'elixir'}
au FileType elixir set tabstop=4
au FileType elixir let g:LookOfDisapprovalTabThreshold=10000 | let g:LookOfDisapprovalSpaceThreshold=(&tabstop*10000)
