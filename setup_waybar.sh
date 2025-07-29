#!/usr/bin/env bash

mkdir -p ~/.config/waybar
tee ~/.config/waybar/style.css > /dev/null <<EOF
* {
  font-family: "JetBrainsMono Nerd Font Mono";
  font-weight: normal;
  font-size: 11px;
  min-height: 0px;
}

window#waybar {
  background: transparent;
}

tooltip {
  background: #f5f3f4;
  border: 2px solid #d3d3d3;
  border-radius: 5px;
  color: white;
}

/* Base modules */
#custom-launcher,
#workspaces button,
#mpris,
#privacy-item,
#bluetooth,
#clock,
#tray,
#cpu,
#memory,
#backlight,
#battery,
#pulseaudio,
#network,
#custom-updates {
  background: #380411;
  margin: 6px 2px 16px 8px;
  padding: 2px 8px;
  border-radius: 4px;
  color: white;
}

/* Module-specific coloring */
#clock          { padding-right: 6px; padding-left: 10px; }
#tray menu      { font-weight: bold; }

/* Workspaces */
#workspaces {
  padding: 0 0px;
}

#workspaces button {
  padding: 2px 1px;
  margin-left: 2px;
  border: 0px solid transparent;
  font-size: 10px;
  color: #d3d3d3;
  transition: background-color 0.1s;
}

#workspaces button.empty {
  padding: 1px 4px;
  color: #b1a7a6;
}

#workspaces button:first-child {
  margin-left: 10px;
}

#workspaces button.active {
  background: #e5383b;
  color: #f5f3f4;
}

#workspaces button:hover {
  background: #ba181b;
  color: #f5f3f4;
}

/* Battery Status */
#battery {
  background: #584582;
  color: white;
}

#battery.warning:not(.charging) {
  color: #a4161a;
}

#battery.critical:not(.charging) {
  color: #ba181b;
  animation-name: blink;
  animation-duration: 1s;
  animation-timing-function: linear;
  animation-iteration-count: infinite;
  animation-direction: alternate;
}

@keyframes blink {
  to {
    background-color: #e5383b;
    color: #f5f3f4;
  }
}

#mpris {
  background: #145418;
  color: white;
}
EOF

tee ~/.config/waybar/config.jsonc > /dev/null <<EOF
{
    "layer": "top",
    "position": "top",
    "height": 25,
    "reload_style_on_change": true,
    "modules-left": [
        "sway/workspaces",
        "mpris",
    ],
    "modules-center": [
        "clock"
    ],
    "modules-right": [
        "cpu",
        "memory",
        "battery",
        "pulseaudio",
        "backlight",
        "network",
    ],
    "sway/workspaces": {
      "disable-scroll": false,
      "on-click": "activate",
      "on-scroll-up": "swaymsg workspace prev",
      "on-scroll-down": "swaymsg workspace next",
      "format": "{icon}",
      "format-icons": {
        "1": "1",
        "2": "2",
        "3": "3",
        "4": "4",
        "5": "5",
        "6": "6",
        "7": "7",
        "8": "8",
        "9": "9",
      }
    },
   "mpris": {
        "format": "{player_icon}  {title} - {artist}",
        "format-paused": "{status_icon}  {title} - {artist}",
        "max-length": 50,
        "dynamic-len": 10,
        "player-icons": {
            "default": "󰎈",
            "mpv": "",
            "vlc": "<span color='#E85E00'>󰕼</span>",
            "spotify": "<span color='#1DB954'></span>",
            "brave": "<span font='normal Font Awesome 6 Free' color='#ed7009'></span>",
        },
        "status-icons": {
            "paused": "⏸",
            "playing": "",
            "stopped": "",
        },
    },
    "clock": {
        "interval": 1,
        "format": " {:%d.%m.%Y | %H:%M:%S}  ",
        "tooltip-format": "<tt><small>{calendar}</small></tt>",
        "calendar": {
            "mode": "year",
            "weeks-pos": "right",
            "mode-mon-col": 3,
            "on-scroll": 1,
            "format": {
                "months": "<span color='#cdd6f4'><b>{}</b></span>",
                "days": "<span color='#89b4fa'><b>{}</b></span>",
                "weeks": "<span color='#b4befe'><b>W{}</b></span>",
                "weekdays": "<span color='#b4befe'><b>{}</b></span>",
                "today": "<span color='#f38ba8'><b>{}</b></span>",
            },
        },
        "actions": {
            "on-click-right": "mode",
            "on-click-forward": "tz_up",
            "on-click-backward": "tz_down",
            "on-scroll-up": "shift_up",
            "on-scroll-down": "shift_down",
        },
    },
    "cpu": {
        "interval": 30,
        "format": " {load}%",
        "max-length": 10,
    },
    "memory": {
        "interval": 30,
        "format": " {}%",
    },
    "battery": {
        "bat": "BAT0",
        "bat2": "BAT1",
        "interval": 60,
        "max-length": 25,
        "states": {
            "warning": 30,
            "critical": 15,
        },
        "format": "{icon} {capacity}%",
        "format-full": " 󱟢 {capacity}%",
        "format-icons": {
            "discharging": [
                "󰁺",
                "󰁻",
                "󰁼",
                "󰁽",
                "󰁾",
                "󰁿",
                "󰂀",
                "󰂁",
                "󰂂",
                "󰁹"
            ],
            "charging": [
                "󰢜",
                "󰂆",
                "󰂇",
                "󰂈",
                "󰢝",
                "󰂉",
                "󰢞",
                "󰂊",
                "󰂋",
                "󰂅"
            ],
            "plugged": "󱐥",
        },
    },
    "pulseaudio": {
        "format": "{icon} {volume}% {format_source}",
        "format-bluetooth": "{volume}% {icon}",
        "format-muted": "󰖁 0% {format_source}",
        "format-icons": {
            "headphone": "",
            "hands-free": "󰂑",
            "headset": "󰂑",
            "phone": "",
            "portable": "",
            "car": "",
            "default": [
                "",
                ""
            ],
        },
        "scroll-step": 5,
        "on-click": "pavucontrol",
        "ignored-sinks": [
            "Easy Effects Sink"
        ],
        "format-source": " {volume}%",
        "format-source-muted": " {volume}%",
    },
    "backlight": {
        "format": "{percent}% {icon}",
        "format-icons": [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
        ],
    },
    "network": {
        "format": "{ifname}",
        "format-wifi": "{essid} ({signalStrength}%) {icon}",
        "format-icons": [
            "󰤯",
            "󰤟",
            "󰤢",
            "󰤥",
            "󰤨"
        ],
        //"format-ethernet": "{ipaddr}/{cidr} 󰈀",
        "format-ethernet": " {bandwidthDownBits}  {bandwidthUpBits}",
        "format-disconnected": "Offline 󰲜",
        "on-click": "nm-connection-editor",
        "tooltip-format": "󰈀 {ifname} via {gwaddr}\n󰩠 {ipaddr}/{cidr}\n󰱦 {bandwidthDownBits}\n󰳘 {bandwidthUpBits}",
        "tooltip-format-wifi": "{icon} {essid} ({signalStrength}%) {ifname}\n󰩠 {ipaddr}/{cidr}\n󰱦 {bandwidthDownBits}\n󰳘 {bandwidthUpBits}",
        "tooltip-format-ethernet": "󰈀 {ipaddr}/{cidr} {ifname}\n󰳘 {bandwidthUpBits}\n󰱦 {bandwidthDownBits}",
        "tooltip-format-disconnected": "Disconnected",
        "max-length": 50,
        "interval": 10
    },
}
EOF
