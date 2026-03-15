def create_kitty_colors(config_file):
    PRIMARY_COLOR = config_file["PRIMARY_COLOR"]
    SECONDARY_COLOR = config_file["SECONDARY_COLOR"]
    TERTIARY_COLOR = config_file["TERTIARY_COLOR"]
    TEXT_COLOR = config_file["TEXT_COLOR"]
    URLS = config_file["URLS"]
    C0 = config_file["COLOR0"]
    C1 = config_file["COLOR1"]
    C2 = config_file["COLOR2"]
    C3 = config_file["COLOR3"]
    C4 = config_file["COLOR4"]
    C5 = config_file["COLOR5"]
    C6 = config_file["COLOR6"]
    C7 = config_file["COLOR7"]
    C8 = config_file["COLOR8"]
    C9 = config_file["COLOR9"]
    C10 = config_file["COLOR10"]
    C11 = config_file["COLOR11"]
    C12 = config_file["COLOR12"]
    C13 = config_file["COLOR13"]
    C14 = config_file["COLOR14"]
    C15 = config_file["COLOR15"]
    SF = config_file["SELECTION_FG"]
    SB = config_file["SELECTION_BG"]
    FG = config_file["FOREGROUND"]
    BG = config_file["BACKGROUND"]

    return f"""
# BLACK
color0                              #{C0}
color8                              #{C8}

# RED 
color1                              #{C1}
color9                              #{C9}

# GREEN
color2                              #{C2}
color10                             #{C10}

# YELLOW
color3                              #{C3}
color11                             #{C11}

# BLUE
color4                              #{C4}
color12                             #{C12}

# MAGENTA
color5                              #{C5}
color13                             #{C13}

# CYAN
color6                              #{C6}
color14                             #{C14}

# WHITE
color7                              #{C7}
color15                             #{C15}

foreground                          #{FG}
background                          #{BG}
selection_foreground                #{SF}
selection_background                #{SB}

cursor                              #{PRIMARY_COLOR}
cursor_text_color                   #{TEXT_COLOR}
cursor_trail_color                  #{SECONDARY_COLOR}

url_color                           #{URLS}
mark1_foreground                    black
mark1_background                    #{PRIMARY_COLOR}
mark2_foreground                    black
mark2_background                    #{SECONDARY_COLOR}
mark3_foreground                    black
mark3_background                    #{TERTIARY_COLOR}

background_opacity                  0.8
background_blur                     1 
transparent_background_colors       red@0.5 #00ff00@0.3
dynamic_background_opacity          no
dim_opacity                         0.4

wayland_titlebar_color              background
"""
