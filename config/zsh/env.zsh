# Default Editor
EDITOR=nvim

# Set XDG_CONFIG_HOME to default if not already set
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}

# RUST PATHS
RUSTUP_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/rustup"
CARGO_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/cargo"

# RYE
RYE_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/rye"

# 1Password
OPENAI_API_KEY="op://Personal/OpenAI/token"
