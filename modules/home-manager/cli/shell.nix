{
  lib,
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./shell
  ];

  options = {
    keyzox.shell.enable = lib.mkEnableOption "Can be used to enable my shell config";
    keyzox.shell.nixos.enable = lib.mkEnableOption "Can be use the enable the shell config for nixos";
    keyzox.bitwarden-ssh-agent.enable = lib.mkEnableOption "Can be used to add the env for bitwarden ssh agent";
  };

  config = lib.mkMerge [
    (lib.mkIf config.keyzox.shell.enable {
      programs.zsh = {
        enable = lib.mkDefault true;
        autosuggestion.enable = true;
        enableCompletion = true;
        shellAliases = lib.mkBefore {
          l = "ls -lA --color=auto";
          ls = "ls -A --color=auto";
          grep = "grep --color=auto";
          tm = "timmy create -d";
          ts = "timmy search";
        };
        initContent = ''
          		bindkey -e
        '';
      };
      home.sessionVariables = {
        EDITOR = "nvim";
      };
    })
    (lib.mkIf config.keyzox.shell.nixos.enable {
      programs.zsh = {
        shellAliases = {
          re = "nh os switch /home/adjoly/nixos-config";
          lock = "hyprlock & systemctl suspend";
          hibernate = "hyprlock & systemctl hibernate";
        };
      };
    })
    (lib.mkIf config.keyzox.bitwarden-ssh-agent.enable {
      programs.zsh = {
        envExtra = lib.mkBefore ''
          export SSH_AUTH_SOCK=$HOME/.bitwarden-ssh-agent.sock
        '';
      };
      home.packages = [
        pkgs.unstable.bitwarden-desktop
      ];
    })
  ];
}
