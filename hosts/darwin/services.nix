{ config, pkgs, lib, ... }:
let
  user = "sbarrios";
in
{
  # Enable the Nix daemon
  services =
    {
      nix-daemon =
        {
          enable = true;
        };

      # Enable yabai, a tiling window manager for macOS
      yabai = {
        enable = true;
        enableScriptingAddition = true;
        extraConfig = builtins.readFile ../../modules/include/yabai/yabairc;
      };

      # Enable skhd, a simple hotkey daemon for macOS
      skhd = {
        enable = true;
        skhdConfig = builtins.readFile ../../modules/include/skhd/skhdrc;
      };
    };

  launchd.user.agents = {
    yabai.serviceConfig = {
      StandardErrorPath = "${config.users.users.${user}.home}/Library/Logs/yabai.stderr.log";
      StandardOutPath = "${config.users.users.${user}.home}/Library/Logs/yabai.stdout.log";
    };
    skhd.serviceConfig =
      {
        StandardErrorPath = "${config.users.users.${user}.home}/Library/Logs/skhd.stderr.log";
        StandardOutPath = "${config.users.users.${user}.home}/Library/Logs/skhd.stdout.log";
      };
  }; # custom log path for debugging
}
