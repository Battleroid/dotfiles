xrdb -load ~/.Xresources
volti &
urxvtd -q -o -f &
sh ~/.fehbg &
udiskie --tray --automount &
rofi -key-run Alt_L+d &
twmnd &
wicd-gtk -t &
xautolock -locker /home/casey/bin/lock.sh -notify 60 &
seafile-applet &
redshift-gtk &

exec /usr/bin/i3
