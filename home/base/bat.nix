{ pkgs, ... }:
{
  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
      theme = "catppuccin-mocha";
    };
    themes = {
      # https://raw.githubusercontent.com/catppuccin/bat/main/Catppuccin-mocha.tmTheme
      catppuccin-mocha = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "b19bea35a85a32294ac4732cad5b0dc6495bed32";
          sha256 = "POoW2sEM6jiymbb+W/9DKIjDM1Buu1HAmrNP0yC2JPg=";
        };
        file = "themes/Catppuccin Mocha.tmTheme";
      };
    };
  };
}
