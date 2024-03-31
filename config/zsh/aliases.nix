{
  # Common
  less = "less -R"; # ANSI color escape
  g = "git";
  t = "tmux";
  v = "$EDITOR";
  d = "docker";

  dc = "docker-compose";
  # Network
  myip = "curl https://ipinfo.io/json";
  run-speedtest = "curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -";

  # ZSHRC
  zz = "nvim $HOME/.zshrc";
  sz = "source ~/.zshrc";

  # https://github.com/PhrozenByte/rmtrash
  rm = "rmtrash";
  rmdir = "rmdirtrash";
  sudo = "sudo ";

  # cat
  cat = "bat";

  # Rye scripts
  rr = "rye run";

  # shell-gpt
  sgpt = "op run -- sgpt";
}
