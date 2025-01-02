{ ... }:

{
	services.zfs = {
		autoScrub = {
			enable = true;
			interval = "monthly";
			pools = [ "BigBoyy" ];
		};
	};
}
