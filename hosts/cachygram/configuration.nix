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

  # Intel Xe Graphics
  services.xserver.videoDrivers = [ "xe" ];
  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = [ pkgs.intel-media-driver ];

  system.stateVersion = "25.05";
}

