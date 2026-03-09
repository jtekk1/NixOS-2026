{ pkgs, ... }:

{
  programs.wofi = {
    enable = true;

    settings = {
      show = "drun";
      width = 300;
      height = 400;
      location = "center";
      prompt = "Search...";
      filter_rate = 100;
      allow_markup = true;
      no_actions = false;
      halign = "fill";
      orientation = "vertical";
      content_halign = "fill";
      insensitive = true;
      allow_images = true;
      image_size = 32;
      gtk_dark = true;
      dynamic_lines = true;
      hide_scroll = true;
      matching = "contains";
      sort_order = "default";
      lines = 10;
      columns = 1;
      term = "${pkgs.foot}/bin/foot";
    };
  };
}
