{ config, pkgs, ... }:

{
  imports = [
    ../../modules/desktop.nix
    ../../modules/programs.nix
    ../../modules/services.nix
    ../../modules/users.nix
  ];

  # EFI Boot + LUKS + BTRFS
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."root" = {
    device = "/dev/disk/by-uuid/<UUID>"; # Replace after install
    preLVM = true;
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/<UUID>";
    fsType = "btrfs";
    options = [ "subvol=@" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/<UUID>";
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

