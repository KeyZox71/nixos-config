{
  pkgs,
  inputs,
  outputs,
  ...
}:

{
  imports = [
	./zfs
	./virt
	./services
	./hardware

	./env.nix
	./boot.nix

    inputs.home-manager.nixosModules.home-manager
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  environment.variables = {
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    git
    zsh
    nil
    vim
    wget
    curl
	sudo
    btop
    unzip
    cifs-utils
  ];

  users.users.adjoly = {
    shell = pkgs.zsh;
    isNormalUser = true;
	initialPassword = "alpine";
    extraGroups = [
      "sudo"
      "input"
      "wheel"
	  "networkmanager"
    ];
  };


  nixpkgs.config.permittedInsecurePackages = [
  ];

  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs outputs; };
    users.adjoly = import ../../home/adjoly/home-cli.nix;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
