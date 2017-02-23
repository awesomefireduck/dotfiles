#find platform
case $(uname) in
	"Darwin") platform="OSX" ;;
	"linux") platform="linux" ;;
	"Linux") platform="linux" ;;
esac

if [[ $platform == 'OSX' ]];
then
	if [ -f $(brew --prefix)/etc/bash_completion ]; then
		. $(brew --prefix)/etc/bash_completion
	fi
	if [[ -f '/Library/Ruby/Gems/2.0.0/gems/tmuxinator-0.8.1/completion/tmuxinator.bash' ]]
	then
		source /Library/Ruby/Gems/2.0.0/gems/tmuxinator-0.8.1/completion/tmuxinator.bash
	fi
fi


if [ -f ~/.cargo/env ]; then . ~/.cargo/env; fi

if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

