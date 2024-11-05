{ pkgs, ... }:

{
	programs.tmux = {
		enable = true;
		catppuccin.enable = true;
		terminal = "tmux-256color";
		prefix = "C-a";
		mouse = true;
		keyMode = "vi";
		baseIndex = 1;
		clock24 = true;
		plugins = with pkgs; [
			tmuxPlugins.tmux-fzf
			{
				plugin = tmuxPlugins.resurrect;
				extraConfig = ''
					set -g @resurrect-capture-pane-contents 'on'
				'';
			}
			{
				plugin = tmuxPlugins.continuum;
				extraConfig = ''
					set -g @continuum-boot 'on'
					set -g @continuum-restore 'on'
					set -g @continuum-save-interval '5' # minutes
				'';
			}
			tmuxPlugins.vim-tmux-navigator
			tmuxPlugins.sensible
		];
		extraConfig = ''
set-option -g renumber-windows on 
bind-key -n C-x kill-pane
bind -n M-H previous-window
bind -n M-L next-window
bind-key "C-l" run-shell -b "${pkgs.tmuxPlugins.tmux-fzf}/share/tmux-plugins/tmux-fzf/scripts/session.sh switch"

# Status
set -g status-right '%Y-%m-%d %H:%M '
set -g status-left '''
set -g status-position bottom

# Window status
setw -g window-status-current-format ' #I #W #F '
setw -g window-status-current-style 'fg=#303446 bg=#babbf2'
setw -g window-status-format ' #I #[fg=white]#W #[fg=mauve]#F '

# Pane status
set -g pane-border-style 'fg=#292c3c'

		''; 
	};
}
