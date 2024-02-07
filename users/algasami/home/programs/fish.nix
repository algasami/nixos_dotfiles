# fish shell configs
{config, pkgs, ...}:
{
  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "plugin-z";
        src = pkgs.fishPlugins.z.src;
      }
      {
        name = "plugin-done";
        src = pkgs.fishPlugins.done.src;
      }
      {
        name = "plugin-hydro"; # fast git + theme
        src = pkgs.fishPlugins.hydro.src;
      }
    ];
  };
}
