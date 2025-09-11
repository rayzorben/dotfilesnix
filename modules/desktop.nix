{ pkgs, ... }:

{
  # Display manager (login)
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true; # allow Wayland sessions
  services.displayManager.sddm.theme = "sddm-chili";

  programs.niri = {
    enable = true;
    # Configuration for virtualized environments
    settings = {
      outputs = [
        {
          name = "Virtual-1";
          mode = "1920x1080@60Hz";
          position = [ 0 0 ];
        }
      ];
      animations.enable = true;
      window-rules = [
        {
          matches = [ { app-id = ".*"; } ];
          geometry-corner-radius = 8;
        }
      ];
    };
  };
  
  # QEMU/Virtualization specific settings for Wayland
  environment.sessionVariables = {
    WLR_BACKEND = "headless";
    WLR_LIBINPUT_NO_DEVICES = "1";
  };
  
  # Enable virtual console for debugging
  services.getty.autologinUser = "rayben";
  
  # Add X11 fallback session for VM compatibility
  services.xserver.desktopManager.xfce.enable = true;
  services.displayManager.defaultSession = "niri";
}

