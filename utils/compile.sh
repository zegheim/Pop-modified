#!/bin/sh

WORKDIR=${HOME}/.local/share/gnome-shell/theme/Pop-modified
GRESOURCE=${WORKDIR}/gnome-shell-theme.gresource
XML=${WORKDIR}/$(basename $GRESOURCE).xml

echo '<?xml version="1.0" encoding="UTF-8"?>
<gresources>
  <gresource prefix="org/gnome/shell/theme">' > $XML

for fname in `find ${WORKDIR}/theme -type f`; do
    echo "    <file>${fname}</file>" >> $XML
done

echo '  </gresource>
</gresources>' >>  $XML

glib-compile-resources $XML
