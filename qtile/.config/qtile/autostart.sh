#!/bin/sh

# Autostart script for Qtile

# Set Functions

# Functions

cmd_exist() { unalias "$1" >/dev/null 2>&1 ; command -v "$1" >/dev/null 2>&1 ; }
__kill() { kill -9 "$(pidof "$1")" >/dev/null 2>&1 ; }
__start() { sleep 1 && "$@" >/dev/null 2>&1 & }
__running() { pidof "$1" > /dev/null 2>&1 ; }


# Apps to autostart

# Compositor

if cmd_exist picom ; then
  __kill picom
  __start picom --experimental-backends
fi


# Auth dialog

if [ -f /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 ]; then
  __kill polkit-gnome-authentication-agent-1
  __start /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
fi

# Notifications

if cmd_exist dunst ; then
  __kill dunst
  __start dunst
fi

# Wallpaper

if cmd_exist nitrogen ; then
  __kill nitrogen
  __start nitrogen --restore
fi

# Geoclue

if [ -f /usr/lib/geoclue-2.0/demos/agent ]; then
  __kill geoclue-2
  __start /usr/lib/geoclue-2.0/demos/agent
fi

# F.Lux

if cmd_exist redshift ; then
  __kill redshift
  __start redshift
fi

# Autolock

if cmd_exist xautolock ; then
  __kill xautolock
  __start xautolock -time 10 -locker "betterlockscreen -l" -nowlocker "betterlockscreen -l"
fi
