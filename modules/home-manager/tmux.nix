{
  config,
  pkgs,
  lib,
  ...
}:
{
  options.tmux = {
    enable = lib.mkOption {
      type = lib.types.bool;
      description = ''
        		Can be used to enable my tmux config
                			'';
      example = lib.literalExample "true";
      default = false;
    };
  };

  config = lib.mkIf config.tmux.enable {

    catppuccin.tmux.enable = true;

    programs.tmux = {
      enable = true;
      terminal = "tmux-256color";
      prefix = "C-a";
      mouse = true;
      keyMode = "vi";
      baseIndex = 1;
      clock24 = true;
      plugins =
        with pkgs;
        [
          tmuxPlugins.tmux-fzf
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

  };
}
