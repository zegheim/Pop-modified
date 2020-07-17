#!/bin/sh

WORKDIR=${HOME}/.local/share/gnome-shell/theme/Pop-modified
GRESOURCE=${WORKDIR}/gnome-shell-theme.gresource

for r in `gresource list $GRESOURCE`; do
    gresource extract $GRESOURCE $r | install -D /dev/stdin  $WORKDIR/${r#\/org\/gnome\/shell/}
done

if [ ! -f "$WORKDIR/theme/gdm3-modified.css" ]; then
    echo '@import url("resource:///org/gnome/shell/theme/gdm3.css");' > $WORKDIR/theme/gdm3-modified.css
    chmod 665 $WORKDIR/theme/gdm3-modified.css
fi

if [ ! -f "$WORKDIR/theme/gnome-shell-modified.css" ]; then
    echo '@import url("resource:///org/gnome/shell/theme/gnome-shell.css");' > $WORKDIR/theme/gnome-shell-modified.css
    chmod 665 $WORKDIR/theme/gnome-shell-modified.css
fi

