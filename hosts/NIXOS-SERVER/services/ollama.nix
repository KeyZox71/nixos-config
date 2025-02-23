{...}:

{
	services.ollama = {
		enable = true;
		acceleration = "cuda";
		home = "/BigBoyy/config/ollama/ollama";
		host = "[::]";
		loadModels = [ "mistral" "codestral" ];
	};
}
