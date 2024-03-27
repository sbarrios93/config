{ config, pkgs, ... }:

let user = "sbarrios"; in

{

  imports = [
    ../../modules/darwin/home-manager.nix
    ../../modules/shared
    ../../modules/shared/cachix
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Setup user, packages, programs
  nix = {
    package = pkgs.nixUnstable;
    settings.trusted-users = [ "@admin" "${user}" ];

    gc = {
      user = "root";
      automatic = true;
      interval = { Weekday = 0; Hour = 2; Minute = 0; };
      options = "--delete-older-than 30d";
    };

    # Turn this on to make command line easier
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Turn off NIX_PATH warnings now that we're using flakes
  system.checks.verifyNixPath = false;

  # Load configuration that is shared across systems
  environment.systemPackages = with pkgs;
    (import ../../modules/shared/packages.nix { inherit pkgs; });

  fonts.fontDir.enable = true;

  system = {
    stateVersion = 4;

    defaults = {
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        ApplePressAndHoldEnabled = false;
        AppleInterfaceStyleSwitchesAutomatically = true;
        AppleMetricUnits = 1;
        AppleMeasurementUnits = "Centimeters";
        AppleShowScrollBars = "WhenScrolling";
        AppleTemperatureUnit = "Celsius";
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;

        # 120, 90, 60, 30, 12, 6, 2
        KeyRepeat = 1;

        # 120, 94, 68, 35, 25, 15
        InitialKeyRepeat = 13;


        "com.apple.mouse.tapBehavior" = 1;
        "com.apple.sound.beep.volume" = 0.0;
        "com.apple.sound.beep.feedback" = 0;
      };

      dock = {
        autohide = true;
        show-recents = false;
        launchanim = true;
        mru-spaces = false;
        orientation = "bottom";
        tilesize = 32;
        # disable hot corners
        wvous-bl-corner = 1;
        wvous-br-corner = 1;
        wvous-tl-corner = 1;
        wvous-tr-corner = 1;

      };

      finder = {
        _FXShowPosixPathInTitle = false;
        AppleShowAllFiles = true;
        FXEnableExtensionChangeWarning = false;
        FXPreferredViewStyle = "Nlsv";
        ShowPathbar = true;
        ShowStatusBar = true;

      };

      trackpad = {
        Clicking = true;
        FirstClickThreshold = 0;
        SecondClickThreshold = 0;
        TrackpadThreeFingerDrag = false;
      };
    };

    menuExtraClock = {
      Show24Hour = true;
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };
}
