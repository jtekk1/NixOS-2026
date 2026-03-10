return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        nix_ls = false,
        nixd = {
          mason = false,
          settings = {
            nixd = {
              nixpkgs = {
                expr = 'import (builtins.getFlake "' .. vim.fn.expand("~/NixOS") .. '").inputs.nixpkgs { }',
              },
              formatting = {
                command = { "nixfmt" }, -- Make sure this matches the formatter you installed
              },
              options = {
                nixos = {
                  expr = '(builtins.getFlake "' .. vim.fn.expand("~/NixOS") .. '").nixosConfigurations.deepspace.options',
                },
              },
            },
          },
        },
      },
    },
  },
}
