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

      vim.opt.termguicolors = true
      vim.cmd.colorscheme 'melange'

      bo.tabstop = 2;
      bo.shiftwidth = 2;
      bo.expandtab = true;
      bo.softtabstop = 2;
      bo.autoindent = true;

      o.showcmd = true
      g.mapleader = ","

      wo.number = true
      wo.relativenumber = true;

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
          haskell= {
            command= "haskell-language-server-wrapper";
            args = [
              "--lsp"
            ];
            rootPatterns= [
              ".stack.yaml"
              ".hie-bios"
              "BUILD.bazel"
              "cabal.config"
              "package.yaml"
            ];
            filetypes= [
              "hs"
              "lhs"
              "haskell"
            ];
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
      melange-nvim # theme
    ];
  };
}


