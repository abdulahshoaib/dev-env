#!/usr/bin/env bash

mkdir -p ~/.config/swaylock/
tee ~/.config/swaylock/config > /dev/null <<EOF
daemonize
show-failed-attempts
screenshot

effect-blur=13x13
effect-vignette=0.5:0.5

color=2a2d3a

font="Inter"
font-size=22

indicator
indicator-radius=100
indicator-thickness=10

line-color=800816
ring-color=800816
inside-color=00000000
key-hl-color=cc0c23
separator-color=00000000
text-color=F8F8F2
text-caps-lock-color=""

line-ver-color=240447
ring-ver-color=240447
inside-ver-color=00000000
text-ver-color=F8F8F2

ring-wrong-color=7d2a2a
text-wrong-color=7d2a2a
inside-wrong-color=00000000

inside-clear-color=00000000
text-clear-color=4c7a88
ring-clear-color=4c7a88
line-clear-color=4c7a88
line-wrong-color=1c1e26
bs-hl-color=4c7a88

clock
datestr=%I:%M %p
timestr=%A

ignore-empty-password
EOF
