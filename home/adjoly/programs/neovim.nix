{ inputs, pkgs, ... }:
{
	nixpkgs.overlays = [
		inputs.keyznvim.overlays.default
	];
	home.packages = with pkgs; [
		keyznvim
	];
}
