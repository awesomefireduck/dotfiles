#!/bin/bash
# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

find_abs_path() {
	local TARGET_FILE PHYS_DIR RESULT
	TARGET_FILE="$1"

	cd "$(dirname $TARGET_FILE)"
	TARGET_FILE="$(basename $TARGET_FILE)"

	# Iterate down a (possible) chain of symlinks
	while [ -L "$TARGET_FILE" ]
	do
		TARGET_FILE="$(readlink $TARGET_FILE)"
		cd "$(dirname $TARGET_FILE)"
		TARGET_FILE="$(basename $TARGET_FILE)"
	done

	# Compute the canonicalized name by finding the physical path
	# for the directory we're in and appending the target file.
	PHYS_DIR="$(pwd -P)"
	RESULT="$PHYS_DIR/$TARGET_FILE"
	echo "$RESULT"
}

bash_abs_path="$(dirname "$(find_abs_path "${BASH_SOURCE[0]}" )")"

# include .bashrc if it exists
if [ -f "${bash_abs_path}/.bashrc" ]; then
    . "${bash_abs_path}/.bashrc"
fi

# set PATH so it includes user's private bin directory
export PATH="$HOME/bin:$HOME/.cargo/bin:$PATH"

echo "BASH PROFILE DONE"
