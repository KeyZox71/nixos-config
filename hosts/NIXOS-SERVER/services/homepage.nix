{ ... }:

{
  services.homepage-dashboard = {
    enable = true;

	settings = {
			title = "adjoly's dashboard";
			favicon = "https://send.kanel.ovh/hotlink/rNGF5uXQkfcgwXVcMp1t0NgKMd2UXRIYqKNvfcJV.png";
		};
	widgets = {
			datetime = {
				locale = "fr-FR";
				text_size = "2x1";
				format = {
					timeStyle = "short";
					hour12 = false;
				};
			};
		};
    docker = {
      "mydocker" = {
		socket = "/var/run/docker.sock";
      };
    };
  };
}
