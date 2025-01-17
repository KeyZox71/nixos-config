{ ... }:

{
	networking = {
		hostName = "VM-ADJOLY"; 
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
