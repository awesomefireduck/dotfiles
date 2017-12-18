#!/bin/bash
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

find_abs_path() {
	local target_file phys_dir
	target_file="$1"

	cd "$(dirname $target_file)"
	target_file="$(basename $target_file)"

	# Iterate down a (possible) chain of symlinks
	while [ -L "$target_file" ]
	do
		target_file="$(readlink $target_file)"
		cd "$(dirname $target_file)"
		target_file="$(basename $target_file)"
	done

	# Compute the canonicalized name by finding the physical path
	# for the directory we're in and appending the target file.
	phys_dir="$(pwd -P)"
	echo "$phys_dir/$target_file"
}


bash_abs_path="$(dirname "$(find_abs_path "${BASH_SOURCE[0]}" )")"
bash_config_dir="${bash_abs_path}/.config/bash"

source "${bash_config_dir}/settings"

case "$session_type" in
	"remote/ssh")
	if [ -f ~/.config/bash/tmux ]; then
		. ~/.config/bash/tmux
	fi
	run_tmux
esac

source "${bash_config_dir}/path"
source "${bash_config_dir}/aliases"
source "${bash_config_dir}/completion"
source "${bash_config_dir}/libraries"
source "${bash_config_dir}/prompt"

echo "BASHRC DONE"
