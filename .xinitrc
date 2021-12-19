#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xset b off &
picom --xrender-sync-fence &
xrdb -merge ~/.Xdefaults &
xrandr --dpi 163 &
nitrogen --restore &
xbindkeys &
greenclip daemon &
exec i3 

