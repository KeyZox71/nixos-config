{ inputs, outputs, lib, config, pkgs, theme, ... }:

{
  imports = [

    ./dev.nix

    ./config/kitty.nix
    ./config/zsh.nix

  ];

  programs = {
    git = {
      enable = true;
      userName = "adjoly";
      userEmail = "adamjly@proton.me";
    };
    gh.enable = true;
		};

		services.nextcloud-client = {
			enable = true;
			startInBackground = true;
};

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  programs.home-manager.enable = true;

  home.stateVersion = "23.11";
}
