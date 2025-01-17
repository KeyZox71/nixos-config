{ ... }:

{
	services.zfs = {
		autoScrub = {
			enable = true;
			interval = "weekly";
			pools = [ "BigBoyy" ];
		};
		autoSnapshot = {
			enable = true;
			daily = 7;
			weekly = 2;
			frequent = 4;
			hourly = 24;
			monthly = 2;
		};
	};
}
