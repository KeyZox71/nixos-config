{ config, pkgs, ... }:

{
	programs.tmux = {
		enable = true;
		terminal = "screen-256color";
		prefix = "C-a";
		mouse = true;
		keyMode = "vi";
		baseIndex = 1;
		clock24 = true;
		plugins = with pkgs; [
			{
    		plugin = tmuxPlugins.resurrect;
    		extraConfig = "set -g @resurrect-strategy-nvim 'session'";
			}
  		{
		    plugin = tmuxPlugins.continuum;
 		  	extraConfig = ''
    			set -g @continuum-restore 'on'
					set -g @continuum-save-interval '15' # minutes
  		  '';
  		}
			{
				plugin = tmuxPlugins.catppuccin;
				extraConfig = "set -g @catppuccin_flavour 'frappe'"; 
			}
			tmuxPlugins.vim-tmux-navigator
			tmuxPlugins.sensible
		];
		extraConfig = ''
			set-option -g renumber-windows on 
			bind-key -n C-x kill-pane
			bind -n M-H previous-window
			bind -n M-L next-window
		''; 
	};
}
