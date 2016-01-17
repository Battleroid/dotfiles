#!/bin/bash
avail() {
	echo $(df -h $1 | tail -n 1 | awk '{print $4}')
	return 0
}
ROOT=$(avail /)
HOME=$(avail /home)
echo R: $ROOT, H: $HOME
