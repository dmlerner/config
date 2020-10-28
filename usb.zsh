carbon=''
foxconn=''
lg=''
verbose=''

x='DP-1'
w='3840'
res="$w"'x2160'
pos="$w"'x0'
#pos="3841x0"

verbose='--verbose'
carbon='--output eDP-1 --mode 3840x2160 --pos 0x0 --primary'
foxconn="--output $x --mode $res --pos 3841x0"
#foxconn='--output DP-1 --mode 1920x1080 --pos 1920x0 '
#foxconn='--output DP-1 --mode 1680x1050 --pos 1680x1050 '


#cmd="xrandr $carbon --primary $verbose"
#echo $cmd
#$cmd
echo '...'

cmd="xrandr $carbon $foxconn $verbose"
echo $cmd
$cmd
