def create_starship_toml(config_file):
    LEFT = ""
    RIGHT = ""
    PRIMARY_COLOR = config_file["PRIMARY_COLOR"]
    SECONDARY_COLOR = config_file["SECONDARY_COLOR"]
    TERTIARY_COLOR = config_file["TERTIARY_COLOR"]
    TEXT_COLOR = (
        config_file["STARSHIP_TEXT"]
        if "STARSHIP_TEXT" in config_file
        else config_file["TEXT_COLOR"]
    )

    return f"""
add_newline = true
format = "[{LEFT}](fg:#{PRIMARY_COLOR})$username$hostname[{RIGHT}](bg:#{SECONDARY_COLOR} fg:#{PRIMARY_COLOR})$container$nix_shell[{RIGHT}](bg:#{TERTIARY_COLOR} fg:#{SECONDARY_COLOR})$directory[{RIGHT}](bg:#{PRIMARY_COLOR} fg:#{TERTIARY_COLOR})$git_branch$git_status[{RIGHT}](bg:#{SECONDARY_COLOR} fg:#{PRIMARY_COLOR})$golang$java$nodejs$rust$python[{RIGHT}](bg:#{TERTIARY_COLOR} fg:#{SECONDARY_COLOR})$time[{RIGHT}](fg:#{TERTIARY_COLOR})\\n$character"

[character]
error_symbol = "[](bold fg:)"
success_symbol = "[󰁔](bold fg:#{TERTIARY_COLOR})"
vicmd_symbol = "[◀](bold fg:)"

[container]
format = "[ ⬢ $name ]($style)"
style = "bg: fg:#{TEXT_COLOR}"

[directory]
format = "[ $path ]($style)"
style = "bg:#{TERTIARY_COLOR} fg:#{TEXT_COLOR}"
truncation_length = 3
truncation_symbol = "…/"

[directory.substitutions]
Desktop = "󰀾 "
Documents = "󰈙 "
Downloads = " "
Music = " "
NixSetups = " "
Pictures = " "
Public = "󰐕 "
Templates = "󰏗 "
Videos = "󰕧 "
"~" = "󰋜"

[docker_context]
format = "[ $symbol $context ]($style)"
style = "bg:#{TERTIARY_COLOR} fg:#{TEXT_COLOR}"
symbol = " "

[git_branch]
format = "[ $symbol $branch ]($style)"
style = "bg:#{PRIMARY_COLOR} fg:#{TEXT_COLOR}"
symbol = "󰘬"

[git_status]
format = "[$all_status$ahead_behind ]($style)"
style = "bg:#{PRIMARY_COLOR} fg:#{TEXT_COLOR}"

[golang]
format = "[ $symbol ($version) ]($style)"
style = "bg: fg:#{TEXT_COLOR}"
symbol = "󰟓 "

[hostname]
format = "[@$hostname $ssh_symbol]($style)"
ssh_only = false
ssh_symbol = ""
style = "bg:#{PRIMARY_COLOR} fg:#{TEXT_COLOR}"

[java]
format = "[ $symbol ($version) ]($style)"
style = "bg:#{SECONDARY_COLOR} fg:#{TEXT_COLOR}"
symbol = " "

[nix_shell]
format = "[ $symbol $name ]($style)"
heuristic = true
style = "bg:#{SECONDARY_COLOR} fg:#{TEXT_COLOR}"
symbol = " "

[nodejs]
format = "[ $symbol ($version) ]($style)"
style = "bg:#{SECONDARY_COLOR} fg:#{TEXT_COLOR}"
symbol = "󰌞󰛦"

[python]
format = "[${{symbol}}${{version}} ]($style)"
style = "bg:#{SECONDARY_COLOR} fg:#{TEXT_COLOR}"
symbol = " 🐍 "
version_format = "${{raw}}"

[rust]
format = "[ $symbol ($version) ]($style)"
style = "bg:#{SECONDARY_COLOR} fg:#{TEXT_COLOR}"
symbol = "󱘗 "

[time]
disabled = false
format = "[ 󰅐 $time ]($style)"
style = "bg:#{TERTIARY_COLOR} fg:#{TEXT_COLOR}"
time_format = "%R"

[username]
format = "[ $user]($style)"
show_always = true
style_root = "bg:#{PRIMARY_COLOR} fg:#{TEXT_COLOR}"
style_user = "bg:#{PRIMARY_COLOR} fg:#{TEXT_COLOR}"
"""
