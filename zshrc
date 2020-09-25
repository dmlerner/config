function va() {
  echo "$@"
  nvim $("$@")
}

#unalias s
alias s='python3 ~/gdrive/config/s.py'

function hdn() {
  hg diff -r p4head | s 'diff --git.*google3/(.*)'
}

#unalias v
function _v() {
  g4d
  hdn | xargs nvim
}
alias v=_v

function jt() {
  p=$(pwd)
  [[ $p =~ javatests ]] && cd $(pwd | rg '/(javatests)/' -r '/java/')
  [[ $p =~ java/ ]] && cd $(pwd | rg '/(java)/' -r '/javatests/')
}


function parsecl() {
  echo "$1" | s '(.*cl/)?(\d+)' '$2'
}

function g4cl() {
  clnum=$(parsecl $1)
  stubby --proto2 call blade:codereview-rpc CodereviewRpcService.GetChangelist "changelist_number: $clnum"
}

function clws() {
  g4d $(g4cl $1 | s 'client: (.*?):(.*?):' '@2')
}
alias cm='hg commit --same-cl -m '
#alias bb='blaze build :all '
#alias bbk='blaze build :all -k '
function bb() {
  $SCRIPTS/keep-build-cleaning-and-blaze-build.sh :all
}
alias bt='blaze test :all '
alias vl='cat out | s "(/usr.*test.log)" | xargs nvim'
HOST='davidlerner1.irv.corp.google.com'
alias c='ssh $HOST -Y'
function C() {
  ~/gdrive/scripts/auth-refresh-gtunnel.py $HOST
  ssh $HOST -Y
}
alias hg=chg
function lo () {
  sh $CONFIG/laptoponly.sh
}
function lu () {
  sh $CONFIG/usb.zsh
}
