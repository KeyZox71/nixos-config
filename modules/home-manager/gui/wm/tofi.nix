{
  config,
  lib,
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
        width = "600";
        height = "345";

        prompt-text = ">";
        prompt-background-padding = 100;
        hide-cursor = "true";
        matching-algorithm = "fuzzy";

        border-width = 0;
        outline-width = 0;
        padding-top = 8;
        padding-left = 8;
        padding-right = 8;
        padding-bottom = 8;
        scale = true;

        text-color = "#b7bdf8";
        selection-color = "#c6a0f6";
        prompt-color = "#c6a0f6";
        result-spacing = "13";
        corner-radius = "10";
        border-color = "#c6a0f6";
        prompt-padding = 8;

        background-color = "#1e2030";

        font = "monospace";
        font-size = 18;

        num-results = 6;

        terminal = "kitty";
      };
    };
  };
}
