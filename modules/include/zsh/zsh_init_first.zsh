# start profiling
if [[ -n "$ZSH_DEBUGRC" ]]; then
	zmodload zsh/zprof
fi
if [[ -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]]; then
	. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
	. /nix/var/nix/profiles/default/etc/profile.d/nix.sh
fi
