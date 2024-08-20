{ config, pkgs, ... }:

{
	programs.waybar = {
		catppuccin = {
			enable = true;
			flavor = "frappe";
		}
	};
}
