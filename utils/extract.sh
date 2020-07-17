#!/bin/sh

WORKDIR=${HOME}/.local/share/gnome-shell/theme/Pop-modified
GRESOURCE=${HOME}/.local/share/gnome-shell/theme/Pop-modified/gnome-shell-theme.gresource

for r in `gresource list $GRESOURCE`; do
    gresource extract $GRESOURCE $r | install -D /dev/stdin  $WORKDIR/${r#\/org\/gnome\/shell/}
done
