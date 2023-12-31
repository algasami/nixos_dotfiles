{ config, pkgs, ...}:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = ''
      set relativenumber number
      set tabstop=2
      set shiftwidth=2
      set expandtab
      set softtabstop=2
    '';
    plugins = [
      pkgs.vimPlugins.suda-vim
    ];
  };
}


