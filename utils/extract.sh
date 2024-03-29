#!/bin/sh

WORKDIR=${HOME}/Documents/Pop-modified
GRESOURCE=${WORKDIR}/gnome-shell-theme.gresource

for r in `gresource list $GRESOURCE`; do
    gresource extract $GRESOURCE $r | install -D /dev/stdin  $WORKDIR/${r#\/org\/gnome\/shell/}
done


if [ ! -f "$WORKDIR/theme/gdm-original.css" ]; then
    mv $WORKDIR/theme/gdm.css $WORKDIR/theme/gdm-original.css
    echo '@import url("resource:///org/gnome/shell/theme/gdm-original.css");' > $WORKDIR/theme/gdm3.css
fi

if [ ! -f "$WORKDIR/theme/gnome-shell-original.css" ]; then
    mv $WORKDIR/theme/gnome-shell.css $WORKDIR/theme/gnome-shell-original.css
    echo '@import url("resource:///org/gnome/shell/theme/gnome-shell-original.css");' > $WORKDIR/theme/gnome-shell.css
fi

