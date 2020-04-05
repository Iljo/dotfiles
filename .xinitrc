#nvidia-settings -l &
xset b off &
compton &
xrdb -merge ~/.Xdefaults &
xrandr --output eDP1 --primary --mode 2560x1440 --pos 0x720 --rotate normal --output DP1 --mode 3840x2160 --pos 2560x0 --rotate normal --output DP2 --off --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off
xrandr --dpi 163 &
#xrandr --dpi 210 &
#xrandr --dpi 110 &
#xrandr --dpi 123 &
nitrogen --restore &
xbindkeys &
greenclip daemon &
exec i3 
