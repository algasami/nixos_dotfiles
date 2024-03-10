{ config, pkgs, constants, mysecrets, ...}:
{
  imports = [
    (import ./eww.nix {inherit config pkgs constants;})
  ];
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.enableNvidiaPatches = true;
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    monitor="DP-3,3440x1440@144,0x0,1";
    decoration = {
      blur = {
        enabled = "true";
        size = "12";
        passes = "3";
        ignore_opacity = "false";
      };
      drop_shadow = "true";
      shadow_range = "8";
      rounding = "8";
      active_opacity = "1.0";
      inactive_opacity = "0.75";
      dim_inactive = "true";
      dim_strength = "0.2";
    };
    windowrulev2 = [
      "float, workspace:3"
      "noblur, workspace:3"
      "nodim, workspace:3"
      "immediate, workspace:3"
      "opacity 1.0 override 1.0 override, workspace:3"
    ];
    bind = [
      "$mod, R, exec, wofi --show run" # use R for run
      "$mod, Q, exec, kitty"
      "$mod, M, exec, hyprctl dispatch exit"
      "$mod, V, exec, cliphist list | wofi --show dmenu | cliphist decode | wl-copy"
      "$mod, K, killactive" # use K for kill
      "$mod, C, centerwindow, 1" # respect reserved area
      "$mod, F, togglefloating"
      "$mod, code:121, fullscreen" #f10

      # nuphy field 75
      ",code:122, exec, amixer set Master 5%-" # volume down
      ",code:123, exec, amixer set Master 5%+" # volume up

      # screenshot
      ",Print, exec, grimblast --notify copy area"

      # workspaces
      "$mod CTRL, 1, movetoworkspacesilent, 1"
      "$mod CTRL, 2, movetoworkspacesilent, 2"
      "$mod CTRL, 3, movetoworkspacesilent, 3"
      "$mod CTRL, 4, movetoworkspacesilent, 4"
      "$mod CTRL, 5, movetoworkspacesilent, 5"
      "$mod CTRL, 6, movetoworkspacesilent, 6"
      "$mod CTRL, 7, movetoworkspacesilent, 7"
      "$mod CTRL, 8, movetoworkspacesilent, 8"
      "$mod CTRL, 9, movetoworkspacesilent, 9"

      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"

      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"

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
    bindm = [
      "bindm=SUPER,mouse:272,movewindow"
      "bindm=SUPER,mouse:273,resizewindow"
    ];
    workspace = [
      "1,default:true,on-created-empty:kitty"
      "2,on-created-empty:[float] firefox"
      "3,decorate:false,on-created-empty:easyeffect"
    ];
    exec-once = [
      "sleep 5 && swww init & sleep 2 && swww img ${mysecrets}/wallpapers/market.gif"
      "copyq --start-server"
      "wl-paste --type text --watch cliphist store"
      "eww open bar"
      "mako" # notification daemon
    ];
    exec = [
    ];
    input = {
      repeat_delay = "300";
      repeat_rate = "75";
      follow_mouse = "1";
      mouse_refocus = "false"; # steam pop-ups
    };
    misc = {
      no_direct_scanout = "true";
      # vrr = "1";
    };
    general = {
      allow_tearing = "true";
    };
    env = [
      "WLR_DRM_NO_ATOMIC,1"
      "QT_QPA_PLATFORM,wayland"
      "XDG_CURRENT_DESKTOP,sway"
    ];
  };
  wayland.windowManager.hyprland.plugins = [];
  home.packages = with pkgs; [
    swww # wallpaper
    grim # grab image (needed for flameshot)
  ];
}

