{ pkgs, ... }:

{
	fonts = {
		enableDefaultPackages = true;
		packages = with pkgs; [
			(nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

			jetbrains-mono
			noto-fonts-emoji
			vistafonts
			corefonts
		];
		fontconfig = {
			enable = true;
			defaultFonts = {
				serif = [
					"Noto Serif"
					"Noto Color Emoji"
				];
				sansSerif = [
					"Noto Sans"
					"Noto Color Emoji"
				];
				monospace = [
					"JetBrains Mono"
					"Noto Emoji"
				];
				emoji = [
					"Noto Color Emoji"
				];
			};
		};
	};
}
