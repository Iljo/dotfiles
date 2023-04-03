#
# ~/.bashrc
#

alias dgit='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias tree='tree -C'
alias grep='grep --color'
alias nsxiv='nsxiv -sf -b'
alias nv='nvim'

PS1='\[\e[0;32m\]\u@\h\[\e[m\] \[\e[1;34m\]\W\[\e[m\]\[\e[1;33m\] $\[\e[m\] '

export EDITOR=nvim
PATH=$PATH:~/.local/bin:~/Programming/android-sdk/platform-tools:~/Programming/android-sdk/tools
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

