def create_wofi_css(config_file):
    PRIMARY_COLOR = config_file["PRIMARY_COLOR"]
    SECONDARY_COLOR = config_file["SECONDARY_COLOR"]
    TERTIARY_COLOR = config_file["TERTIARY_COLOR"]
    TEXT_COLOR = config_file["TEXT_COLOR"]
    STARSHIP_COLOR = (
        config_file["STARSHIP_TEXT"]
        if "STARSHIP_TEXT" in config_file
        else config_file["TEXT_COLOR"]
    )

    return f"""/* WOFI COLORS */ 
@define-color bg1 #{PRIMARY_COLOR};
@define-color bg2 #{SECONDARY_COLOR};
@define-color bg3 #{TERTIARY_COLOR};
@define-color fg1 #{TEXT_COLOR};
@define-color fg2 #{STARSHIP_COLOR};

* {{
  font-family: "JetBrainsMono Nerd Font", monospace;
  font-size: 14px;
}}

window {{
  margin: 0px;
  border: 4px solid @bg1;
  border-radius: 10px;
  background-color: rgba(10, 10, 15, 0.95);
}}

#input {{
  margin: 10px;
  padding: 10px;
  border: 2px solid @bg1;
  border-radius: 8px;
  background-color: @bg3;
  color: @fg1;
  font-weight: bold;
}}

#input:focus {{
  border-color: @bg2;
  box-shadow: 0 0 10px @bg1;
}}

#inner-box {{
  margin: 5px;
  background-color: transparent;
}}

#outer-box {{
  margin: 5px;
  padding: 5px;
  background-color: transparent;
}}

#scroll {{
  margin: 0px;
  background-color: transparent;
}}

#text {{
  margin: 5px;
  color: @bg1;
}}

#entry {{
  margin: 3px;
  padding: 8px;
  border-radius: 6px;
  background-color: rgba(0, 0, 0, 0.3);
}}

#entry:selected {{
  background: linear-gradient(90deg, @bg2 0%, @bg1 100%);
  border: 3px solid @bg1;
  color: @fg1;
  font-weight: bold;
}}

#text:selected {{
  color: @fg1;
}}

#img {{
  margin-right: 10px
}}
"""

def create_wofi_theme_menu_css(config_file):
    PRIMARY_COLOR = config_file["PRIMARY_COLOR"]
    SECONDARY_COLOR = config_file["SECONDARY_COLOR"]
    TERTIARY_COLOR = config_file["TERTIARY_COLOR"]
    TEXT_COLOR = config_file["TEXT_COLOR"]

    return f"""
/* WOFI COLORS */ 
@define-color bg1 #{PRIMARY_COLOR};
@define-color bg2 #{SECONDARY_COLOR};
@define-color bg3 #{TERTIARY_COLOR};
@define-color fg1 #{TEXT_COLOR};

* {{
  font-family: "JetBrainsMono Nerd Font", monospace;
  font-size: 14px;
}}

window {{
  margin: 0px;
  border: 4px solid @bg1;
  border-radius: 10px;
  background: transparent;
}}

#input {{
  /* Hiding the input box specifically for the wallpaper switcher looks cleaner */
  /* If you want to keep it, leave this block. If not, set visibility: hidden; */
  margin: 2px;
  padding: 2px;
  border: 2px solid @bg1;
  border-radius: 8px;
  background-color: @bg3;
  color: @fg1;
  font-weight: bold;
}}

#inner-box {{
  margin: 5px;
  background-color: transparent;
}}

#outer-box {{
  margin: 5px;
  padding: 5px;
  background-color: transparent;
}}

#scroll {{
  margin: 0px;
  background-color: transparent;
}}

/* Hide the text completely so only images show */
#text {{
    font-size: 0px;
    color: transparent;
    margin: 0px;
    padding: 0px;
    border: none;
}}

#entry {{
    margin: 2px;
    padding: 2px;
    border-radius: 10px;
    background: transparent;
}}

/* Highlight the selected image */
#entry:selected {{
    background-color: transparent;
    border: 3px solid @bg1;
}}

#img {{
    margin: 0px;
    background-color: transparent;
}}
"""
