#!/bin/bash
# check if user is connected over ssh
if [ ! -z "$TMUX" ]; then
  SESSION_TYPE=remote/tmux
elif [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  SESSION_TYPE=remote/ssh
# many other tests omitted
else
  case $(ps -o comm= -p $PPID) in
    sshd|*/sshd) SESSION_TYPE=remote/ssh;;
  esac
fi
case "$SESSION_TYPE" in
	"remote/ssh")
	if [ -f ~/.config/bash/tmux ]; then
		. ~/.config/bash/tmux
	fi
	run_tmux
esac

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

if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi

if [ -f ~/.bashrc ]; then . ~/.bashrc; fi


export PATH="$HOME/.cargo/bin:$PATH"
