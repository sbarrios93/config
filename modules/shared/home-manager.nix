{ config, pkgs, lib, ... }:

let
  name = "Sebastian Barrios Slight";
  user = "sbarrios";
  email = "sbarrios93@gmail.com";
in
{
  # Shared shell configuration
  zsh = {
    enable = true;
    autocd = true;

    initExtraFirst = ''
      if [[ -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]]; then
          . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
          . /nix/var/nix/profiles/default/etc/profile.d/nix.sh
      fi
    '';
  };


  # a cat(1) clone with syntax highlighting and Git integration.
  bat = {
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
        file = "Catppuccin Mocha.tmTheme";
      };
    };
  };

  git = {
    enable = true;
    ignores = [ "* .swp" ];
    userName = name;
    userEmail = email;
    lfs = {
      enable = true;
    };
    extraConfig = {
      init.defaultBranch = "main";
      core = {
        editor = "vim";
        autocrlf = "input";
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

