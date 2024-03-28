alias myip='curl https://ipinfo.io/json'
alias run-speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
alias zz='nvim $HOME/.zshrc'
alias sz='source ~/.zshrc'
alias maketex='cp ~/.texfiles/* . && mv file.tex'
alias debuck='$DOTFILES/debuck/debuck'
# VIM Init
alias vc='nvim $XDG_CONFIG_HOME/nvim/init.lua'
# replace common `rm` command for trash (https://github.com/changkun/rmtrash)
alias rm='trash'
# ls
TREE_IGNORE="cache|log|logs|node_modules|vendor|__pycache__"
alias ls=' eza --group-directories-first'
alias la=' ls -a'
alias ll=' ls --git -l'
alias lt=' ls --tree -D -L 2 -I ${TREE_IGNORE}'
alias ltt=' ls --tree -D -L 3 -I ${TREE_IGNORE}'
alias lttt=' ls --tree -D -L 4 -I ${TREE_IGNORE}'
alias ltttt=' ls --tree -D -L 5 -I ${TREE_IGNORE}'

# cat
alias cat=' bat'
alias grep='grep --color=auto'

# rye scripts
alias rr='rye run'

# shell-gpt
alias sgpt="op run -- sgpt"
