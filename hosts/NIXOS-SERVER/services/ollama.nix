{ inputs, pkgs,... }:

# let
#   ollamaWithSM50= pkgs.unstable.ollama.overrideAttrs (oldAttrs: {
#     cudaArches = [ "sm_50" ];
#   });
# in
{
	services.ollama = {
		enable = true;
		acceleration = "cuda";
		package = pkgs.unstable.ollama-cuda.override {
			cudaArches = [ "sm_50" ];
		};
		home = "/BigBoyy/config/ollama/ollama";
		host = "[::]";
		loadModels = [ "mistral" ];
	};
}
