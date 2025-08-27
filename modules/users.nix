{ pkgs, ... }:

{
  users.users.rayben = {
    isNormalUser = true;
    description = "Ray Bennett";
    extraGroups = [ "networkmanager" "wheel" "libvirt" ];
    shell = pkgs.fish;
    hashedPassword = "$6$.7VXwaA6$bt9jvRb8VxYMSQCtdyoyGyFhXGkAdTPDW/a1RCT8DPQzLYCGtze6L3jGVpMSatsJ21PoZrToFpQ6JqDLR3mjR1";
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

