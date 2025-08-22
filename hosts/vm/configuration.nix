{ config, pkgs, ... }:

{
  imports = [
    ../../modules/desktop.nix
    ../../modules/programs.nix
    ../../modules/services.nix
    ../../modules/users.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."cryptroot" = {
    device = "/dev/disk/by-partlabel/nixos-root"; 
    preLVM = true;
    crypttabExtraOpts = [ "luks2" ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXROOT";
    fsType = "btrfs";
    options = [ "subvol=@" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/EFI";
    fsType = "vfat";
  };

  swapDevices = [ { device = "/swapfile"; } ];
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
}

