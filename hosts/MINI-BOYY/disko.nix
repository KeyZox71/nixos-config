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
                mountOptions = [ "umask=0077" ];
              };
            };
            root = {
              end = "-4G";
              content = {
                type = "filesystem";
				format = "xfs";
                mountpoint = "/";
                mountOptions = [
                  "defaults"
                  "pquota"
                ];
              };
            };
            SWAP = {
              size = "100%";
              content = {
                type = "swap";
                resumeDevice = true;
              };
            };
          };
        };
      };
    };
  };
}
