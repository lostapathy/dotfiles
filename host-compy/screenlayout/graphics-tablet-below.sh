#!/bin/sh
xrandr --output DisplayPort-0 --primary --mode 3840x2160 --pos 0x0 --rotate normal --output DisplayPort-1 --off --output DisplayPort-2 --off --output HDMI-A-0 --mode 1920x1080 --pos 960x2160 --rotate normal --output DVI-D-0 --off

# This maps the pen output to the drawing tablet.
# The 25 is the id from `xinput`
STYLUS_INPUT=`xinput | grep stylus | awk '{print $6}' | awk -F= '{print $2}'`
xinput map-to-output $STYLUS_INPUT HDMI-A-0

i3-msg workspace "3: GIMP", move workspace to output HDMI-A-0

# dump out buttons with xsetwacom -s --get 22 all
WACOM_PAD=`xsetwacom --list devices |grep "Pad pad" |awk '{print $6}'`
xsetwacom set $WACOM_PAD Button 1 'key +shift ='
xsetwacom set $WACOM_PAD Button 2 'key +shift ='
xsetwacom set $WACOM_PAD Button 3 'key ]'

xsetwacom set $WACOM_PAD Button 8 'key +shift ='
xsetwacom set $WACOM_PAD Button 9 'key -'

xsetwacom set $WACOM_PAD Button 10 'key ['
xsetwacom set $WACOM_PAD Button 11 'key +shift ='
xsetwacom set $WACOM_PAD Button 12 'key +shift ='
