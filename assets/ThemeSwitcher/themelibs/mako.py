def create_mako_config(config):
    PC = config["PRIMARY_COLOR"]
    SC = config["SECONDARY_COLOR"]
    BG = config["BACKGROUND"]
    TEXT = config["TEXT_COLOR"]

    return f"""
actions=1
anchor=top-center
background-color=#{BG}Ff
border-color=#{PC}F2
border-radius=0
border-size=2
default-timeout=10000
font=JetBrainsMono Nerd Font 11
group-by=app-name
height=200
history=1
icon-location=left
icons=1
ignore-timeout=0
layer=overlay
margin=10
markup=1
max-history=100
max-icon-size=64
max-visible=5
padding=15
progress-color=over #{SC}F2
sort=-time
text-alignment=left
text-color=#{TEXT}FF
width=500

[grouped]
format=<b>%s</b>\\n%b

[urgency=high]
background-color=#{BG}F2
border-color=#{PC}F2
default-timeout=0
text-color=#{PC}

[urgency=low]
background-color=#{BG}FF
border-color=#{PC}F2
default-timeout=3000
text-color=#{PC}

[urgency=normal]
background-color=#{BG}F2
border-color=#{PC}
default-timeout=3000
text-color=#{PC}
"""
