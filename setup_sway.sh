#!/usr/bin/env bash

mkdir -p ~/.config/sway
mkdir -p ~/pictures/screenshots/
mkdir -p ~/videos/screencaptures/
tee ~/.config/sway/config > /dev/null <<EOF
### Variables ###
set $mod Mod1
set $supr Mod4
set $smod Shift

set $terminal ghostty
set $browser firefox
set $launcher fuzzel
set $lock swaylock
set $screenshot grim -g "$(slurp)" ~/pictures/screenshots/ss_$(date +%F_%H-%M-%SOC).png
set $recording  wf-recorder -g "$(slurp)" -f "videos/screencaptures/recording_$(date +%F_%H-%M-%S).mp4"
set $bar waybar

### Application Launchers ###
bindsym $mod+Return exec $terminal
bindsym $mod+$smod+Return exec $browser
bindsym $mod+d exec $launcher
bindsym Print exec $screenshot
bindsym $mod+Print exec $recording

### Workspaces ###
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

# Switch to workspace
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace $ws7
bindsym $mod+8 workspace $ws8
bindsym $mod+9 workspace $ws9
bindsym $mod+0 workspace $ws10

# Move container to workspace
bindsym $mod+$smod+1 move container to workspace $ws1
bindsym $mod+$smod+2 move container to workspace $ws2
bindsym $mod+$smod+3 move container to workspace $ws3
bindsym $mod+$smod+4 move container to workspace $ws4
bindsym $mod+$smod+5 move container to workspace $ws5
bindsym $mod+$smod+6 move container to workspace $ws6
bindsym $mod+$smod+7 move container to workspace $ws7
bindsym $mod+$smod+8 move container to workspace $ws8
bindsym $mod+$smod+9 move container to workspace $ws9
bindsym $mod+$smod+0 move container to workspace $ws10

### Focus Navigation ###
bindsym $mod+l focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+h focus right

### Move Focused Window ###
bindsym $mod+$smod+h move left
bindsym $mod+$smod+j move down
bindsym $mod+$smod+k move up
bindsym $mod+$smod+l move right

### Resize Mode ###
mode "resize" {
    bindsym l  resize shrink width 10px
    bindsym j  resize grow height 10px
    bindsym k    resize shrink height 10px
    bindsym h resize grow width 10px

    bindsym Return mode "default"
    bindsym Escape mode "default"
    bindsym $mod+r mode "default"
}
bindsym $mod+r mode "resize"

### Floating and Fullscreen ###
bindsym $mod+f fullscreen toggle
bindsym $mod+$smod+f floating toggle

### Kill, Restart, Exit ###
bindsym $mod+$smod+q kill
bindsym $mod+$smod+r reload
bindsym $mod+$smod+e exec "swaynag -t warning -m 'Exit sway?' -b 'Yes' 'swaymsg exit'"

### Lock Screen ###
bindsym $supr+l exec $lock
bindsym $supr+$smod+l exec --no-startup-id $lock_sleep

### Volume Keys ###
bindsym XF86AudioMute exec pamixer -t && pkill -RTMIN+1 waybar
bindsym XF86AudioLowerVolume exec pamixer -d 3 && pkill -RTMIN+1 waybar
bindsym XF86AudioRaiseVolume exec pamixer -i 3 && pkill -RTMIN+1 waybar

### Startup Apps (should be handled in sway config or systemd/user services) ###
exec ghostty
exec spotify
exec $bar
exec swaymsg workspace 2; exec spotify

# lock after 5mins
# suspend after 10 mins
exec swayidle -w \
  timeout 300 'swaylock -f -c 000000' \
  resume 'killall swaylock' \
  timeout 600 'swaylock -f -c 000000 && systemctl suspend' \
  resume 'killall swaylock'

exec swaybg -i ~/Wallpapers/wallpaper17.jpg -m fill

for_window [class=".*"] border none
for_window [class=".*"] decoration none

input "2:7:SynPS/2_Synaptics_TouchPad" {
    natural_scroll enable
}
EOF
