ZSH_DISABLE_COMPFIX=true
typeset -g ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE='100'
ZSH_THEME="powerlevel10k/powerlevel10k" # using 10k now lol

# cache-path muth must exist
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
# If you only want to complete local directories in git5, uncomment the next line
# export BLAZE_COMPLETION_PACKAGE_PATH=%workspace%nalias zz
if test -f ~/google-desktop; then
	# echo 'loading google-desktop'
	alias ld="pactl -- set-sink-volume $(pactl list sinks | grep Sink | sed 's/.*#\(.*\)/\1/') +5%"
	alias q="pactl -- set-sink-volume $(pactl list sinks | grep Sink | sed 's/.*#\(.*\)/\1/') -5%"
	xsetroot -solid "#FFFFFF"
	alias blaze-run='/home/build/nonconf/google3/devtools/blaze/scripts/blaze-run.sh'
	fpath=($(realpath /google/src/files/head/depot/google3/devtools/blaze/scripts/zsh_completion) $fpath)
	source /etc/bash.bashrc.d/shell_history_forwarder.sh
	source /etc/bash_completion.d/g4d
	POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_citc custom_path)
fi
if test -f ~/google-x1; then
	# echo 'loading google-x1'
	alias ld="pactl -- set-sink-volume $(pactl list sinks | grep Sink | sed 's/.*#\(.*\)/\1/') +5%"
	alias q="pactl -- set-sink-volume $(pactl list sinks | grep Sink | sed 's/.*#\(.*\)/\1/') -5%"
	xsetroot -solid "#FFFFFF"
	alias blaze-run='/home/build/nonconf/google3/devtools/blaze/scripts/blaze-run.sh'
	POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_citc custom_path)
	# don't swap if keyboard plugged in; todo: automate
	# setting if no keybgoard plugged in
	setxkbmap -option caps:swapescape
	# setting if plugged in
	# setxkbmap -option
  # zsh ~/gdrive/config/wfh-monitor.zsh
fi

alias vim=$(which nvim)

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir)


POWERLEVEL9K_CUSTOM_CITC='get_citc'
POWERLEVEL9K_CUSTOM_CITC_BACKGROUND='255'
POWERLEVEL9K_CUSTOM_CITC_FOREGROUND='208'

POWERLEVEL9K_TIME_BACKGROUND='255'
POWERLEVEL9K_TIME_FOREGROUND='232'

POWERLEVEL9K_CUSTOM_PATH='get_path'
POWERLEVEL9K_CUSTOM_PATH_BACKGROUND='255'
POWERLEVEL9K_CUSTOM_PATH_FOREGROUND='232'
POWERLEVEL9K_DIR_HOME_BACKGROUND='255'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='255'
POWERLEVEL9K_DIR_ETC_BACKGROUND='255'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='255'


# What to show in the tail of prompt
# Will show command status and time
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_COLOR_SCHEME='dark'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='255'
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='255'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='232'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='208'
#POWERLEVEL9K_DIR_BACKGROUND='208'

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode time)
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

plugins=(common-aliases extract fasd history fzf vi-mode )

export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
### todo: make zsh-completions work especially for google
#plugins=(git alias-tips common-aliases extract fasd history zsh-completions fzf vi-mode)
# Path to your oh-my-zsh installation.
if [[ -f /etc/bash_completion.d/g4d ]]; then
	. /etc/bash_completion.d/p4
	. /etc/bash_completion.d/g4d
fi

#set ZLE=true
export KEYTIMEOUT=1
#export FZF_BASE=/usr/bin/fzf

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true


# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

# HIST_STAMPS="mm/dd/yyyy"

