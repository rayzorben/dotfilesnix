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
    corefonts
    vistafonts
    open-sans
    # Extras
    ghostty
    anyrun
    dunst
    eww
    nushell
    starship
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];


  programs.fish.enable = true;
  programs.steam.enable = true;
  programs.virt-manager.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}

