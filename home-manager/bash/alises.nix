{ pkgs, ... }:

{
  programs.bash = {
    enable = true;

    shellAliases = {
      # --- Core Replacements ---
      ls = "eza -lh --group-directories-first --icons=auto";
      lsa = "ls -a";
      lt = "eza --tree --level=2 --long --icons --git";
      lta = "lt -a";
      cat = "bat";
      cd = "zd"; # Hooks into the custom function we just made

      # --- Navigation Shortcuts ---
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      # --- Tools & Utilities ---
      fzfp = "fzf --preview 'bat --style=numbers --color=always {}'";
      ff = "fastfetch";
      decompress = "tar -xzf";
      nix-cleanup = "nix-collect-garbage -d && sudo nix-collect-garbage -d && nix-store --optimise && sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations +5 && rm -rf ~/.cache/nix && sudo journalctl --vacuum-time=7d";

    };
  };
}
