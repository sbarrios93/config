{ pkgs, ... }:
{
  homebrew = {
    enable = true;
    casks = pkgs.callPackage ./casks.nix { };
    taps = [
    "nikitabobko/aerospace"
    ];

    # These app IDs are from using the mas CLI app
    # mas = mac app store
    # https://github.com/mas-cli/mas
    #
    # $ nix shell nixpkgs#mas
    # $ mas search <app name>
    #
    masApps = { };
  };
}
