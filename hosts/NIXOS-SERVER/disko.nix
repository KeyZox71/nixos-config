{ ... }:

{
  disko.devices = {
	disk = {
	  boot-disk = {
		device = "/dev/sda";
		type = "disk";
		content = {
		  type = "gpt";
		  partitions = {
			ESP = {
			  size = "500M";
			  type = "EF00";
			  content = {
				type = "filesystem";
				format = "vfat";
				mountpoint = "/boot";
			  };
			};
			root = {
			  size = "100%";
			  content = {
				type = "btrfs";
				extraArgs = [ "-f" ];
				mountpoint = "/";
				mountOptions = [
				  "compress=zstd"
				  "noatime"
				];
			  };
			};
		  };
		};
	  };
	};
  };
}
