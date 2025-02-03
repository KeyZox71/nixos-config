{ ... }:
{
  services.sanoid = {
    enable = true;
    templates = {
      high = {
        autosnap = true;
        autoprune = true;
        hourly = 12;
        daily = 3;
      };
      mid = {
        autosnap = true;
        autoprune = true;
        hourly = 6;
      };
      low = {
        autosnap = true;
        autoprune = true;
        daily = 3;
      };
      nocare = {
        autosnap = true;
        autoprune = true;
        monthly = 2;
      };
    };
    datasets = {
      "BigBoyy/pub" = {
        useTemplate = [ "low" ];
      };
      "BigBoyy/config/vaultwarden" = {
        useTemplate = [ "high" ];
      };
      "BigBoyy/config/ente-photo" = {
        useTemplate = [ "high" ];
      };
      "BigBoyy/config/torrent" = {
        useTemplate = [ "low" ];
        recursive = true;
      };
      "BigBoyy/config/overseerr" = {
        useTemplate = [ "high" ];
      };
      "BigBoyy/config/gitea" = {
        useTemplate = [ "high" ];
      };
      "BigBoyy/config/plex" = {
        useTemplate = [ "low" ];
      };
    };
  };
}
