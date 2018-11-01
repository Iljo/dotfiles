#nvidia-settings -l &
xset b off &
xrdb -merge ~/.Xdefaults &
#xrandr --output DP1 --primary --mode 1920x1200 --pos 1600x0 --rotate normal --output LVDS1 --mode 1600x900 --pos 0x300 --rotate normal &
#xrandr --output VIRTUAL1 --off --output DP1 --primary --mode 3840x2160 --pos 0x0 --rotate normal --output LVDS1 --off --output VGA1 --off &
#xrandr --output VIRTUAL1 --off --output DP1 --primary --mode 3840x2160 --pos 1600x0 --rotate normal --output LVDS1 --mode 1600x900 --pos 0x300 --rotate normal --output VGA1 --off &
xrandr --output VIRTUAL1 --off --output eDP1 --mode 2560x1440 --pos 0x720 --rotate normal --output DP1 --off --output HDMI2 --primary --mode 3840x2160 --pos 2560x0 --rotate normal --output HDMI1 --off --output DP2 --off
xrandr --dpi 163 &
#xrandr --dpi 210 &
#xrandr --dpi 110 &
#xrandr --dpi 123 &
nitrogen --restore &
xbindkeys &
exec i3 
