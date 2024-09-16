{ pkgs, ... }:

{

	fonts = {
		enableDefaultPackages = true;
		packages = with pkgs; [
			(nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
			jetbrains-mono
			noto-fonts
		];
		fontconfig = {
			defaultFonts = {
				serif = [
					"JetBrains Mono"
					"Noto Color Emoji"
				];
				sansSerif = [
					"JetBrains Mono"
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
