{ config, pkgs, ... }:

{
	programs.neovim = {
		enable = true;
		extraPackages = with pkgs; [
			clang
			clang-tools
		];
	};
}
