{ lib, ... }:
{
	programs.starship = {
		enable = true;
		catppuccin.enable = false;
		enableZshIntegration = true;
		settings = {
			add_newline = false;
			format = lib.concatStrings [ 
				"$directory$git_branch $git_status"
				"[➜](bold green) "
			];
			right_format = lib.concatStrings [
				"$time"
			];
			os = {
				format = "[$symbol]($style)";
				style = "#abcdef";
				disabled = false;
			};
			time = {
				disabled = false;
				time_format = "%R";
				format = "[$time](fg:#8DFBD2)";
			};
			cmd_duration = {
				format = "last command: [$duration](bold yellow)";
			};
			directory = {
				truncation_length = 3;
				fish_style_pwd_dir_length = 2;
				home_symbol = "󰋜 ~";
				read_only_style = "197";
				read_only = " 󰌾 ";
				format = "[$path]($style)[$read_only]($read_only_style) ";
			};
			git_branch = {
				symbol = " ";
				format = "via [$symbol$branch]($style)";
				truncation_length = 4;
				truncation_symbol = "…/";
				style = "bold green";
			};
		};
	};
}
