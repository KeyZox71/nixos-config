{ config, lib, pkgs, ... }:

{
	programs = {
		zsh = {
			enable = true;
			autosuggestion.enable = true;
			enableCompletion = true;
			plugins = [
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
			initExtra = ''
				tm() {
					if [[ -n "$TMUX" ]]; then
						# If inside a tmux session, just use the original tmux command
						command tmux "$@"
					elif [[ "$#" -eq 0 ]]; then
						command tmux new-session -s "''${PWD##*/}"
				    elif [[ "$#" -eq 1 && "$1" != -* ]]; then
					    command tmux new-session -s "$1"
					else
						command tmux "$@"
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
					# Use fzf to select a file and get its directory name
				    local dir_path="$(dirname "$(find . -type f | fzf)")"
				    
				    # Exit if no file (and thus no directory) was selected
				    if [[ -z "$dir_path" ]]; then
				        echo "No file selected."
				        return
				    fi
				
				    # Get the absolute path if not already
				    dir_path=$(realpath "$dir_path")
				
				    # Use the name of the directory as the session name
				    local session_name="$(basename "$dir_path")"
				
				    # Create or re-attach to a tmux session with the name of the directory
				    if tmux has-session -t "$session_name" 2>/dev/null; then
				        echo "Reattaching to existing session named $session_name"
				        tmux attach -t "$session_name"
				    else
				        echo "Creating new tmux session named $session_name"
				        tmux new-session -d -s "$session_name" -c "$dir_path"
				        tmux attach -t "$session_name"
				    fi
				}
			'';
		};

		thefuck = {
			enable = true;
			enableZshIntegration = true;
		};

		fzf = {
			enable = true;
			catppuccin.flavor = "latte";
			enableZshIntegration = true;
			tmux.enableShellIntegration = true;
		};

		starship = {
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
			};
		};
	};
}
