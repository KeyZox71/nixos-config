{ pkgs, ... }:

{
  services.ollama = {
    enable = true;
    acceleration = "cuda";
    package = pkgs.unstable.ollama-cuda.override {
      cudaArches = [ "sm_50" ];
    };
    home = "/BigBoyy/config/ollama/ollama";
    host = "[::]";
    loadModels = [ "gemma3n:e2b" ];
  };
}
