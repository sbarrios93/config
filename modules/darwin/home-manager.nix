{ config, pkgs, lib, home-manager, ... }:

let
  user = "sbarrios";
  # Define the content of your file as a derivation
  additionalFiles = import ./files.nix { inherit user config pkgs; };
  sharedFiles = import ../shared/files.nix { inherit user config pkgs; };
in
{
  imports = [
    ./dock
  ];

  # It me
  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  homebrew = {
    enable = true;
    casks = pkgs.callPackage ./casks.nix { };

    # These app IDs are from using the mas CLI app
    # mas = mac app store
    # https://github.com/mas-cli/mas
    #
    # $ nix shell nixpkgs#mas
    # $ mas search <app name>
    #
    masApps = { };
  };

  # Enable home-manager
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${user} = { pkgs, config, lib, ... }: {
      home = {
        stateVersion = "24.05";
        enableNixpkgsReleaseCheck = false;
        sessionVariables = {
          XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
          XDG_DATA_HOME = "${config.home.homeDirectory}/.local/share";
          XDG_CACHE_HOME = "${config.home.homeDirectory}/.cache";
          ZSH_CACHE = "${config.home.homeDirectory}/.cache/zsh";
        };
        packages = pkgs.callPackage ./packages.nix { };
        file = lib.mkMerge [
          sharedFiles
          additionalFiles
        ];
      };
      programs = { } // import ../shared/home-manager.nix { inherit config pkgs lib; };

      # Marked broken Oct 20, 2022 check later to remove this
      # https://github.com/nix-community/home-manager/issues/3344
      manual.manpages.enable = false;
    };
  };

  # Fully declarative dock using the latest from Nix Store
  local.dock.enable = true;
  local.dock.entries = [
    { path = "/Applications/Slack.app/"; }
    { path = "/Applications/Arc.app/"; }
    { path = "/Applications/WezTerm.app/"; }
    { path = "/System/Applications/Home.app/"; }
    # {
    #   path = "${config.users.users.${user}.home}/.local/share/";
    #   section = "others";
    #   options = "--sort name --view grid --display folder";
    # }
  ];

}
