{ ... }:

{
	networking = {
		hostName = "LAPTOP-5530"; 
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
