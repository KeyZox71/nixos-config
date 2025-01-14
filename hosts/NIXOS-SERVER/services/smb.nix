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
			};
			public = {
				browseable = "yes";
				comment = "Public samba share.";
				"guest ok" = "no";
				path = "/BigBoyy/public";
				"read only" = "no";
			};
		};
	};
}
