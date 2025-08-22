{ config, pkgs, ... }:

{
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Initrd + LUKS2
  boot.initrd.systemd.enable = true;

  # Plymouth graphical boot + unlock
  boot.plymouth = {
    enable = true;
    theme = "breeze"; # or "spinner", "solar", etc.
  };
}
