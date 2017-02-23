# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return;;
esac

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

#find platform
case $(uname) in
	"Darwin") platform="OSX" ;;
	"linux") platform="linux" ;;
	"Linux") platform="linux" ;;
esac

bash_abs_path="$(dirname "$(find_abs_path "${BASH_SOURCE[0]}" )")"

for file in "options" "env" "$(hostname)" "aliases" "completion" "colours" "prompt" ;
do
	if [[ -e "$bash_abs_path/.config/bash/$file" ]];
	then
		source "$bash_abs_path/.config/bash/$file"
	fi
done

