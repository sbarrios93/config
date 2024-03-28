{ pkgs }:

with pkgs; [
  # General packages for development and system management
  bash-completion
  btop
  coreutils
  eza
  killall
  neofetch
  openssh
  sqlite
  wget
  zip
  zsh
  neovim
  lazygit

  gnupg
  libfido2

  ffmpeg
  fd
  font-awesome

  # Node.js development tools
  nodePackages.npm # globally install npm
  nodePackages.prettier
  nodejs

  # Text and terminal utilities
  htop
  iftop
  jetbrains-mono
  jq
  ripgrep
  tree
  tmux
  unrar
  unzip

  # Python packages
  rye

  # trash command
  trash-cli
  rmtrash

]
