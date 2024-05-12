{ config, ... }:

{
	programs = {
		zsh = {
			enable = true;
			autosuggestions.enable = true;
			enableCompletion = true;
			shellAliases = {
				l = "ls -lA --color=auto";
  	    ls = "ls -A --color=auto";
  	    re = "sudo nixos-rebuild switch";
  	    grep = "grep --color=auto";
			};
		};

		fzf = {
			enable = true;
			enableZshIntegration = true;
			tmux.enableShellIntegration = true;
			colors = {
				"bg+" = "#414559";
				bg = "#303446";
				spinner = "#f2d5cf";
				hl = "#e78284";
				fg = "#c6d0f5";
				header = "#e78284";
				info = "#ca9ee6";
				pointer = "#f2d5cf";
				marker = "#f2d5cf";
				"fg+" = "#c6d0f5";
				prompt = "#ca9ee6";
				"hl+" = "#e78284";
			};
		};

		starship = {
			enable = true;
			enableZshIntegration = true;
			settings = {
				add_newline = false;
				format = lib.concatStrings [ 
					"$os$hostname $directory$git_branch $git_status"
					"[➜](bold green)"
				];
				right_format = lib.concatStrings [
					"$time"
				];
				os = {
					format = "[$symbol]($style)";
					style = "#FF8000";
					disabled = false;
				};
				hostname = {
					ssh_only = false;
					ssh_symbol = " ";
					format = "on [$hostname](bold yellow)";
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
					format = "at [$path]($style)[$read_only]($read_only_style) ";
				};
				git_status = {
					format = "[$all_status$ahead_behind]($style) ";
					style = "bold green";
					conflicted = "🏳";
					up_to_date = "";
					untracked = "[](red) ";
					ahead = "⇡${count}";
					diverged = "⇕⇡${ahead_count}⇣${behind_count}";
					behind = "⇣${count}";
					stashed = " ";
					modified = " ";
					staged = "[++\($count\)](green)";
					deleted = " ";
				};
				git_branch = {
					symbol = " ";
					format = "via [$symbol$branch]($style)";
					# truncation_length = 4
					truncation_symbol = "…/";
					style = "bold green";
				};
				os.symbols = {
					NixOS = " ";
				};
			};
		};
	};
}