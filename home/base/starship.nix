{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    settings = builtins.readFile ../../config/starship.toml;
  };
}
