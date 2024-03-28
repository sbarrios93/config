{ config, pkgs, lib, ... }:

let
  name = "Sebastian Barrios Slight";
  user = "sbarrios";
  email = "sbarrios93@gmail.com";
  nvimConfig = "${home-manager.user.${user}.home}/.config/config/modules/config/nvim/";
in
{
  # Shared shell configuration
  zsh = {
    enable = true;
    autocd = true;

    initExtraFirst = ''
        '';
  };

  home.file.".config/nvim".source = nvimConfig;

  git = {
    enable = true;
    ignores = [ " * .swp " ];
    userName = name;
    userEmail = email;
    lfs = {
      enable = true;
    };
    extraConfig = {
      init.defaultBranch = "
    main ";
      core = {
        editor = "
    vim ";
        autocrlf = "
    input ";
      };
      pull.rebase = true;
      rebase.autoStash = true;
    };
  };


  ssh = {
    enable = true;

    extraConfig = lib.mkMerge [
      ''
        Host github.com
          Hostname github.com
          IdentitiesOnly yes
      ''
      (lib.mkIf pkgs.stdenv.hostPlatform.isLinux
        ''
          IdentityFile /home/${user}/.ssh/id_github
        '')
      (lib.mkIf pkgs.stdenv.hostPlatform.isDarwin
        ''
          IdentityFile /Users/${user} /.ssh/id_github
        '')
    ];
  };

}

