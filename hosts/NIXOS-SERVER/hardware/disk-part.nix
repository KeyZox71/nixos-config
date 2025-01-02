{ disko }:

{
	disko.devices = {
		disk = {
			boot-disk = {
				devices = "/dev/sda";
				type = "disk";
				content = {
					type = "GPT";
					partitions = {
						ESP = {
							type = "EF00";
							size = "500M";
							content = {
								type = "filesystem";
								format = "vfat";
								mountpoint = "boot";
							};
						};
						root = {
							size = "100%";
							content = {
								type = "btrfs";
								extraArgs = [ "-f" ];
								mountpoint = "/";
								mountOptions = [ "compress-zstd" "noatime" ];
							};
						};
					};
				};
			}
		}
	}
}
