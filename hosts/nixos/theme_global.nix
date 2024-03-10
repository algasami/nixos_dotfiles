{ pkgs, ... }:
{
  environment.variables.GTK_THEME = "Catppuccin-Latte-Standard-Pink-Dark";
  environment.variables.XCURSOR_THEME = "Catppuccin-Latte-Pink";
  environment.variables.XCURSOR_SIZE = "24";
  console = {
    earlySetup = true;
    colors = [
      "24273a"
      "ed8796"
      "a6da95"
      "eed49f"
      "8aadf4"
      "f5bde6"
      "8bd5ca"
      "cad3f5"
      "5b6078"
      "ed8796"
      "a6da95"
      "eed49f"
      "8aadf4"
      "f5bde6"
      "8bd5ca"
      "a5adcb"
    ];
  };

  nixpkgs.config.packageOverrides = pkgs: {
    colloid-icon-theme = pkgs.colloid-icon-theme.override { colorVariants = ["pink"]; };
    catppuccin-gtk = pkgs.catppuccin-gtk.override {
      accents = [ "pink" ]; # You can specify multiple accents here to output multiple themes 
      size = "standard";
      variant = "latte";
    };
    # discord = pkgs.discord.override {
    #   withOpenASAR = true;
    #   withTTS = true;
    # };
  };

  environment.systemPackages = with pkgs; [
    numix-icon-theme-circle
    colloid-icon-theme
    catppuccin-gtk
    catppuccin-kvantum
    catppuccin-cursors.lattePink

    gnome.gnome-tweaks
    gnome.gnome-shell
    gnome.gnome-shell-extensions
    gnome.gnome-themes-extra
    # xsettingsd
    # themechanger
  ];
}
