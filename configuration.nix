# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ...}:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  
  # Load nvidia driver for xorg and wayland
  services.xserver.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  # enables sddm
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };
  
  hardware.nvidia = {
    # modesetting is required
    modesetting.enable = true;

    # nvidia power management is experimental
    powerManagement.enable = true;
    # nvidia fine-grain smart power management is also experimental
    # if you have a new gpu then you can probably use it...
    powerManagement.finegrained = false;

    # use the nvidia open-source driver or not
    # pro tip: use it!
    open = true;

    # enable the nvidia settings menu
    # call me via nvidia-settings
    nvidiaSettings = true;

    # select the appropriate driver
    package = config.boot.kernelPackages.nvidiaPackages.stable;

  };

  # hyprland manager
  programs.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
  };
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Taipei";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_TW.UTF-8";
    LC_IDENTIFICATION = "zh_TW.UTF-8";
    LC_MEASUREMENT = "zh_TW.UTF-8";
    LC_MONETARY = "zh_TW.UTF-8";
    LC_NAME = "zh_TW.UTF-8";
    LC_NUMERIC = "zh_TW.UTF-8";
    LC_PAPER = "zh_TW.UTF-8";
    LC_TELEPHONE = "zh_TW.UTF-8";
    LC_TIME = "zh_TW.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.layout = "us";
  services.xserver.xkbVariant = "";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.algasami = {
    isNormalUser = true;
    description = "algasami";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    hashedPasswordFile = config.age.secrets."ssh-default".path;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    kitty
    home-manager
    wl-clipboard
  ];
  programs.neovim = {
    enable = true;
    configure = {
      customRC = ''
      set relativenumber number
      set tabstop=2
      set shiftwidth=2
      set expandtab
      set softtabstop=2
      '';
    };
  };
  environment.variables.EDITOR = "nvim";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
