{ config, lib, pkgs, ... }:

{
	programs = {
		zsh = {
			enable = true;
			autosuggestion.enable = true;
			enableCompletion = true;
			plugins = 
			[
			  {
			    name = "zsh-z";
			    src = pkgs.fetchFromGitHub {
			      owner = "agkozak";
			      repo = "zsh-z";
				  rev = "afaf2965b41fdc6ca66066e09382726aa0b6aa04";
			      sha256 = "1s23azd9hk57dgya0xrqh16jq1qbmm0n70x32mxg8b29ynks6w8n";
			    };
			  }
			];
			shellAliases = {
				l = "ls -lA --color=auto";
		  	    ls = "ls -A --color=auto";
			    re = "sudo nixos-rebuild switch";
			    update = "sudo nix flake update && sudo nixos-rebuild switch";
			    grep = "grep --color=auto";
				hre = "nix run home-manager switch";
				kty-frappe = "kitty +kitten themes Catppuccin-Frappe";
				kty-latte = "kitty +kitten themes Catppuccin-Latte";
				kbus = "setxkbmap -layout us -variant intl";
				powershell = "nix-shell -p powershell --run pwsh";
			};
			initExtra = ''
				setxkbmap -layout us -variant intl
				tm() {
					if [[ -n "$TMUX" ]]; then
						command tmux "$@"
					elif [[ "$#" -eq 0 ]]; then
						command tmux new-session -s "''${PWD##*/}"
				    elif [[ "$#" -eq 1 && "$1" != -* ]]; then
					    command tmux new-session -s "$1"
					else
						command tmux "$@"
				    fi
				}
				bgs() {
					if [[ "$#" -eq 1 && "$1" != -* ]]; then
						command nix-shell -p brightnessctl --run "brightnessctl set $1"
					else
						command nix-shell -p brightnessctl --run "brightnessctl set 100"
					fi
				}
				vol() {
					if [[ "$#" -eq 1 && "$1" != -* ]]; then
						command pactl set-sink-volume 0 $1%
					else
						command pactl set-sink-volume 0 0%
					fi
				}
				fzf-tmux-session() {
					local session
					session=$(tmux list-sessions -F "#{session_name}" | fzf)
    
					if [ ! -z "$session" ]; then
						tmux attach -t "$session"
					fi
				}
				alias ts='fzf-tmux-session'
				function cdd() {
				    local dir_path="$(dirname "$(find . -type f | fzf)")"
				    
				    if [[ -z "$dir_path" ]]; then
				        echo "No file selected."
				        return
				    fi
				
				    dir_path=$(realpath "$dir_path")
				
				    local session_name="$(basename "$dir_path")"
				
				    if tmux has-session -t "$session_name" 2>/dev/null; then
				        echo "Reattaching to existing session named $session_name"
				        tmux attach -t "$session_name"
				    else
				        echo "Creating new tmux session named $session_name"
				        tmux new-session -d -s "$session_name" -c "$dir_path"
				        tmux attach -t "$session_name"
				    fi
				}
				path+=('/home/adjoly/.local/bin')
			'';
		};

		thefuck = {
			enable = true;
			enableZshIntegration = true;
		};

		fzf = {
			enable = true;
			enableZshIntegration = true;
			tmux.enableShellIntegration = true;
		#	colors = {
				#"bg+" = "#414559";
			#	bg = "#303446";
			#	spinner = "#f2d5cf";
			#	hl = "#e78284";
				#fg = "#c6d0f5";
			#	header = "#e78284";
			#	info = "#ca9ee6";
			#	pointer = "#f2d5cf";
			#	marker = "#f2d5cf";
				#"fg+" = "#c6d0f5";
			#	prompt = "#ca9ee6";
			#	"hl+" = "#e78284";
			#};
		};

		starship = {
			enable = true;
			enableZshIntegration = true;
			settings = {
				add_newline = false;
				format = lib.concatStrings [ 
					"$os$directory$git_branch $git_status"
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
			#	hostname = {
			#		ssh_only = false;
			#		ssh_symbol = " ";
			#		format = "on [$hostname](bold yellow)";
			#		disabled = false;
			#	};
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
				#git_status = {
				#	format = "[$all_status$ahead_behind]($style) ";
				#	style = "bold green";
				#	conflicted = "🏳";
				#	up_to_date = "";
				#	untracked = "[](red) ";
				#	ahead = "⇡${count}";
				#	diverged = "⇕⇡${ahead_count}⇣${behind_count}";
				#	behind = "⇣${count}";
				#	stashed = " ";
				#	modified = " ";
				#	staged = "[++\($count\)](green)";
				#	deleted = " ";
				#};
				git_branch = {
					symbol = " ";
					format = "via [$symbol$branch]($style)";
					truncation_length = 4;
					truncation_symbol = "…/";
					style = "bold green";
				};
				os.symbols = {
					NixOS = " ";
					Ubuntu = " ";
				};
			};
		};
	};
}
