# NOTE Using zgenom because zgen is no longer maintained
if [ ! -d "$ZGEN_DIR" ]; then
	echo "Installing jandamm/zgenom"
	git clone https://github.com/jandamm/zgenom "$ZGEN_DIR"
fi
source $ZGEN_DIR/zgenom.zsh

# Check for plugin and zgenom updates every 7 days
# This does not increase the startup time.
zgenom autoupdate

if ! zgenom saved; then
	echo "Initializing zgenom"
	rm -f $ZGEN_INIT.zwc

	# Ohmyzsh base library
	zgenom ohmyzsh

	# plugins

	# Install ohmyzsh osx plugin if on macOS
	[[ "$(uname -s)" = Darwin ]] && zgenom ohmyzsh plugins/macos

	# NOTE Be extra careful about plugin load order, or subtle breakage can
	#   emerge. This is the best order I've sussed out for these plugins.
	zgenom load junegunn/fzf shell
	zgenom load jeffreytse/zsh-vi-mode
	zgenom load zdharma-continuum/fast-syntax-highlighting
	zgenom load zsh-users/zsh-completions src
	zgenom load zsh-users/zsh-autosuggestions
	zgenom load zsh-users/zsh-history-substring-search
	zgenom load hlissner/zsh-autopair autopair.zsh

	zgenom ohmyzsh plugins/sudo
	zgenom ohmyzsh plugins/nvm
	zgenom load hsaunders1904/pyautoenv

	zgenom save
	zgenom compile $HOME/.zshrc
fi

## Bootstrap interactive sessions
if [[ $TERM != dumb ]]; then
	autoload -Uz compinit && compinit -u -d $ZSH_CACHE/zcompdump

	# Define the array of sources similar to your .zshrc configuration
	sources=(
		"aliases"
		"functions"
		"rye-completion"
	)

	for s in "''${sources[@]}"; do
		source $XDG_CONFIG_HOME/zsh/include/''${s}.zsh
	done

	autopair-init
fi

# end profiling
if [[ -n "$ZSH_DEBUGRC" ]]; then
	zprof
fi
