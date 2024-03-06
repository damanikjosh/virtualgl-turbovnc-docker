#!/bin/bash
set -e
rm -f /tmp/.X*-lock
rm -f /tmp/.X11-unix/X*
vncserver $DISPLAY -depth 24 -geometry 1920x1080
exec "$@"