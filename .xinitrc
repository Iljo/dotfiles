xset b off &
picom --xrender-sync-fence &
xrdb -merge ~/.Xdefaults &
xrandr --dpi 163 &
nitrogen --restore &
xbindkeys &
greenclip daemon &
exec i3 

