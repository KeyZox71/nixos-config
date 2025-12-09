{
  lib,
  config,
  ...
}:

let
  sshAgentLocation = "/home/adjoly/.bitwarden-ssh-agent.sock";
  ft_pubKeyLocation = "/home/adjoly/.ssh/id_42.pub";
  git_pubKeyLocation = "/home/adjoly/.ssh/id_git.pub";
in
{
  options = {
    keyzox.ssh-config.enable = lib.mkEnableOption "Can be used the set the default configs for ssh";
  };

  config = lib.mkIf config.keyzox.ssh-config.enable {
    home.file = {
      "id_42.pub" = {
        target = ".ssh/id_42.pub";
        text = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEkLpl9HygemfyK7obLW7HCuFf4X5UFZCuXE28oe6xDN adjoly@student.42angouleme.fr";
      };
      "id_git.pub" = {
        target = ".ssh/id_git.pub";
        text = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOCi8T2p48jD7EbneWqTLoyvs1SGfZBzfUb85k2oALTe";
      };
    };
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks = {
        "ovh-vps" = {
          hostname = "ovh-vps.neko-diminished.ts.net";
          user = "rocky";
          forwardAgent = true;
        };
        "nixos-server" = {
          hostname = "nixos-server.neko-diminished.ts.net";
          user = "adjoly";
          forwardAgent = true;
        };
        "mini-boyy" = {
          hostname = "mini-boyy.neko-diminished.ts.net";
          user = "adjoly";
          forwardAgent = true;
        };
        "github.com" = {
          hostname = "github.com";
          user = "git";
          identityAgent = [
            sshAgentLocation
          ];
          identityFile = git_pubKeyLocation;
        };
        "codeberg.org" = {
          hostname = "codeberg.org";
          user = "git";
          identityAgent = [
            sshAgentLocation
          ];
          identityFile = git_pubKeyLocation;
        };
        "vogsphere.42angouleme.fr" = {
          hostname = "vogsphere.42angouleme.fr";
          user = "git";
          identityAgent = [
            sshAgentLocation
          ];
          identityFile = ft_pubKeyLocation;
        };
      };
    };
  };
}
