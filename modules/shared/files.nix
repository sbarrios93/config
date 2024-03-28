{ user, pkgs, config, ... }:


let
  xdg_configHome = "${config.users.users.${user}.home}/.config";
  xdg_dataHome = "${config.users.users.${user}.home}/.local/share";
  xdg_stateHome = "${config.users.users.${user}.home}/.local/state";
in
{
  # nvim
  "${xdg_configHome}/nvim" = {
    source = ../include/nvim;
    recursive = true;
  };
  # starship
  "${xdg_configHome}/starship.toml" = {
    source = ../include/starship.toml;
  };
  # zsh aliases, functions
  "${xdg_configHome}/zsh" = {
    source = ../include/zsh;
    recursive = true;
  };
}

