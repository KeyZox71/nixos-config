{ pkgs, libs, config, inputs, outputs, ... }:

{
  networking = {
		hostName = "LAPTOP-5530-ADAM"; 
    networkmanager.enable = true;
    firewall = {
      enable = false;
    };
  };
  services.tailscale = {
			enable = true;
			extraUpFlags = [ "--accept-routes" ];
  };
}
