{ ... }:

{
	networking = {
		hostName = "nixos-server"; 
		hostId = "49ff816f";
		networkmanager.enable = true;
		firewall = {
			enable = false;
		};
	};
	services.tailscale = {
		enable = true;
		extraUpFlags = [ "--ssh --accept-routes" ];
	};
}