#eval "$(fasd --init auto)"
#autoload -U compinit && compinit
# better zz from fasd
function zz() {
	local dir
	dir="$(fasd -Rdl "$*" | fzf --query="$*" -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}
# Usage: fv file pattern
function fv() {
	local file
	file="$(fzf --exact --height 40% --reverse --query="$1"  --select-1 --exit-0)"
	[[ -n "$file" ]] && vim "$file"
}


setopt prompt_subst  # enable command substitution (and other expansions) in PROMPT

alias rv='rm -f ~/.vim/cache/*.sw*; rm -f /var/tmp/*.swp'

function gn { cd;
	cd "$GDRIVE/notes/2020";
	ack --smart-case $1 --sort-files;
}
alias bbcp-fileutil=/google/data/ro/teams/bbcp/fileutil
alias prodspec='/google/data/ro/teams/prodspec/prodspec'
alias print_prodspec='/google/data/ro/teams/prodspec/print_prodspec'
export EDITOR='vim'
alias admin_session=/google/data/ro/projects/tonic/admin_session
function mkcdir {
	mkdir -p -- "$1" &&
		cd -P -- "$1"
	}
alias prodaccess='prodaccess -g -s --ssh_on_security_key'
alias n='python "$GDRIVE/config/todays-notes.py"'
alias dirs="dirs -v"
alias ........="cd ../../../../../../.."
alias .......="cd ../../../../../.."
alias ......="cd ../../../../.."
alias .....="cd ../../../.."
alias ....="cd ../../.."
alias ...="cd ../.."
alias ..="cd .."
alias py=" /google/data/ro/projects/g3python/g3python --deps //pyglib --deps //pyglib:gfile --deps //third_party/py/matplotlib --deps //third_party/py/Tkinter --deps //third_party/py/numpy --deps //third_party/py/pandas --deps //third_party/py/scipy --deps //third_party/py/sklearn --deps //third_party/py/statsmodels --deps //analysis/common/pandas:bigtable --deps //analysis/common/pandas:borgmon --deps //analysis/common/pandas:columnio --deps //analysis/common/pandas:dremel --deps //analysis/common/pandas:materialize --deps //bigtable/contrib/python --deps //concurrent/futures:concurrent_futures  $@"
alias b="xcalib -i -a"
alias sz="source ~/.zshrc"
alias sp="source ~/.profile"
alias rc="vim ~/.bashrc"

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return;;
esac

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color|xterm-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias vdir='vdir --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
# broken because zsh
#
#if ! setopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export P4DIFF='colordiff -u'
export G4MULTIDIFF=0 g4 diff
eval $(thefuck --alias)
alias get_mint="/google/data/ro/projects/gaiamint/bin/get_mint"

fpath=($HOME/.zsh-functions $fpath)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias -s {go,py,proto,txt}=vim
function d {
	commit_line=$(p4 commitlog | grep ID | awk -v n=${1:-1} 'NR==n')
	p4 diff --since_commit "$(echo $commit_line | awk '{print $3}')";
	printf "\n"
	echo $commit_line
}

# Function to switch and save the current path
function cd() {
	builtin pushd "$@";
	echo "$PWD" >! ~/.cwd;
}
export cd
alias cwd='cd "$(cat ~/.cwd)"'
cwd

alias hm="(nohup unclutter -idle 0.01 -root & disown) > /dev/null 2>&1"

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$GOPATH:$GOBIN:$PATH

alias f1=/google/data/ro/projects/storage/f1/tools/f1-sql
alias o='cmd.exe /C start'

function get_citc() {
	if [[ $PWD =~ '/google/src/cloud/[^/]+/(.+)/google3(.*)' ]]; then
		print -n "${match[1]}"
	fi
}

function get_path() {
	if [[ $PWD =~ '/google/src/cloud/[^/]+/(.+)/google3(.*)' ]]; then
		print -n "${match[2]}"
	fi
	if [[ $PWD =~ '/usr/local/google/home/davidlerner(.*)' ]]; then
		print -n "~${match[1]}"
	fi
}

function gc() {
	pkill ssh-agent
	eval $(ssh-agent -s)
	gcert
}
source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

alias mt='g4d; cd ./attribution/midtier' # todo: preserve pushd
alias vm='m; vim'
alias jm='g4d; cd ./java/com/google/attribution/midtier'
alias vjm='jm; vim'
alias vz='vim ~/.zshrc'
alias vv='vim ~/.vimrc'
#alias builditall="blaze build \$(g4 pending -l | grep '//depot' | sed 's:.*//depot/google3/::' | sed 's:#.*::' | grep -v BUILD) --compile_one_dependency"
#alias testitall="g4 status | awk -F'#' '{print \$1}' | awk -F'/' 'BEGIN {OFS = FS} NF{NF--};{\$1=\$2=\$3=\$4=\"\"; sub(\"////\",\"\"); print"
alias vt='vim --cmd term --cmd star'
alias sd='ssh davidlerner1.irv.corp.google.com -t "/usr/bin/zsh -l"'
alias sc='ssh davidlerner.c.googlers.com  -t "/usr/bin/zsh -l"'
GDRIVE="$(realpath ~/gdrive)"
alias scripts='cd "$GDRIVE/scripts"'
alias config='cd "$GDRIVE/config"'
alias host="cat /proc/sys/kernel/hostname"
alias m='python -m mawk'
function hdn() { # hg diff names only
	hg diff -c ${1:-.} | no
}
function hdpn() { # hg diff p4head names only
	hg diff -r p4head | no
}
function no() {
	m - -rm 'V&r"diff.*?google3/([^ ]*)"&' -R '\n'
}
alias hgr='hg resolve --tool vim_1pane --all'
alias pastebin='/google/src/head/depot/eng/tools/pastebin'
unsetopt beep
alias python=python3
function jt {
	cmd='V&"/java(?:tests)*"& ?"javatests" in V : "/java" : "/javatests":&'
	cd "$(pwd | m - -r10 $cmd)"
}
function log {
	cmd=$(cat testlog | col -b | m - -r 'total actions' -ri 0 -rx -fx | m - -rp '"see" in V' -fp '"test.log" in V'  -ft 'V[:-1]')
	vim $cmd
}
alias t='vim "$GDRIVE/config/todo.txt"'
alias ide='/opt/intellij-ce-stable/bin/idea.sh'
alias vim='/usr/bin/nvim'
alias remote='zsh "$GDRIVE/config/remote.zsh"'
alias hv='vim $(hdpn)'
export PATH="${PATH}:/google/data/ro/teams/devtools/editors/live"
alias i='sudo apt install'

# better zz from fasd
unalias zz
function zz() {
  local dir
  dir="$(fasd -Rdl "$*" | fzf --query="$*" -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}
