{ ... }:
{
	programs.tofi = {
		enable = true;
	#	catppuccin = {
	#		enable = true;
	#		flavor = "frappe";
	#	};
		settings = {
			width = "40%";
			height = "40%";

			prompt-text = "> ";

			border-width = "0";
			outline-width = "0";
			#padding-left = "40%";
			#padding-top = "20%";

			result-spacing = "15";

			#num-results = "10";

			terminal = "kitty";
		};
	};
}
