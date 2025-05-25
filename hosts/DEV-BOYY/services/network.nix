{ ... }:

{
  networking = {
    hostName = "DEV-BOYY";
    networkmanager.enable = true;
    nameservers = [
      "8.8.8.8"
      "1.1.1.1"
      "192.168.1.254"
    ];
    firewall = {
      enable = false;
    };
  };
  services.tailscale = {
    enable = true;
    extraUpFlags = [ "--accept-routes" ];
  };
}
