# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Alias
. "$HOME/.bash/alias.sh"

# Custom bash configuration
. "$HOME/.bash/colors.sh"
. "$HOME/.bash/prompt.sh"

# Git completion
source ~/.dotfiles/.git-completion

# User specific exports
export VISUAL=vim
export EDITOR="$VISUAL"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# To take advantage of multicore CPUs you can use the MAKEFLAGS variable.
# For example the equivalent of "make -j8" would be:
export MAKEFLAGS="-j8"
