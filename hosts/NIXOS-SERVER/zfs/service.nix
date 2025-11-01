{ ... }:

{
  services.zfs = {
    autoScrub = {
      enable = true;
      interval = "weekly";
      pools = [ "BigBoyy" ];
    };
  };
}
