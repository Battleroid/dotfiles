#!/usr/bin/zsh
BATT=$(acpi -b | awk '{print $NF}' | tr -d %)
echo "$BATT%"
echo "$BATT%"

if (( $BATT > 50 )); then
	echo "#A8FF00"
else
	echo "#CC6666"
fi

