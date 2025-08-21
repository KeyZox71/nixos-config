{ ... }:

{
  services.samba = {
    enable = true;
    settings = {
      global = {
        "invalid users" = [
          "root"
        ];
        "passwd program" = "passwd %u";
        security = "user";
        "netbios name" = "NIXOS-SERVER";
        workgroup = "WORKGROUP";
      };
      public = {
        browseable = "yes";
        comment = "Public samba share.";
        "guest ok" = "no";
        path = "/BigBoyy/pub";
        "read only" = "no";
      };
      plex = {
        browseable = "yes";
        comment = "Plex samba share.";
        "guest ok" = "no";
        path = "/BigBoyy/plex";
        "read only" = "no";
      };
      torrent = {
        browseable = "yes";
        comment = "torrent";
        "guest ok" = "no";
        path = "/BigBoyy/torrent";
        "read only" = "no";
      };
    };
    nmbd.enable = true;
  };
}
