{ config, pkgs, ... }:

{
	programs.zsh = {
		enable = true;
		autosuggestion.enable = true;
		enableCompletion = true;
		initExtra = ''
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
		'';
	};
}
