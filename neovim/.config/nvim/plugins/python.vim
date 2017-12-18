" PYTHON
Plug 'vim-scripts/indentpython.vim' , {'for': 'python'} "better indent detection
" nvim completion manager has built-in completion support for python
Plug 'roxma/nvim-completion-manager', {'for': 'python', 'do': 'sudo pip install jedi'}

augroup python
    " since the body of a class method requires two indents, that leaves 5 for use
    " within the function body
    au FileType python set tabstop=4 expandtab shiftwidth=4
    au FileType python let g:LookOfDisapprovalTabThreshold=7 | let g:LookOfDisapprovalSpaceThreshold=(&tabstop*7)
    " default is E121,E123,E126,E226,E24,E704,W503,W504
    au FileType python let b:ale_python_flake8_options = '--max-line-length=100 --ignore=E221,E241'
augroup END

