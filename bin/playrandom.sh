#!/bin/bash
SOUNDS="$HOME/.ringtone"
TARGET=$(ls $SOUNDS | shuf -n1)
play "$SOUNDS/$TARGET"
