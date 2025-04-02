{ ... }:

{
  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "100.117.135.231/32" ];
      dns = [ "10.255.255.1" ];
      privateKeyFile = "/home/adjoly/workspace/wg-windscribe/privKey";
      peers = [
        {
          allowedIPs = [
            "0.0.0.0/0"
            "::/0"
          ];
          endpoint = "bru-99-wg.whiskergalaxy.com:443";
          publicKey = "TA+nBx5qMBdyIiug4SHgbw30/GXrRZ2aUAH7MQHJwzc=";
          presharedKeyFile = "/home/adjoly/workspace/wg-windscribe/preSharedKey";
        }
      ];
	  autostart = false;
    };
  };
}
