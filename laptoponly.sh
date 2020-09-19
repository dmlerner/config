carbon=''
foxconn=''
verbose=''

verbose='--verbose'
carbon='--output eDP-1 --mode 3840x2160'


cmd="xrandr $carbon --primary $verbose"
echo $cmd
$cmd
echo '...'
