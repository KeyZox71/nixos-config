{
  pkgs,
  modulesPath,
  lib,
  ...
}:

{
  imports = [
    (modulesPath + "/profiles/minimal.nix")

    ../home.nix
  ];

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PermitRootLogin = "yes";
      PasswordAuthentication = true;
      AllowUsers = null;
    };
  };

  networking.hostName = "virtualBoyy";
  keyzox = {
    defaults = true;
    wm = true;

    theme.enable = true;
    boot = lib.mkForce false;

    # hardware = {
    #   bluetooth.enable = true;
    #   logitech.enable = true;
    #   nvidia.enable = true;
    # };
    programs = {
      docker.enable = true;
      # steam.enable = true;
    };
    services = {
      ly.enable = true;
      gdm.enable = lib.mkForce false;
    };
  };

  system.stateVersion = "25.05"; # Did you read the comment?
}
