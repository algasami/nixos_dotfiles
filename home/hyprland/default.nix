{ config, pkgs, ...}:
{
  imports = [
    (import ./waybar.nix {inherit config pkgs;})
  ];
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    monitor="DP-3,3440x1440@144,0x0,1";
    bind = [
      "$mod, F, exec, firefox"
      "$mod, Q, exec, kitty"
      "$mod, M, exec, hyprctl dispatch exit"
      "$mod, V, exec, cliphist list | wofi --show dmenu | cliphist decode | wl-copy"
      "$mod, C, killactive"
    ];
    binde = [ # repeat
      "$mod SHIFT, H, movewindow, l"
      "$mod SHIFT, L, movewindow, r"
      "$mod SHIFT, K, movewindow, u"
      "$mod SHIFT, J, movewindow, d"
      "$mod SHIFT, right, resizeactive, 10 0"
      "$mod SHIFT, left, resizeactive, -10 0"
      "$mod SHIFT, up, resizeactive, 0 -10"
      "$mod SHIFT, down, resizeactive, 0 10"
      "$mod, h, movefocus, l"
      "$mod, l, movefocus, r"
      "$mod, k, movefocus, u"
      "$mod, j, movefocus, d"
    ];
    exec-once = [
      "copyq --start-server"
      "wl-paste --type text --watch cliphist store"
    ];
    input = {
      repeat_delay = "300";
      repeat_rate = "75";
    };
  };
  wayland.windowManager.hyprland.plugins = [];
}

