#!/bin/sh

ART_URL=$(playerctl --player=spotify metadata mpris:artUrl 2>/dev/null)
DEST="/tmp/waybar-art.png"

if [ -z "$ART_URL" ]; then
	rm -f "$DEST"
	exit 1
fi

case "$ART_URL" in
file://*)
	cp "${ART_URL#file://}" "$DEST"
	;;
http*)
	curl -s "$ART_URL" -o "$DEST"
	;;
*)
	rm -f "$DEST"
	;;
esac

echo $DEST
