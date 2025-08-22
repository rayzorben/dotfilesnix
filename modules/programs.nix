{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    firefox
    git
    discord
    dropbox
    microsoft-edge
    remmina
    freerdp3
    nodejs
    nerdfonts
    corefonts
    vistafonts
    open-sans
    # Extras
    ghostty
    anyrun
    dunst
    eww
    nu
    starship
  ];

  programs.steam.enable = true;
  programs.virt-manager.enable = true;
}

