" PYTHON
Plug 'vim-scripts/indentpython.vim' , {'for': 'python'} "better indent detection
" nvim completion manager has built-in completion support for python
Plug 'roxma/nvim-completion-manager', {'for': 'python', 'do': 'sudo pip install jedi'}

augroup python
    " since the body of a class method requires two indents, that leaves 5 for use
    " within the function body
    au FileType python set tabstop=4 expandtab shiftwidth=4
augroup END

