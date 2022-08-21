# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# -*- coding: utf-8 -*-
import re
import socket
from libqtile import qtile
from libqtile.config import Click, Drag, Group, KeyChord, Key, Match, Screen
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from typing import List  # noqa: F401from typing import List  # noqa: F401

import os
import subprocess

@hook.subscribe.startup
def autostart():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])


mod = "mod4"
terminal = "st"
web = "firefox"


keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "b", lazy.spawn(web), desc="launch firefox"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "shift"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawn("dmenu_run -p RUN: -h 22"), desc="Run dmenu"),
    Key([mod], "d", lazy.spawn("rofi -show drun"), desc="Run rofi"),
    Key([mod], "e", lazy.spawn("emacs"), desc="Run emacs"),
    Key([mod, "shift"], "e", lazy.spawn("./projects/code/scripts/dmscripts/dmconf"), desc="Run edit config script"),
    Key([mod], "n", lazy.spawn("nitrogen"), desc="Run nitrogen"),
    Key([mod], "s", lazy.spawn("spotify"), desc="Run spotify"),
]

groups = [
    Group("1", label="一"),
    Group("2", label="二"),
    Group("3", label="三"),
    Group("4", label="四"),
    Group("5", label="五"),
    Group("6", label="六"),
    Group("7", label="七"),
    Group("8", label="八"),
    Group("9", label="九"),
]


for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layout_theme = {"border_width": 2,
                "margin": 10,
                "border_focus": "c678dd",
                "border_normal": "1f2335"
                }


layouts = [
    # layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=0),
    # layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.Floating(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

colors = [["#1f2335", "#1f2335"],
          ["#1c1f24", "#1c2023"],
          ["#e28c37", "#e28c37"],
          ["#47b27c", "#47b27c"],
          ["#5c8c2c", "#5c8c2c"],
          ["#4D87C1", "#4D87C1"],
          ["#d45997", "#d45997"],
          ["#4681bc", "#4681bc"],
          ["#8abeb7", "#8abeb7"],
          ["#ffffff", "#ffffff"]]

prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())


widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                       font = "Ubuntu Bold",
                       fontsize = 10,
                       margin_y = 3,
                       margin_x = 0,
                       padding_y = 5,
                       padding_x = 3,
                       borderwidth = 3,
                       active = "#ffffff",
                       inactive = "#a0a0a0",
                       rounded = False,
                       highlight_color = "#c678dd",
                       highlight_method = "line",
                       this_current_screen_border = "#c678dd",
                       this_screen_border = colors [4],
                       # other_current_screen_border = colors[6],
                       # other_screen_border = colors[4],
                       foreground = "#aaaaaa",
                       background = "#1a1b26"
                    ),

                widget.TextBox(
                       text='',
                       font = "Ubuntu Mono",
                       background = "1a1b26",
                       foreground = "987747",
                       padding = 0,
                       fontsize = 22
                       ),
                widget.CurrentLayout(
                foreground = "c0caf5",
                background = "987747",
                padding = 5
                ),
                widget.TextBox(
                       text='',
                       font = "Ubuntu Mono",
                       background = "e0af68",
                       foreground = "987747",
                       padding = 0,
                       fontsize = 22
                       ),
                 widget.CurrentLayoutIcon(
                custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                foreground = "c0caf5",
                background = "e0af68",
                padding = 0,
                scale = 0.7
                ),
                widget.TextBox(
                       text='',
                       font = "Ubuntu Mono",
                       background = "1a1b26",
                       foreground = "e0af68",
                       padding = 0,
                       fontsize = 22
                       ),


                widget.Prompt(),
                widget.WindowName(background = "#1a1b26",foreground = "#aaaaaa"),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),

              widget.TextBox(
                       text='',
                       font = "Ubuntu Mono",
                       background = "1a1b26",
                       foreground = "8edb99",
                       padding = 0,
                       fontsize = 22
                       ),

              widget.Battery(
                      background = "8edb99",
                      charge_char = '^',
                      discharge_char = 'v',
                      format = '{percent:2.0%} {char}',
                      ),

                widget.TextBox(
                       text = '',
                       font = "Ubuntu Mono",
                       background = "8edb99",
                       foreground = "7aa2f7",
                       padding = 0,
                       fontsize = 22
                       ),

               widget.Net(
                   background ="7aa2f7",
                   interface="wlp2s0b1",
                   format = '{down} ↓↑ {up}',
                   ),

                widget.TextBox(
                       text = '',
                       font = "Ubuntu Mono",
                       background = "7aa2f7",
                       foreground = "bb9af7",
                       padding = 0,
                       fontsize = 22
                       ),

                   widget.Volume(
                   foreground = "000000",
                   background = "bb9af7",
                   fmt = 'Vol: {}',
                   padding = 5
                   ),


                widget.TextBox(
                       text = '',
                       font = "Ubuntu Mono",
                       background = "bb9af7",
                       foreground = "e0af68",
                       padding = 0,
                       fontsize = 22
                       ),

                widget.Clock(
                    format="%I:%M %p",
                    background="#e0af68"
                    ),

                widget.TextBox(
                       text = '',
                       font = "Ubuntu Mono",
                       background = "e0af68",
                       foreground = "9ece6a",
                       padding = 0,
                       fontsize = 22
                       ),

                widget.Clock(
                    format="%Y-%m-%d",
                    background="#9ece6a"
                    ),

                widget.TextBox(
                       text = '',
                       font = "Ubuntu Mono",
                       background = "9ece6a",
                       foreground = "414868",
                       padding = 0,
                       fontsize = 22
                       ),

                       widget.KeyboardLayout(
                       foreground = "aaaaaa",
                       background = "414868",
                       fmt = 'Keyboard: {}',
                       padding = 5
                       ),

                widget.TextBox(
                       text = '',
                       font = "Ubuntu Mono",
                       background = "414868",
                       foreground = "f7768e",
                       padding = 0,
                       fontsize = 22
                       ),

                widget.Systray(
                        background = "#f7768e"
                        ),
                # widget.QuickExit(),
            ],
            22,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
