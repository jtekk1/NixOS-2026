{ ... }:

{
  programs.nixvim = {
    keymaps = [
      # Clear search
      {
        mode = [
          "i"
          "n"
        ];
        key = "<esc>";
        action = "<cmd>noh<cr><esc>";
        options.desc = "Escape and clear hlsearch";
      }

      # Save file
      {
        mode = [
          "i"
          "x"
          "n"
          "s"
        ];
        key = "<C-s>";
        action = "<cmd>w<cr><esc>";
        options.desc = "Save file";
      }

      # Window Navigation
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options.desc = "Go to left window";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options.desc = "Go to lower window";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options.desc = "Go to upper window";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options.desc = "Go to right window";
      }

      # Buffer Navigation (Bufferline)
      {
        mode = "n";
        key = "<S-h>";
        action = "<cmd>bprevious<cr>";
        options.desc = "Prev buffer";
      }
      {
        mode = "n";
        key = "<S-l>";
        action = "<cmd>bnext<cr>";
        options.desc = "Next buffer";
      }
      {
        mode = "n";
        key = "<leader>bd";
        action = "<cmd>bdelete<cr>";
        options.desc = "Delete buffer";
      }

      # Neo-tree
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Neotree toggle<cr>";
        options.desc = "Explorer NeoTree (root dir)";
      }
      {
        mode = "n";
        key = "<leader>E";
        action = "<cmd>Neotree reveal<cr>";
        options.desc = "Explorer NeoTree (cwd)";
      }

      # Telescope
      {
        mode = "n";
        key = "<leader><space>";
        action = "<cmd>Telescope find_files<cr>";
        options.desc = "Find Files (root dir)";
      }
      {
        mode = "n";
        key = "<leader>/";
        action = "<cmd>Telescope live_grep<cr>";
        options.desc = "Grep (root dir)";
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = "<cmd>Telescope buffers<cr>";
        options.desc = "Buffers";
      }

      # Trouble
      {
        mode = "n";
        key = "<leader>xx";
        action = "<cmd>Trouble diagnostics toggle<cr>";
        options.desc = "Diagnostics (Trouble)";
      }
      {
        mode = "n";
        key = "<leader>xX";
        action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
        options.desc = "Buffer Diagnostics (Trouble)";
      }

      # LSP actions
      {
        mode = "n";
        key = "K";
        action = "<cmd>lua vim.lsp.buf.hover()<cr>";
        options.desc = "Hover Documentation";
      }
      {
        mode = "n";
        key = "gd";
        action = "<cmd>Telescope lsp_definitions<cr>";
        options.desc = "Goto Definition";
      }
      {
        mode = "n";
        key = "gr";
        action = "<cmd>Telescope lsp_references<cr>";
        options.desc = "References";
      }
      {
        mode = "n";
        key = "<leader>ca";
        action = "<cmd>lua vim.lsp.buf.code_action()<cr>";
        options.desc = "Code Action";
      }
      {
        mode = "n";
        key = "<leader>cr";
        action = "<cmd>lua vim.lsp.buf.rename()<cr>";
        options.desc = "Rename";
      }

      # Formatting
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>cf";
        action = "<cmd>lua require('conform').format({ lsp_fallback = true })<cr>";
        options.desc = "Format buffer";
      }
      # Floating Terminal (Kitty sends <C-_> for Ctrl+/)
      {
        mode = [
          "n"
          "t"
        ];
        key = "<C-/>";
        action = "<cmd>lua require('snacks').terminal.toggle()<cr>";
        options.desc = "Toggle Terminal";
      }
      {
        mode = [
          "n"
          "t"
        ];
        key = "<C-_>";
        action = "<cmd>lua require('snacks').terminal.toggle()<cr>";
        options.desc = "Toggle Terminal";
      }
    ];
  };
}
