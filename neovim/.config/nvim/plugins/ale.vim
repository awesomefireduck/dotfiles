" LINTING
let g:ale_linters_install = 'sudo apt-get install -y tidy shellcheck npm python3-flake8 python3-pip yamllint && pip3 install vint proselint neovim; sudo npm install -g xo jshint htmlhint stylelint'
"let g:ale_linters_install = ""

Plug 'w0rp/ale', {'do': g:ale_linters_install}
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {
	    \	'rust': ['rls'],
	    \	'text': ['proselint'],
	    \	'markdown': ['proselint'],
	    \	'gitcommit': ['proselint'],
	    \	'python': ['flake8'],
	    \}
let g:ale_sh_shellcheck_options = '-x'
" default is E121,E123,E126,E226,E24,E704,W503,W504
"let g:ale_python_flake8_options = '--max-line-length=100'
let g:ale_completion_delay=50
"let g:ale_completion_enabled=1
let g:ale_lint_delay=50
" default is E121,E123,E126,E226,E24,E704,W503,W504
let b:ale_python_flake8_executable = 'pipenv'
let g:ale_python_flake8_options = '--max-line-length=100 --ignore=' "E221,E241'
