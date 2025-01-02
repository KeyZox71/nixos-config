{ ... }:

{
	services.openssh = {
		enable = true;
		settings = {
			PermitRootLogin = "no";
			PasswordAuthentication = false;
		};
	};

	users.users.adjoly.openssh.authorizedKeys.keys = [
		"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIYo5B/kTDIx78dqqFd+MOdcQbuKDtbg+lwepOQt6l4N adamj@truenas.joly"
	];
}
