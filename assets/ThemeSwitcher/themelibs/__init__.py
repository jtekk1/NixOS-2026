from .starship import create_starship_toml
from .wofi import create_wofi_css, create_wofi_theme_menu_css
from .foot import create_foot_ini
from .mango import create_mango_conf
from .waybar import create_waybar_css, create_waybar_config
from .btop import create_btop_theme
from .mako import create_mako_config
from .swayosd import create_sway_config
from .fastfetch import create_fastfetch
from .kitty import create_kitty_colors

__all__ = [
    "create_wofi_css",
    "create_wofi_theme_menu_css",
    "create_starship_toml",
    "create_foot_ini",
    "create_mango_conf",
    "create_waybar_css",
    "create_waybar_config",
    "create_btop_theme",
    "create_mako_config",
    "create_sway_config",
    "create_fastfetch",
    "create_kitty_colors",
]
