import os
import subprocess
from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook, extension
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal


@hook.subscribe.startup_once
def autostart():
    script = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call(script)


mod = "mod4"
terminal = guess_terminal()

keys = [
    Key([mod], "d",               lazy.run_extension(extension.DmenuRun(dmenu_prompt=">"))),
    Key([mod], "i",               lazy.run_extension(extension.WindowList())),

    Key([mod], "Return",          lazy.spawn(terminal)),

    Key([mod], "w",               lazy.window.kill()),
    Key([mod], "space",           lazy.window.toggle_floating()),
     
    Key([mod], "h",               lazy.layout.left()),
    Key([mod], "j",               lazy.layout.down()),
    Key([mod], "k",               lazy.layout.up()),
    Key([mod], "l",               lazy.layout.right()),

    Key([mod, "shift"], "h",      lazy.layout.swap_left()),
    Key([mod, "shift"], "l",      lazy.layout.swap_right()),
    Key([mod, "shift"], "j",      lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k",      lazy.layout.shuffle_up()),

    Key([mod, "control"], "h",    lazy.layout.shrink()),
    Key([mod, "control"], "l",    lazy.layout.grow()),
    Key([mod], "n",               lazy.layout.reset()),
    Key([mod, "shift"], "n",      lazy.layout.maximize()),

    Key([mod], "Tab",             lazy.next_layout()),
    Key([mod, "shift"], "Tab",    lazy.prev_layout()),
    Key([mod, "shift"], "Return", lazy.layout.toggle_split()),

    Key([mod, "control"], "r",    lazy.restart()),
    Key([mod, "control"], "q",    lazy.shutdown()),

    Key([mod], "r",               lazy.spawncmd()),

    Key([mod], "x",               lazy.spawn('xautolock -locknow'))
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=False),
            desc="Switch to & move focused window to group {}".format(i.name)),
    ])

layouts = [
    layout.MonadTall(border_width=1,
                     single_border_width=0,
                     margin=10,
                     single_margin=0,
                     max_ratio=0.90,
                     min_ratio=0.10,),
    layout.MonadWide(border_width=1,
                     single_border_width=0,
                     margin=10,
                     single_margin=0,
                     max_ratio=0.90,
                     min_ratio=0.10,),
    layout.Max(),
    layout.Zoomy(),
]

widget_defaults = dict(
    font='mono',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(scale=0.6),
                widget.AGroupBox(),
                widget.Mpris2(
                    name="spotify",
                    objname="org.mpris.MediaPlayer2.spotify"
                ),
                widget.Spacer(),
                widget.WindowName(),
                widget.Systray(),
                widget.Clock(format='%Y-%m-%d %a %H:%M'),
            ],
            20,
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(scale=0.6),
                widget.AGroupBox(),
                widget.Mpris2(
                    name="spotify",
                    objname="org.mpris.MediaPlayer2.spotify"
                ),
                widget.Spacer(),
                widget.WindowName(),
                widget.Systray(),
                widget.Clock(format='%Y-%m-%d %a %H:%M'),
            ],
            20,
        ),
    )
]

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(title='Quit and close tabs?'),
        Match(wm_type='utility'),
        Match(wm_type='notification'),
        Match(wm_type='toolbar'),
        Match(wm_type='splash'),
        Match(wm_type='dialog'),
        Match(wm_class='file_progress'),
        Match(wm_class='confirm'),
        Match(wm_class='dialog'),
        Match(wm_class='download'),
        Match(wm_class='error'),
        Match(wm_class='notification'),
        Match(wm_class='splash'),
        Match(wm_class='toolbar'),
        Match(wm_class='confirmreset'),  # gitk
        Match(wm_class='makebranch'),  # gitk
        Match(wm_class='maketag'),  # gitk
        Match(wm_class='ssh-askpass'),  # ssh-askpass
        Match(title='branchdialog'),  # gitk
        Match(title='pinentry'),  # GPG key password entry
    ],
)
auto_fullscreen = False
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wmname = "LG3D"
