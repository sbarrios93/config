alias myip='curl https://ipinfo.io/json'
alias run-speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
alias zz='nvim $HOME/.zshrc'
alias sz='source ~/.zshrc'
# VIM Init
alias vc='nvim $XDG_CONFIG_HOME/nvim/init.lua'
# https://github.com/PhrozenByte/rmtrash
alias rm='rmtrash'
alias rmdir='rmdirtrash'
alias sudo='sudo '
# ls
TREE_IGNORE="cache|log|logs|node_modules|vendor|__pycache__"

# cat
alias cat=' bat'
alias grep='grep --color=auto'

# rye scripts
alias rr='rye run'

# shell-gpt
alias sgpt="op run -- sgpt"
