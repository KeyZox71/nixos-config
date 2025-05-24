{ config, pkgs, ... }:

{
	programs.zsh = {
		enable = true;
		autosuggestion.enable = true;
		enableCompletion = true;
		initContent = ''
alias tm="timmy create"
alias ts="timmy search"
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
		'';
	};
}
