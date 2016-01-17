#!/bin/bash
IMAGE=$(mktemp --suffix=".png")
scrot $IMAGE
convert $IMAGE -blur 0x16 -scale 50% -scale 200% $IMAGE
i3lock -i $IMAGE &> /dev/null
rm $IMAGE

# old methods
# convert $IMAGE -level 1%,100%,0.6 -filter Gaussian -resize 20% -define filter:sigma=2 -resize 500% $IMAGE
# convert -scale 10% -scale 1000% -filter Gaussian -resize 20% -define filter:sigma=1.5 -resize 500% $IMAGE $IMAGE
