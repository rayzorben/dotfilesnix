{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/boot.nix
    ../../modules/users.nix
    ../../modules/services.nix
    ../../modules/desktop.nix
    ../../modules/programs.nix
  ];

  nix.settings.download-buffer-size = 524288000;

  zramSwap.enable = true;

  networking.networkmanager.enable = true;
  time.timeZone = "America/Phoenix";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings.LC_TIME = "en_US.UTF-8";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  hardware.graphics.enable = true;
  
  # QEMU-specific graphics configuration
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  
  # Enable virtual console for debugging
  boot.kernelParams = [ "console=ttyS0" ];

  system.stateVersion = "25.05";
}

