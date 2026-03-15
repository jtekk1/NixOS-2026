def create_mango_conf(config_file):
    primary = config_file["PRIMARY_COLOR"]
    secondary = config_file["SECONDARY_COLOR"]
    shadow = config_file["SHADOW_COLOR"]
    mouse_theme = config_file["MOUSE_THEME"]
    wallpaper = config_file["WALLPAPER"]

    return f"""# Theme colors
rootcolor=0x{primary}ff
bordercolor=0x{secondary}FF
focuscolor=0x{primary}ff
maximizescreencolor=0x{primary}ff
urgentcolor=0x{primary}ff
scratchpadcolor=0x{primary}ff
globalcolor=0x{primary}ff
overlaycolor=0x{primary}ff

# Shadows
shadowscolor=0x{shadow}ff

# Mouse
env=XCURSOR_SIZE,24
env=XCURSOR_THEME,{mouse_theme}
cursor_theme={mouse_theme}
exec-once=gsettings set org.gnome.desktop.interface cursor-theme '{mouse_theme}'

# Other
env=GTK_THEME,Adwaita:dark
env=QT_STYLE_OVERRIDE,adwaita-dark
exec-once=gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
exec-once=gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
exec-once=swaybg -i ~/tekk-wallpapers{wallpaper} -m fill -c 000000
"""
