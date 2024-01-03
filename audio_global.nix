{ config, pkgs, ... }: {
  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    jack.enable = true;
  };

  environment.systemPackages = with pkgs; [
    pulseaudio # this is for enabling compatibility layer for pipewire
    # pulse audio will never be used as a service (avoid conflicts)
    alsa-utils
    playerctl
  ];
}
