{ config, pkgs, ...}:
{
  home.packages = with pkgs; [
    ccls # lsp for c,c++
  ];
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraLuaConfig = ''
      o = vim.o
      g = vim.g
      wo = vim.wo
      bo = vim.bo

      o.showcmd = true
      g.mapleader = ","

      wo.number = true
      wo.relativenumber = true;

      bo.tabstop = 2;
      bo.shiftwidth = 2;
      bo.expandtab = true;
      bo.softtabstop = 2;

      vim.keymap.set("n", "<Leader>t", "<cmd>Neotree toggle<cr>")
    '';
    coc = {
      enable = true;
      settings = {
        languageserver= {
          ccls= {
            command = "ccls";
            filetypes= ["c" "cc" "cpp" "c++" "objc" "objcpp"];
            rootPatterns= [".ccls" "compile_commands.json" ".git/" ".hg/"];
            initializationOptions= {
              cache= {
                directory= "/tmp/ccls";
              };
            };
          };
        };
      };
    };
    plugins = with pkgs.vimPlugins; [
      suda-vim # sudo
      vim-nix # nix highlight
      nvim-treesitter # syntax
      nvim-web-devicons # icons
      nui-nvim # img preview
      plenary-nvim # library
      neo-tree-nvim # tree
    ];
  };
}

