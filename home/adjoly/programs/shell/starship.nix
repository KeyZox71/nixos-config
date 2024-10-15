{ lib, ... }:
{
	programs.starship = {
		enable = true;
		catppuccin.enable = false;
		enableZshIntegration = true;
		settings = {
			add_newline = false;
			format = " $directory $git_branch$git_status[➜](bold green) ";
			directory = {
				truncation_length = 3;
				fish_style_pwd_dir_length = 3;
				home_symbol = "󰋜 ";
				read_only_style = "197";
				read_only = " 󰌾";
				format = "[$path]($style)[$read_only]($read_only_style)";
			};
			git_branch = {
				symbol = "";
				format = "via [$symbol $branch]($style) ";
				truncation_length = 7;
				truncation_symbol = "…/";
				style = "bold green";
			};
			git_status = {
				format = "([$all_status$ahead_behind](bold red)) ";
				staged = "•";
				modified = "~";
				untracked = "+";
				up_to_date = "(bold green)";
			};
		};
	};
}
