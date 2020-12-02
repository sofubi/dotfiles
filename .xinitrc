#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# # init keyring
# eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)

# # export keyring globals
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

# # override style for QT applications
export QT_STYLE_OVERRIDE=gtk

# # notifs
# /usr/bin/dunst > /dev/null 2>&1 &

# # compositor
# /usr/bin/picom --experimental-backends -b

# # monitor layout
# /home/sofubi/.screenlayout/default.sh

# # geoclue2
# /usr/lib/geoclue-2.0/demos/agent &

# # pywal
# /usr/bin/wal -R

# # flameshot
# /usr/bin/flameshot &

# # redshift
# /usr/bin/redshift &

# # status
# # while true; do
# # 	xsetroot -name "$( date +"%F %R" )"
# # 	sleep 1m 
# # done &

# # screenlock
# xautolock -time 10 -locker "betterlockscreen -l blur --off 3" -nowlocker "betterlockscreen -l blur --off 3" &

# exec wm
exec i3
