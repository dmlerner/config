carbon=''
foxconn=''
lg=''
verbose=''

verbose='--verbose'
carbon='--output eDP-1 --mode 3840x2160'
foxconn='--output DP-2 --mode 3840x2160 --pos 0x0 '


#cmd="xrandr $carbon --primary $verbose"
#echo $cmd
#$cmd
echo '...'

cmd="xrandr $carbon --left-of DP-2 --noprimary $foxconn --primary $verbose"
echo $cmd
$cmd
