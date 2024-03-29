{ config, pkgs, lib, ... }:

let
  name = "Sebastian Barrios Slight";
  user = "sbarrios";
  email = "sbarrios93@gmail.com";
in
{
  home-manager.enable = true;
  awscli.enable = true;
  btop.enable = true;
  jq.enable = true;
  lazygit.enable = true;
  less.enable = true;
  ripgrep.enable = true;
  tmux.enable = true;

  neovim = {
    enable = true;
    defaultEditor = true;
  };

  # Shared shell configuration
  zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    # I init completion myself, because enableGlobalCompInit initializes it
    # too soon, which means commands initialized later in my config won't get
    # completion, and running compinit twice is slow. (https://github.com/Obscurely/NixObscurely/blob/5883bcec80fb4542b6cb53fcf56a9bb22e00112c/modules/shell/zsh.nix#L37)
    completionInit = "";


    initExtraFirst = builtins.readFile ../include/zsh/zsh_init_first.zsh;

    initExtra = builtins.readFile ../include/zsh/zsh_init.zsh;

    profileExtra = builtins.readFile ../include/zsh/env;
  };

  starship = {
    enable = true;
    enableZshIntegration = true;
  };

  eza = {
    enable = true;
    enableZshIntegration = true;
    extraOptions = [
      "--group-directories-first"
      "--header"
    ];
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
        file = "themes/Catppuccin Mocha.tmTheme";
      };
    };
  };

  fzf = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    # https://github.com/catppuccin/fzf
    # catppuccin-mocha
    colors = {
      "bg+" = "#313244";
      "bg" = "#1e1e2e";
      "spinner" = "#f5e0dc";
      "hl" = "#f38ba8";
      "fg" = "#cdd6f4";
      "header" = "#f38ba8";
      "info" = "#cba6f7";
      "pointer" = "#f5e0dc";
      "marker" = "#f5e0dc";
      "fg+" = "#cdd6f4";
      "prompt" = "#cba6f7";
      "hl+" = "#f38ba8";
    };
  };


  # zoxide is a smarter cd command, inspired by z and autojump.
  # It remembers which directories you use most frequently,
  # so you can "jump" to them in just a few keystrokes.
  # zoxide works on all major shells.
  #
  #   z foo              # cd into highest ranked directory matching foo
  #   z foo bar          # cd into highest ranked directory matching foo and bar
  #   z foo /            # cd into a subdirectory starting with foo
  #
  #   z ~/foo            # z also works like a regular cd command
  #   z foo/             # cd into relative path
  #   z ..               # cd one level up
  #   z -                # cd into previous directory
  #
  #   zi foo             # cd with interactive selection (using fzf)
  #
  #   z foo<SPACE><TAB>  # show interactive completions (zoxide v0.8.0+, bash 4.4+/fish/zsh only)
  zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
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

