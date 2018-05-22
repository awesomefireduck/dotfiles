#!/bin/bash
# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

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

# include .bashrc if it exists
if [ -e "$HOME/.bashrc" ]; then
. "$HOME/.bashrc"
fi
