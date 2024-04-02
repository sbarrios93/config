{ pkgs, environment, config, ... }:
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
    casks = pkgs.callPackage casks { };
    # These app IDs are from using the mas CLI app
    # mas = mac app store
    # https://github.com/mas-cli/mas
    #
    # $ nix shell nixpkgs#mas
    # $ mas search <app name>
    #
    masApps = { };
    # https://github.com/zhaofengli/nix-homebrew/issues/5#issuecomment-1878798641
    taps = builtins.attrNames config.nix-homebrew.taps;
    global.autoUpdate = false;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };
}
