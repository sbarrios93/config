{ pkgs, environment, ... }:
let
  caskOptions = import ./casks;
  casks =
    if environment.environment == "personal"
    then caskOptions.personal
    else caskOptions.work;
in
{
  homebrew = {
    enable = true;
    casks = pkgs.callPackage casks {};
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
