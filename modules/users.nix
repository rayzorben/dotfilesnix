{ pkgs, ... }:

{
  users.users.rayben = {
    isNormalUser = true;
    description = "Ray Bennett";
    extraGroups = [ "networkmanager" "wheel" "libvirt" ];
    shell = pkgs.fish;
  };

  security.sudo.extraRules = [
    {
      users = [ "rayben" ];
      commands = [{
        command = "ALL";
        options = [ "SETENV" "NOPASSWD" ];
      }];
    }
  ];
}

