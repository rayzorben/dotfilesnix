{
  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  virtualisation.libvirtd.enable = true;
  powerManagement.cpuFreqGovernor = "performance";
  services.power-profiles-daemon.enable = true;
}

