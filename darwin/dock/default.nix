{
  imports = [
    ./config.nix
  ];
  system.defaults.dock = {
    autohide = true;
    show-recents = false;
    launchanim = true;
    mru-spaces = false;
    orientation = "bottom";
    tilesize = 48;

    # disable hot corners
    wvous-bl-corner = 1;
    wvous-br-corner = 1;
    wvous-tl-corner = 1;
    wvous-tr-corner = 1;
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
