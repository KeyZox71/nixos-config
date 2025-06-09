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
    shell.enable = lib.mkEnableOption "Can be used to enable my shell config";
    shell.nixos.enable = lib.mkEnableOption "Can be use the enable the shell config for nixos";
    bitwarden-ssh-agent.enable = lib.mkEnableOption "Can be used to add the env for bitwarden ssh agent";
  };

  config = lib.mkMerge [
    (lib.mkIf config.shell.enable {
      programs.zsh = {
        enable = lib.mkDefault true;
        autosuggestion.enable = true;
        enableCompletion = true;
        shellAliases = lib.mkBefore {
          l = "ls -lA --color=auto";
          ls = "ls -A --color=auto";
          grep = "grep --color=auto";
          tm = "timmy create";
          ts = "timmy search";
        };
      };
    })
    (lib.mkIf config.shell.nixos.enable {
      programs.zsh = {
        shellAliases = {
          re = "nh os switch /home/adjoly/nixos-config";
          lock = "hyprlock & systemctl suspend";
          hibernate = "hyprlock & systemctl hibernate";
        };
      };
    })
    (lib.mkIf config.bitwarden-ssh-agent.enable {
      home.packages = [
        pkgs.unstable.bitwarden-desktop
      ];
      programs.zsh = {
        envExtra = lib.mkBefore ''
          export SSH_AUTH_SOCK=$HOME/.bitwarden-ssh-agent.sock
        '';
      };
    })
  ];
}
