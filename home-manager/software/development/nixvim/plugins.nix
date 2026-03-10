{ pkgs, ... }:

{
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "eldritch.nvim";
        src = pkgs.fetchFromGitHub {
          owner = "eldritch-theme";
          repo = "eldritch.nvim";
          rev = "0415fa72c348e814a7a6cc9405593a4f812fe12f";
          hash = "sha256-nEt25TqsYePRCYkCI9zEk/awFBQ9ENyYWR0hSyy24GY=";
        };
      })
    ];
    extraConfigLua = ''
      require("eldritch").setup({
        transparent = true,
        hide_inactive_statusline = false,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
        },
      })
      vim.cmd("colorscheme eldritch")
    '';

    plugins = {
      ###################################################
      # --- CORE INTELLIGENCE (LSP, Formatting, TS) --- #
      ###################################################
      treesitter = {
        enable = true;
        settings = {
          ensure_install = "all";
          indent.enable = true;
        };
      };

      blink-cmp = {
        enable = true;
        settings = {
          keymap = {
            preset = "super-tab";
            "<CR>" = [
              "accept"
              "fallback"
            ];
          };
          appearance.use_nvim_cmp_as_default = true;
          sources.default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
          ];
          completion.ghost_text.enabled = true;
        };
      };

      nvim-autopairs = {
        enable = true;
        settings = {
          check_ts = true;
          disable_filetypes = [
            "TelescopePrompt"
            "vim"
          ];
        };
      };
      lsp = {
        enable = true;
        servers = {

          # Python
          pyright.enable = true;
          ruff.enable = true;

          # JS/TS
          ts_ls.enable = true;
          eslint.enable = true;

          # Nix & Lua
          nixd.enable = true;
          lua_ls.enable = true;

          # Rust
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };

          # Zig
          zls.enable = true;
        };
      };

      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            lsp-fallback = true;
            timeout_ms = 500;
          };
          formatters_by_ft = {
            python = [
              "ruff_format"
              "ruff_fix"
            ];
            javascript = [ "prettier" ];
            typescript = [ "prettier" ];
            nix = [ "nixfmt" ];
            rust = [ "rustfmt" ];
            zig = [ "zigfmt" ];
          };
        };
      };

      ###################################################
      # --- UI TOOLS --- #
      ###################################################
      lualine.enable = true;
      bufferline.enable = true;
      noice.enable = true;
      web-devicons.enable = true;

      neo-tree = {
        enable = true;
        settings = {
          closeIfLastWindow = true;
          window.position = "left";
        };
      };

      ###################################################
      # --- WORKFLOW TOOLS --- #
      ###################################################

      which-key.enable = true;
      gitsigns.enable = true;
      trouble.enable = true;
      todo-comments.enable = true;
      flash.enable = true;
      telescope.enable = true;

      harpoon = {
        enable = true;
        settings = {
          dashboard.enabled = true;
          notifier.enabled = true;
          quickfile.enabled = true;
        };
      };

      snacks = {
        enable = true;
        settings = {
          dashboard.enabled = true;
          notifier.enabled = true;
          quickfile.enabled = true;
          terminal = {
            enabled = true;
            win = {
              style = "terminal";
              position = "bottom";
              height = 15;
            };
          };
        };
      };
    };
  };
}
