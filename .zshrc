unalias gd 2&> /dev/null > /dev/null
alias gd='cd /mnt/c/Users/david/google-drive'
gd
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Path to your oh-my-zsh installation.
export ZSH="/home/david/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

HYPHEN_INSENSITIVE="true"
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true" # conflicts the fuck

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
# HIST_STAMPS="mm/dd/yyyy"
alias vim=nvim
EDITOR=nvim
eval $(thefuck --alias)
eval "$(fasd --init auto)"
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  pylint
  #magic-enter
  thefuck
  git
  zsh-syntax-highlighting
  #zsh-autosuggestions # suckssss
  colored-man-pages
  #colorize
  #dirhistory # conflicts my cmder usage of alt
  extract
  fasd
  vi-mode
  autopep8
  zsh-interactive-cd
  #zsh-navigation-tools
)
ZSH_DISABLE_COMPFIX="true"
source $ZSH/oh-my-zsh.sh

export PATH="/home/david/.local/bin:$PATH"
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export DISPLAY=localhost:0.0

alias vv="vim ~/.vimrc"
alias sz="source ~/.zshrc"
alias vz="vim ~/.zshrc"
alias kgo='buildozer android debug deploy run logcat > log.txt'
export PYTHONPATH="${PYTHONPATH}:/mnt/c/Users/david/google-drive/coding"

alias vp='vim *.py **/*.py'
alias p='python3 '
alias pi='python3 -i '
function findmain() {
  python3 -c 'import glob; print("\n".join(glob.glob("**/*main*.py")+glob.glob("*main*.py")))'
}
function m() {
  findmain | xargs python3
}
function mi() {
  python3 -i $(findmain)
}
alias l='vim logs/$(ls logs | tail -n 1)'
alias c='cd /mnt/c/Users/david/google-drive/coding'

alias pap='cd /mnt/c/Users/david/google-drive/coding/papmonitor'
alias paprun='(pap; management-scripts/run.sh)'
alias papkill='(pap; management-scripts/kill.sh)'
alias paptest='(pap; management-scripts/test.sh)'
alias paprestart='(pap; management-scripts/restart.sh)'
function paplog() {
  vim /mnt/c/Users/david/google-drive/coding/papmonitor/papmonitor/logs/$(ls /mnt/c/Users/david/google-drive/coding/papmonitor/papmonitor/logs| tail -n 1)
}
alias w='python3 /mnt/c/Users/david/google-drive/fitness/leanmass/do.py'
alias foo='echo bar > ~/test.txt'
echo f | sudo -S service cron start > /dev/null
alias rgf='rg --files | rg'
alias rv='rm -f /home/david/.local/share/nvim/swap/*.swp'
alias hs='python3 /mnt/c/Users/david/google-drive/coding/homeserver/main.py'

alias gd='cd /mnt/c/Users/david/google-drive'