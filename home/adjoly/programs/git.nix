{ ... }:

{
	imports = [
		./github-cli.nix
	];

  programs = {
    git = {
      enable = true;
      userName = "adjoly";
      userEmail = "adamjly@proton.me";
    };
  };
}
