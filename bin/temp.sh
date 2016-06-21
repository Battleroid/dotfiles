#!/usr/bin/zsh
TEMP=$(sensors -u | egrep "temp[0-9]_input:" | awk '{ sum += $2; } END { if (NR > 0) print sum / NR; }')

# full, short
printf "%.1f °C\n" $TEMP
printf "%.1f °C\n" $TEMP

# color
if (( $TEMP > 60 )); then
	echo "#CC6666"
else
	echo "#A8FF00"
fi
