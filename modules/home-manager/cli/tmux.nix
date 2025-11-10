{
  config,
  pkgs,
  lib,
  ...
}:
{
  options = {
    keyzox.tmux.enable = lib.mkEnableOption "Can be used to enable my tmux config";
  };

  config = lib.mkIf config.keyzox.tmux.enable {

    catppuccin.tmux.enable = true;

    programs.tmux = {
      enable = true;
      terminal = "tmux-256color";
      prefix = "C-a";
      mouse = true;
      keyMode = "vi";
      baseIndex = 1;
      clock24 = true;
      plugins = with pkgs; [
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
        setw -g window-status-current-style 'fg=#24273a bg=#cad3f5'
        setw -g window-status-format ' #I #[fg=white]#W #[fg=mauve]#F '

        # Pane status
        set -g pane-border-style 'fg=#1e2030'
      '';
    };

  };
}
