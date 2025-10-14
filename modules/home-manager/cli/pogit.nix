{
  config,
  lib,
  ...
}:

{
  options = {
    keyzox.pogit.enable = lib.mkEnableOption "Can be used to enable my pogit config :D";
  };

  config = lib.mkIf config.keyzox.pogit.enable {
    programs.pogit = {
      enable = true;
      config = {
        merge = {
          icon = "🔀";
          msg = "a very cool feature has been merged ! :D";
        };
        release = {
          icon = "🔖";
          msg = "new version has been pushed";
        };
        refactor = {
          icon = "♻️";
          msg = "some code has been refactored";
        };
        ci = {
          icon = "👷";
          msg = "ci just got an update";
        };
        update = {
          icon = "🆙";
          msg = "just made a quick update !";
        };
      };
    };
  };
}
