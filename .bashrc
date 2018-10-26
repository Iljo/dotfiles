#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias tree='tree -C'
PS1='[\u@\h \W]\$ '

export EDITOR=vim
PATH=$PATH:~iljo/.local/bin:~iljo/Programming/android-sdk-linux/platform-tools:~iljo/Programming/android-sdk-linux/tools
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export PATH

man() {
    env LESS_TERMCAP_mb=$(printf "\e[1;31m") \
	LESS_TERMCAP_md=$(printf "\e[1;31m") \
	LESS_TERMCAP_me=$(printf "\e[0m") \
	LESS_TERMCAP_se=$(printf "\e[0m") \
	LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
	LESS_TERMCAP_ue=$(printf "\e[0m") \
	LESS_TERMCAP_us=$(printf "\e[1;32m") \
	man "$@"
}

source  ~/.git-completion.bash

# These variables are reflected to xsession because we start x from the bash. So bash is the parent process of X session, 
# and child processes inherit environment variables from their parents
#export GDK_SCALE=1.6
#export GDK_DPI_SCALE=1.6
#export QT_AUTO_SCREEN_SCALE_FACTOR=1
