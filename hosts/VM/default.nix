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

  environment.systemPackages = with pkgs; [
    bindfs
  ];

  system.stateVersion = "25.05"; # Did you read the comment?

  # TODO: evaluation warning: You have set specialArgs.pkgs, which means that options like nixpkgs.config
  #                  and nixpkgs.overlays will be ignored. If you wish to reuse an already created
  #                  pkgs, which you know is configured correctly for this NixOS configuration,
  #                  please import the `nixosModules.readOnlyPkgs` module from the nixpkgs flake or
  #                  `(modulesPath + "/misc/nixpkgs/read-only.nix"), and set `{ nixpkgs.pkgs = <your pkgs>; }`.
  #                  This properly disables the ignored options to prevent future surprises.

}
