{ config, pkgs, ... }:

{
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Initrd + LUKS2
  boot.initrd.luks.forceLuks2 = true;
  boot.initrd.systemd.enable = true;

  # Plymouth graphical boot + unlock
  services.plymouth = {
    enable = true;
    theme = "breeze"; # or "spinner", "solar", etc.
  };
}
