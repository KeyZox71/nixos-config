{ ... }:

{
  services.homepage-dashboard = {
    enable = true;

	settings = {
			title = "adjoly's dashboard";
			favicon = "https://send.kanel.ovh/hotlink/rNGF5uXQkfcgwXVcMp1t0NgKMd2UXRIYqKNvfcJV.png";
		};
    docker = {
      "mydocker" = {
		socket = "/var/run/docker.sock";
      };
    };
  };
}
