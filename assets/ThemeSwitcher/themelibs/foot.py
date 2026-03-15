def create_foot_ini(config_file):

    return f"""
[colors]
alpha = 1.0
background = {config_file["BACKGROUND"]}
foreground = {config_file["TEXT_COLOR"]}


regular0 = {config_file["COLOR0"]}
regular1 = {config_file["COLOR1"]}
regular2 = {config_file["COLOR2"]}
regular3 = {config_file["COLOR3"]}
regular4 = {config_file["COLOR4"]}
regular5 = {config_file["COLOR5"]}
regular6 = {config_file["COLOR6"]}
regular7 = {config_file["COLOR7"]}

bright0 = {config_file["COLOR0"]}
bright1 = {config_file["COLOR1"]}
bright2 = {config_file["COLOR2"]}
bright3 = {config_file["COLOR3"]}
bright4 = {config_file["COLOR4"]}
bright5 = {config_file["COLOR5"]}
bright6 = {config_file["COLOR6"]}
bright7 = {config_file["COLOR7"]}

selection-background = {config_file["SELECTION_BG"]}
selection-foreground = {config_file["SELECTION_FG"]}

urls = {config_file["URLS"]}

[cursor]
blink = yes
style = beam

[main]
font = JetBrainsMono Nerd Font:size=9
pad = 10x10
term = xterm-256color

[scrollback]
lines = 10000
"""
