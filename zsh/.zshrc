#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#	source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
source ~/.zshcolours
source ~/.zshprompt

preexec () {
	# clear all lines below the prompt so that no residual prompt chars are visible in the command output.
	# test: remove this and run echo "a"
	tput il 4
}
precmd () {
	get_exit_code # must be first
}

function get_exit_code {
	export last_exit_code="$?"
}



# otherwise everything fails
setopt PROMPT_SUBST
export PS1="\$(move_to_end)\$(build_prompt)\$(move_cursor)"

source ~/.nix-profile/etc/profile.d/nix.sh
