{ ... }:

{
	networking = {
		hostName = "vm-adjoly"; 
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
