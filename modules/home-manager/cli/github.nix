{
  config,
  lib,
  ...
}:

{
  options = {
    keyzox.gh.enable = lib.mkEnableOption "Can be used to enable gh config";
  };

  config = lib.mkIf config.keyzox.gh.enable {
    programs = {
      gh = {
        enable = true;
        settings = {
          editor = lib.mkDefault "nvim";
          git_protocol = lib.mkDefault "ssh";
        };
      };
    };
  };
}
