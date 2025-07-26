{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    keyzox.tofi.enable = lib.mkEnableOption "Can be used to enable my tofi config";
  };

  config = lib.mkIf config.keyzox.tofi.enable {
    programs.tofi = {
      enable = true;
      settings = {
        width = "100%";
        height = "100%";

        prompt-text = "> ";
        hide-cursor = "true";

        border-width = "0";
        outline-width = "0";
        padding-left = "33%";
        padding-top = "20%";

        text-color = "#babbf1";
        selection-color = "#e78284";
        prompt-color = "#eebebe";
        result-spacing = "15";

        background-color = "#303446df";

        font = "monospace";

        num-results = "10";

        terminal = "kitty";
      };
    };
  };
}
