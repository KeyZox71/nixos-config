{ pkgs, ... }:

let
	source = pkgs.fetchurl {
		url = "https://drive.kanel.ovh/s/kS7b2Gpip6TkyGY/download/hyprlock.png";
		sha256 = "mRpFtFyEbZjH3y501UrA/O+jhBNvtlD/6VwkCwYlITQ=";
	};
	bsky-profile = pkgs.fetchurl {
		url = "https://cdn.bsky.app/img/avatar/plain/did:plc:7g74v3wiannux6tuc5t74gln/bafkreigdabcv3w3qmabjtkwxb6rnvtgnk3megwdcclni6bkv4frbcqf4ma@jpeg";
		sha256 = "jKqJ+6PEO37NpY0FakGAwrRKzY1N6A6mYeUxhaL+jAA=";
	};
in
{
	programs.hyprlock = {
		enable = true;
		settings = {
			general = {
				disable_loading_bar = true;
				no_fade_in = true;
				ignore_empty_input = true;
				grace = 0;
			};
			input-field = {
				monitor = "";
				size = "200, 50";
				position = "0, 150";
				outer_color = "rgba(0, 0, 0, 0)";
				fail_color = "rgba(231, 130, 132, 0.90)";
				fail_text = "Wrong password";
				check_color = "rgba(225, 200, 145, 0.90)";
				rounding = 10;
				font_color = "rgba(198, 208, 245, 1.0)";
				font_size = 3;
				dot_spacing = 0.3;
				dot_size = 1.0;
				inner_color = "rgba(48, 52, 70, 0.7)";
				placeholder_text = "Enter password";
				hide_input = false;
				fade_on_empty = false;
				halign = "center";
				valign = "bottom";
				font_family = "Noto Sans Regular";
				outline_thickness = 2;
			};
			background = {
				blur_passes = 1;
				blur_size = 1;
				monitor = "";
				path = "${source}";
			};
			label = [
				{
					monitor = "";
					font_size = 120;
					position = "0, 250";
					text = "cmd[update:1000] echo \"<span>\$(date +\"\%H:\%M\")</span>\"";
					halign = "center";
					valign = "center";
					font_family = "Noto Sans Medium";
					color = "rgba(216, 222, 233, 0.90)";
				}
				{
					text = "cmd[update:1000] echo -e \"$(date +\"%A, %B %d\")\"";
					monitor = "";
					position = "0, 350";
					halign = "center";
					valign = "center";
					font_family = "Noto Sans Medium";
					color = "rgba(216, 222, 233, 0.90)";
				}
				{
					text = "adjoly's computer";
					position = "0, 225";
					font_size = 15;
					font_family = "Noto Sans Medium";
					color = "rgba(216, 222, 233, 0.95)";
					halign = "center";
					valign = "botton";
				}
			];
			shape = [
				{
					monitor = "";
					size = "300, 350";
					position = "0, 100";
					halign = "center";
					valign = "botton";
					color = "rgba(35, 38, 52, 0.7)";
					rounding = 10;
				}
			];
			image = [
				{
					monitor = "";
					path = "${bsky-profile}";
					border_size = 0;
					position = "0, 270";
					size = 130;
					rounding = -1;
					halign = "center";
					valign = "botton";
				}
			];
		};
	};
}
