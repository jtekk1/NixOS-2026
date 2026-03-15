#!/usr/sbin/python
import sys
import argparse
import tomllib
import subprocess
from pathlib import Path
from themelibs import (
    create_kitty_colors,
    create_starship_toml,
    create_wofi_css,
    create_foot_ini,
    create_mango_conf,
    create_waybar_css,
    create_waybar_config,
    create_btop_theme,
    create_mako_config,
    create_sway_config,
    create_fastfetch,
    create_kitty_colors,
)

WALLPAPER = None


def write_files(theme_name):
    global WALLPAPER
    with open(f"color-themes/{theme_name}", "rb") as f:
        config = tomllib.load(f)
    WALLPAPER = config["WALLPAPER"]

    if len(sys.argv) != 2:
        sys.exit("Only include 1 value")
    else:
        file_name = args.theme_name
        if file_name not in [
            f.name for f in Path("color-themes").iterdir() if f.is_file()
        ]:
            files = [f.name for f in Path("color-themes").iterdir() if f.is_file()]
            sys.exit(f"`{args.theme_name}` is not a valid Theme: {files}")

        else:
            items = [
                {
                    "target": "~/.config/starship.toml",
                    "source": "starship.toml",
                    "func": create_starship_toml,
                },
                {
                    "target": "~/.config/wofi/style.css",
                    "source": "wofi.css",
                    "func": create_wofi_css,
                },
                {
                    "target": None,
                    "source": "mango-colors.conf",
                    "func": create_mango_conf,
                },
                {
                    "target": "~/.config/waybar/waybar.css",
                    "source": "waybar.css",
                    "func": create_waybar_css,
                },
                {
                    "target": "~/.config/waybar/config",
                    "source": "waybar.config",
                    "func": create_waybar_config,
                },
                {
                    "target": "~/.config/btop/themes/btop.theme",
                    "source": "btop.theme",
                    "func": create_btop_theme,
                },
                {
                    "target": "~/.config/mako/config",
                    "source": "mako.config",
                    "func": create_mako_config,
                },
                {
                    "target": "~/.config/swayosd/style.css",
                    "source": "swayosd.css",
                    "func": create_sway_config,
                },
                {
                    "target": "~/.config/fastfetch/config.jsonc",
                    "source": "fastfetch.jsonc",
                    "func": create_fastfetch,
                },
                {
                    "target": "~/.config/kitty/colors.conf",
                    "source": "kitty.conf",
                    "func": create_kitty_colors,
                },
            ]
            source_dir = Path("current").absolute()

            for item in items:
                target = item["target"]
                source_file = item["source"]
                source_path = source_dir / source_file
                func = item["func"]

                print("target:", target)
                print("source:", source_file)
                print("source_path:", source_path)
                print("func", func)

                Path(source_path).write_text(func(config))

                if target is not None:
                    target_path = Path(target).expanduser()
                    try:
                        target_path.unlink()
                    except FileNotFoundError:
                        pass
                    target_path.symlink_to(Path(source_path).absolute())


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("theme_name", help="Name of theme to set")
    args = parser.parse_args()
    write_files(args.theme_name)
    subprocess.run(["pkill", "mako"])
    subprocess.run(["restart-app", "waybar"])
    subprocess.run(["restart-app", "swayosd"])
    subprocess.run(["mmsg", "-d", "reload_config"])
    subprocess.run(["pkill", "-9", "swaybg"])
    subprocess.run(
        [
            "cp",
            Path(f"~/tekk-wallpapers/{WALLPAPER}").expanduser(),
            Path("~/.config/ThemeSwitcher/current/wallpaper").expanduser(),
        ]
    )
    if WALLPAPER is not None:
        subprocess.Popen(
            [
                "swaybg",
                "-i",
                Path("~/.config/ThemeSwitcher/current/wallpaper").expanduser(),
                "-m",
                "fill",
                "-c",
                "000000",
            ],
            start_new_session=True,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
            stdin=subprocess.DEVNULL,
        )
