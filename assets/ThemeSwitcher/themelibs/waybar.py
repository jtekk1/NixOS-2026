import socket


def create_waybar_css(config_file):
    bg1 = config_file["PRIMARY_COLOR"]
    bg2 = config_file["SECONDARY_COLOR"]
    bg3 = config_file["TERTIARY_COLOR"]
    fg1 = config_file["TEXT_COLOR"]
    fg2 = (
        config_file["STARSHIP_TEXT"]
        if "STARTSHIP_TEXT" in config_file
        else config_file["BACKGROUND"]
    )
    fg3 = config_file["FOREGROUND"]

    return f"""
@define-color bg1 #{bg1};
@define-color bg2 #{bg2};
@define-color bg3 #{bg3};
@define-color fg1 #{fg1};
@define-color fg2 #{fg2};
@define-color fg3 #{fg3};
"""


def create_waybar_config(_):

    file_ = """[
  {
    "reload_style_on_change": true,
    "spacing": "0",
    "mode": "dock",
    "position": "top",
    "margin-top": 10,

    "modules-left": [
    ],

    "modules-center": [
      "tray",
      "cpu",
      "memory",
      "disk",
      "network",
      "bluetooth",
      "custom/updates", """

    if socket.gethostname() == "deepspace":
        file_ += '\n      "custom/monitor-toggle",\n'

    file_ += """      "ext/workspaces",
      "wireplumber",
      "battery",
      "idle_inhibitor",
      "custom/weather",
      "clock",
      "dwl/window",
    ],

    "modules-right": [
    ],

    "idle_inhibitor": {
      "format": " {icon} ",
      "format-icons": {
        "activated": "",
        "deactivated": ""
      },
    },

    "battery": {
      "format": "{icon}",
      "format-alt": "{icon} {capacity}%",
      "format-charging": "󱊦",
      "format-icons": [
        "",
        "",
        "",
        "",
        ""
      ],
      "format-plugged": "",
      "states": {
        "critical": 15,
        "good": 95,
        "warning": 30
      },
      "tooltip": true,
      "tooltip-format": "{timeTo}\nHealth: {health}%\nUsage: {power:0.1f}W\nCycles: {cycles}\nCapacity: {capacity}%"
    },

    "bluetooth": {
      "controller": "hci0",
      "format": "{icon}",
      "format-alt": "{icon} {device_battery_percentage}%",
      "format-icons": {
        "no-controller": "󰥊",
        "connected": "",
        "disabled": "󰂲",
        "discovering": "󰂱",
        "on": "󰂯",
        "off": "󰂲"
      },
      "on-click-right": "kitty -T BTUI bluetui",
      "tooltip-format": "{controller_alias}\t{controller_address}\n\n{num_connections} connected",
      "tooltip-format-connected": "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}",
      "tooltip-format-enumerate-connected": "{device_alias}\t{device_address}",
      "tooltip-format-enumerate-connected-battery": "{device_alias}\t{device_address}\t{device_battery_percentage}%"
    },

    "clock": {
      "actions": {
        "on-click-right": "mode",
        "on-scroll-down": "shift_down",
        "on-scroll-up": "shift_up"
      },
      "calendar": {
        "format": {
          "days": "<span color='#ecc6d9'><b>{}</b></span>",
          "months": "<span color='#ffead3'><b>{}</b></span>",
          "today": "<span color='#ff6699'><b>{}</b></span>",
          "weekdays": "<span color='#ffcc66'><b>{}</b></span>",
          "weeks": "<span color='#99ffdd'><b>W{}</b></span>"
        },
        "mode": "month",
        "mode-mon-col": 3,
        "on-scroll": 1,
        "weeks-pos": "right"
      },
      "format": " {:%H:%M}",
      "format-alt": " {:%a %d |  %H:%M}",
      "tooltip-format": "<tt><big>{:%b | %d | %Y}</big>\n\n<small>{calendar}</small></tt>"
    },

    "cpu": {
      "format": "",
      "format-alt": " {usage}%",
      "format-icons": [
        "▁",
        "▂",
        "▃",
        "▄",
        "▅",
        "▆",
        "▇",
        "█"
      ],
      "on-click-right": "kitty -T BTOP btop",
      "tooltip": true,
      "tooltip-format": "min: {min_frequency}"
    }, 

    "custom/monitor-toggle": {
      "format": "󰍺",
      "on-click": "wlr-randr --output HDMI-A-2 --on --pos 5120,0",
      "on-click-right": "wlr-randr --output HDMI-A-2 --off",
      "tooltip": true,
      "tooltip-format": "Left click: turn on | Right click: turn off"
    },

    "custom/power": {
      "format": "⏻",
      "on-click": "wlogout -l ~/.config/wlogout/layout -s ~/.config/wlogout/style.css",
      "tooltip": false
    },

    "custom/weather": {
      "exec": "status-weather",
      "format": "{}",
      "interval": 30,
      "return-type": "json",
      "tooltip": true
    },

    "custom/updates": {
      "exec": "~/.local/bin/check-for-updates",
      "format": "{icon}",
      "format-alt": "{icon} {text}",
      "return-type": "json",
      "format-icons": {
        "available": "",
        "unavailable": "󰏖",
      },
      "interval": 3600,
      "tooltip": true,
      "on-click-right": "kitty -T BTUI -H doas xbps-install -Syu"
    },

    "disk": {
      "swap-icon-label": false,
      "format": "",
      "format-alt": " {used}",
      "interval": 3600,
      "on-click-right": "kitty -T GDU gdu -d",
      "tooltip-format": "Available: {free} | {percentage_free}%\nUsed: {used} | {percentage_used}%"
    },

    "dwl/window": {
      "format": "{layout}",
      "menu": "on-click",
      "menu-actions": {
        "centerTiling": "mmsg -l CT",
        "deck": "mmsg -l K",
        "grid": "mmsg -l G",
        "monocle": "mmsg -l M",
        "rightTiling": "mmsg -l RT",
        "scrolling": "mmsg -l S",
        "tgmix": "mmsg -l TG",
        "tiling": "mmsg -l T",
        "verticalDeck": "mmsg -l VK",
        "verticalGrid": "mmsg -l VG",
        "verticalScrolling": "mmsg -l VS",
        "verticalTiling": "mmsg -l VT"
      },
      "menu-file": "$HOME/.config/waybar/mango-menu.xml",
      "rewrite": {
        "CT": "CTIL",
        "G": "GRID",
        "K": "DECK",
        "M": "MONO",
        "RT": "RTIL",
        "S": "SCRL",
        "T": "TILE",
        "TG": "TGMX",
        "VG": "VGRD",
        "VK": "VDCK",
        "VS": "VSCR",
        "VT": "VTIL"
      }
    },

    "ext/workspaces": {
      "active-only": false,
      "format": "{icon}",
      "format-icons": {
        "urgent": "󰀦"
      },
      "ignore-hidden": false,
      "on-click": "activate",
      "on-click-right": "deactivate",
      "sort-by-id": true
    },

    "memory": {
      "format": "",
      "format-alt": "  {used:0.1f}G",
      "format-icons": [
        "▁",
        "▂",
        "▃",
        "▄",
        "▅",
        "▆",
        "▇",
        "█"
      ],
      "on-click-right": "kitty -T BTOP btop",
      "tooltip-format": "Mem: {used}/{total} GiB | {percentage}%\nSwap: {swapUsed}/{swapTotal} GiB | {swapPercentage}%"
    },

    "network": {
      "format-alt": "{icon} |  {bandwidthUpBytes} |  {bandwidthDownBytes}",
      "format-disconnected": "󰤮",
      "format-ethernet": "{icon}",
      "format-icons": {
        "ethernet": [
          "󰈀"
        ],
        "wifi": [
          "󰤯",
          "󰤟",
          "󰤢",
          "󰤥",
          "󰤨"
        ]
      },
      "format-wifi": "{icon}",
      "format-wifi-alt": "{icon} {signalStrength}%",
      "on-click-right": "kitty -T IMPALA impala",
      "tooltip-format": "{ifname} via {gwaddr} 󰊗",
      "tooltip-format-disconnected": "󰤮 Disconnected",
      "tooltip-format-ethernet": "IP: {ipaddr}\nDown:  {bandwidthDownBytes}\nUp:  {bandwidthUpBytes}",
      "tooltip-format-wifi": "{icon} {essid} ({signalStrength}%)\nIP: {ipaddr}\nDown:  {bandwidthDownBytes}\nUp:  {bandwidthUpBytes}"
    },

    "wireplumber": {
      "format": "{icon}",
      "format-alt": "{icon} {volume}%",
      "format-bluetooth": "{volume}% {icon} {format_source}",
      "format-bluetooth-muted": " {icon} {format_source}",
      "format-icons": {
        "default": [
          "",
          "",
          ""
        ],
        "hands-free": "",
        "headphone": "",
      },
      "format-muted": "󰝟 {format_source}",
      "format-source": "{volume}% ",
      "format-source-muted": "",
      "on-click-right": "kitty -T WIREMIX wiremix"
    },

    "temperature": {
      "hwmon-path-abs": "/sys/devices/pci0000:00/0000:00:18.3/hwmon",
      "input-filename": "temp1_input",
      "critical-threshold": 80,
      "format": "  {temperatureC}°C",
      "interval": 5
    },

    "tray": {
      "icon-size": 21,
      "spacing": 10,
      "show-passive-items": true,
      "icons": {
        "blueman": "bluetooth",
        "bluez": "bluetooth",
      },
    },
   }
]"""

    return file_
