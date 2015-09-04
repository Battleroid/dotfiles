#!/bin/bash
title=`playerctl -p spotify metadata title`
artist=`playerctl -p spotify metadata artist`

if [ -z "$title" -o -z "$artist" ];
then
	echo "Nothing Playing"
else
	echo "Playing: $title by $artist"
fi
