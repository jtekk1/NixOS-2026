def create_sway_config(config):

    bg = config["BACKGROUND"]
    fg = config["PRIMARY_COLOR"]

    return f"""
@define-color theme_bg_color #{bg};
@define-color theme_fg_color #{fg};
@define-color border_color #{fg};

window#osd {{
  border-radius: 999px;
  border: 2px solid @border_color;
  background: alpha(@theme_bg_color, 0.8); 
}}

window#osd #container {{
  margin: 16px;
}}

window#osd image,
window#osd label {{
  color: @theme_fg_color;
}}

window#osd progressbar:disabled,
window#osd image:disabled {{
  opacity: 0.5; 
}}

window#osd progressbar {{
  min-height: 6px;
  border-radius: 999px;
  background: transparent;
  border: none; 
}}

window#osd trough {{
  min-height: inherit;
  border-radius: inherit;
  border: none;
  background: alpha(@theme_fg_color, 0.5); 
}}

window#osd progress {{
  min-height: inherit;
  border-radius: inherit;
  border: none;
  background: @theme_fg_color; 
}}
"""
