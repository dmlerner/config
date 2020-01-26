

ZSH_DISABLE_COMPFIX=true
export PATH=~/.local/bin:~/Dropbox/scripts/cli:$PATH
export WORKON_HOME=~/.envs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source ~/.local/bin/virtualenvwrapper.sh
typeset -g ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE='100'
ZSH_THEME="powerlevel9k/powerlevel9k"
if test -f ~/.google-desktop; then
	echo 'loading google-desktop'
	unalias zz
	unalias d
	unalias s
	alias ld="pactl -- set-sink-volume $(pactl list sinks | grep Sink | sed 's/.*#\(.*\)/\1/') +5%"
	alias q="pactl -- set-sink-volume $(pactl list sinks | grep Sink | sed 's/.*#\(.*\)/\1/') -5%"
	xsetroot -solid "#FFFFFF"
	unalias gcl
	alias blaze-run='/home/build/nonconf/google3/devtools/blaze/scripts/blaze-run.sh'
	fpath=($(realpath /google/src/files/head/depot/google3/devtools/blaze/scripts/zsh_completion) $fpath)
	source /etc/bash.bashrc.d/shell_history_forwarder.sh
	POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_citc custom_path)
fi

if test -f ~/.x1; then
	alias d="cd ~/Dropbox"
	alias h='python3 ~/Dropbox/habit3/habit.py'
	alias H='cd ~/Dropbox/habit3'
	alias vh='vim ~/Dropbox/habit3/*.csv'
	alias s='/mnt/c/Program\ Files/SumatraPDF/SumatraPDF.exe'
	export PATH=$PATH:~/Dropbox/scripts:~/Dropbox/scripts/cli
	alias c='/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe'
fi

export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
set -o vi
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir)
export DISPLAY=localhost:0.0



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
export PATH=$PATH:~/.local/bin

plugins=(git common-aliases extract fasd history fzf vi-mode)
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
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
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

alias rv='rm ~/.vim/cache/*.sw*'

function kp {
	kill -9 "$(lsof -i | grep 8898 | awk 'NR==1 {print $2}')";
}
alias willitfit=/google/data/ro/projects/quota_tools/willitfit.par
#alias g="grep -ir --color=always $1 | sort"
function g {
	grep -ir --color=always $1 | sort;
}
function gn { cd;
	cd 'Notes/2019';
	#grep -ir --color=always $1 | sort;
	ack --smart-case $1 --sort-files;
}
alias bbcp-fileutil=/google/data/ro/teams/bbcp/fileutil
alias prodspec='/google/data/ro/teams/prodspec/prodspec'
alias print_prodspec='/google/data/ro/teams/prodspec/print_prodspec'
export EDITOR='vim'
alias dea="/google/data/ro/users/ra/ranma/dea_client.par"
alias csa="cs $1 -f=apphosting"
alias zgrep="grep -m 1 -P -o $1 | head -n 1"
alias lifeguard="/google/data/ro/projects/apphosting/tools/lifeguard.par"
alias admin_session=/google/data/ro/projects/tonic/admin_session
function mkcdir {
	mkdir -p -- "$1" &&
		cd -P -- "$1"
	}
alias prodaccess='prodaccess -g -s --ssh_on_security_key'
alias gp='/usr/bin/python2.7     /google/src/head/depot/google3/apphosting/scripts/tools/gaepools.py'
alias gae_spool_client=/google/data/ro/projects/apphosting/tools/gae_spool_client.sh
alias sandman=/google/data/ro/projects/sandman/sandman.par
alias n='vim ~/Notes/$(python ~/Notes/misc/utils.py)'
#alias N='vim ~/Notes/$(python ~/Notes/utils.py $1)'
alias z='python ~/Notes/utils.py $1'
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
alias vz="vim ~/.zshrc"
alias sz="source ~/.zshrc"
alias sp="source ~/.profile"
#alias vv="vim ~/.vimrc"
alias vv="vim ~/.config/nvim/init.vim"
alias vi="vim ~/.config/i3/config"
alias df="cd ~/Dropbox/dotfiles"
#
#setxkbmap -option caps:swapescape

# $Id: //depot/google3/googledata/corp/puppet/goobuntu/common/modules/shell/files/bash/skel.bashrc#5 $
# xset r rate 250 40
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return;;
esac


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
# setopt -s checkwinsize # broken because zsh, was shopt

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

