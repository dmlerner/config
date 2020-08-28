carbon=''
foxconn=''
lg=''
verbose=''

verbose='--verbose'
carbon='--output eDP-1 --off'
lg='--output HDMI-1 --mode 3840x2160 --rotate left --left-of DP-2'
#foxconn='--output DP-2 --mode 1920x1080 --primary --pos 0x0 '
foxconn='--output DP-2 --mode 3840x2160 --primary'


cmd="xrandr $carbon $lg --primary $verbose"
echo $cmd
$cmd

cmd="xrandr $carbon $foxconn $lg $verbose"
echo $cmd
$cmd
