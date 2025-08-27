{ pkgs, ... }:

{
  # Display manager (login)
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true; # allow Wayland sessions
  services.displayManager.sddm.theme = "sddm-chili";

  programs.niri.enable = true;
}

