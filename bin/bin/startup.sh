#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

udiskie -t >& /dev/null &

gammastep >& /dev/null &

mako >& /dev/null &

syncthing-gtk >& /dev/null &

dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway >& /dev/null &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 >& /dev/null &