#if [ "$color_prompt" = yes ]; then
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$\n¯\_(ツ)_/¯ '
## zsh breakage or at least weirdness
#		PS1="¯\_(ツ)_/¯ "
#else
#PS1="¯\_(ツ)_/¯ "
#PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$\n¯\_(ツ)_/¯ '
#fi
#unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
	#    ;;
	#esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=always'
	alias fgrep='fgrep --color=always'
	alias egrep='egrep --color=always'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

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
alias appcfg_over_stubby='/google/data/ro/projects/apphosting/tools/appcfg_over_stubby.par'
alias colab="/google/data/ro/teams/colab/notebook"
alias siscli="/google/data/ro/buildstatic/projects/production/sisyphus/siscli.par"
mycurl () {
	curl -v -H "$(/google/data/ro/projects/perftools/dapper/dapperget)" "$@"
}
alias gaia-to-email='/home/build/static/projects/gaia/gaiaclient/GaiaClient.par --gaia_instance=prod LookupUserByID 0x$(printf "%x" $1)'
alias btcfg=/google/data/ro/projects/bigtable/contrib/btcfg/btcfg
#export DIFF="colordiff -u"
export P4DIFF='colordiff -u'
alias contracts_cli=/google/data/ro/teams/resource-management/contracts_cli.par
export G4MULTIDIFF=0 g4 diff
alias auto_tls="/google/data/ro/projects/apphosting/tools/auto_tls.par"
alias annealing="/google/data/ro/teams/annealing/live/annealing"
eval $(thefuck --alias)
alias get_mint="/google/data/ro/projects/gaiamint/bin/get_mint"
alias vscli='/google/data/ro/teams/annealing/versionstore/live/cli'
alias flex=/usr/bin/flex.par

export PATH=$GOROOT/bin:$PATH
fpath=($HOME/.zsh-functions $fpath)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#alias -s {go,py,proto}=vim
function d {
	#p4 diff --since_commit "$(p4 commitlog | grep ID | awk -v n=${1:-1} 'NR==n {print $3}')";
	commit_line=$(p4 commitlog | grep ID | awk -v n=${1:-1} 'NR==n')
	p4 diff --since_commit "$(echo $commit_line | awk '{print $3}')";
	printf "\n"
	echo $commit_line
}


# Function to switch and save the current path
function cd() {
	builtin cd "$@";
	echo "$PWD" >! ~/.cwd;
}
export cd
alias cwd='cd "$(cat ~/.cwd)"'
cwd
#export GOENV=/usr/local/google/home/davidlerner/.config/go/env
#export GOTOOLDIR="/usr/lib/google-golang/pkg/tool/linux_amd64"
#export GOENV=""

alias hm="(nohup unclutter -idle 0.01 -root & disown) > /dev/null 2>&1"

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$GOPATH:$PATH
export PATH=$PATH:$GOPATH/bin
# move citc; args are source workspace, absolute filepath
# todo: if file deleted in source, delete in target
function mc() {
	cp $(g4 g4d -u davidlerner $1)/$2 $2
}
function s() {
	echo "s/$1/$2/eg"
	perl -p -i -e "s/$1/$2/eg" *
}
alias f1=/google/data/ro/projects/storage/f1/tools/f1-sql
alias cdd=/google/data/ro/projects/chubby/cdd/cdd
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



up-line-or-local-history() {
    zle set-local-history 1
    zle up-line-or-history
    zle set-local-history 0
}
zle -N up-line-or-local-history
down-line-or-local-history() {
    zle set-local-history 1
    zle down-line-or-history
    zle set-local-history 0
}
zle -N down-line-or-local-history
bindkey "^[[A" up-line-or-local-history
bindkey "^[[B" down-line-or-local-history
bindkey "^[[1;5A" up-line-or-history    # [CTRL] + Cursor up
bindkey "^[[1;5B" down-line-or-history  # [CTRL] + Cursor down

alias gr="git remote add origin git@github.com:dmlerner/$1.git; git push -u origin master"
alias yp='python3 -m ynabamazonparser'
#alias c='"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"'
PYTHONDONTWRITEBYTECODE=1
alias t="tree -I '__pycache__|log|*pyc|backups'"

HISTTIMEFORMAT="%d/%m/%y %T "

export PYTHONPATH=~/Dropbox/scripts/mawk/src/:$PYTHONPATH:/usr/lib/python38.zip:/usr/lib/python3.8:/usr/lib/python3.8/lib-dynload:/usr/lib/python3.8/site-packages

alias y='cd ~/Dropbox/scripts/assistantforynab'
alias ll='ls -1 -d ~/Dropbox/scripts/assistantforynab/src/assistantforynab/log/* | tail -n 1'
alias vl='vim "$(ll)"'
alias cl='cat "$(ll)"'
alias sl='cat "$(ll)" | ack'
alias vim='/bin/squashfs-root/usr/bin/nvim'
alias pi='pip3 install --user'
alias ai='sudo apt-get install'
alias p='python3'
alias P='python3 -i'
alias a='python3 -u ~/Dropbox/scripts/cli/my-awk.py'
function poop() {
	awk
}
alias f1='ls | head -n 1'
alias c1='cd $(f1); ls'
alias d1='rm -rf $(f1); popd'
alias dd='pushd; d1'
alias o1='c1; o $(f1)'
alias z1='pushd; mv $(f1) zzz$(f1)'
alias python=python3
alias mawk='python3 -m mawk'
alias m='mawk'
alias mt='python3 ~/Dropbox/scripts/mawk/tests/test.py'
alias mi='python3 -i -m mawk'
