{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.sddm.theme = "sddm-chili"; # Example
  services.xserver.windowManager.niri.enable = true;
}

