# This file is part of ranger, the console file manager.
# License: GNU GPL version 3, see the file "AUTHORS" for details.

from __future__ import absolute_import, division, print_function

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import (
    black,
    magenta,
    red,
    default,
    normal,
    bold,
    reverse,
    default_colors,
)


class Rougarou(ColorScheme):
    progress_bar_color = 13

    def use(self, context):  # pylint: disable=too-many-branches,too-many-statements
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            if context.selected:
                attr = reverse
            else:
                attr = normal
            if context.empty or context.error:
                bg = 1
                fg = 0
            if context.border:
                fg = default
            if context.document:
                attr |= normal
                fg = 13
            if context.media:
                if context.image:
                    attr |= normal
                    fg = 3
                elif context.video:
                    fg = 1
                elif context.audio:
                    fg = 6
                else:
                    fg = 10
            if context.container:
                attr |= bold
                fg = 9
            if context.directory:
                attr |= bold
                fg = 5
            elif context.executable and not any(
                (context.media, context.container, context.fifo, context.socket)
            ):
                attr |= bold
                fg = 2
            if context.socket:
                fg = 5
                attr |= bold
            if context.fifo or context.device:
                fg = 3
                if context.device:
                    attr |= bold
            if context.link:
                fg = 6 if context.good else 13
            if context.tag_marker and not context.selected:
                attr |= bold
                if fg in (red, magenta):
                    fg = 1
                else:
                    fg = 15
            if not context.selected and (context.cut or context.copied):
                fg = black
                attr |= bold
            if context.main_column:
                if context.selected:
                    attr |= bold
                if context.marked:
                    attr |= bold
                    fg = 8
            if context.badinfo:
                if attr & reverse:
                    bg = 5
                else:
                    fg = 5

            if context.inactive_pane:
                fg = 6

        elif context.in_titlebar:
            attr |= bold
            if context.hostname:
                fg = 1 if context.bad else 2
            elif context.directory:
                fg = 4
            elif context.tab:
                if context.good:
                    bg = 2
            elif context.link:
                fg = 6

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = 2
                elif context.bad:
                    bg = 5
                    fg = 8
            if context.marked:
                attr |= bold | reverse
                fg = 3
            if context.frozen:
                attr |= bold | reverse
                fg = 6
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = 1
            if context.loaded:
                bg = self.progress_bar_color
            if context.vcsinfo:
                fg = 4
                attr &= ~bold
            if context.vcscommit:
                fg = 3
                attr &= ~bold
            if context.vcsdate:
                fg = 6
                attr &= ~bold

        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = 4

            if context.selected:
                attr |= reverse

            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color

        if context.vcsfile and not context.selected:
            attr &= ~bold
            if context.vcsconflict:
                fg = 5
            elif context.vcschanged:
                fg = 1
            elif context.vcsunknown:
                fg = 1
            elif context.vcsstaged:
                fg = 2
            elif context.vcssync:
                fg = 2
            elif context.vcsignored:
                fg = default

        elif context.vcsremote and not context.selected:
            attr &= ~bold
            if context.vcssync or context.vcsnone:
                fg = 2
            elif context.vcsbehind:
                fg = 1
            elif context.vcsahead:
                fg = 6
            elif context.vcsdiverged:
                fg = 5
            elif context.vcsunknown:
                fg = 1

        return fg, bg, attr
