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

      vim.opt.termguicolors = true
      vim.cmd.colorscheme 'melange'

      vim.opt.tabstop = 2;
      vim.opt.shiftwidth = 2;

      vim.o.expandtab = true;
      vim.o.softtabstop = 2;
      vim.o.autoindent = true;

      vim.o.showcmd = true
      vim.g.mapleader = ","

      vim.o.number = true
      vim.o.relativenumber = true;

      vim.keymap.set("n", "<Leader>t", "<cmd>Neotree toggle<cr>")

      -- The setup config table shows all available config options with their default values:
      require("presence").setup({
          -- General options
          auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
          neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
          main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
          client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
          log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
          debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
          enable_line_number  = false,                      -- Displays the current line number instead of the current project
          blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
          buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
          file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
          show_time           = true,                       -- Show the timer

          -- Rich Presence text options
          editing_text        = "Vim-ing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
          file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
          git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
          plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
          reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
          workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
          line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
      })
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
      presence-nvim # discord rpc
    ];
  };
}


