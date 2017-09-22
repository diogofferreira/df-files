# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

alias ls="ls --color"

win(){
    mkdir -p ~/Windows;
    if ! mount | grep /mnt/dev/sda4 > /dev/null ; then
        sudo mount -t ntfs -o umask=0770,remove_hiberfile /dev/sda4 ~/Windows/
    fi
    nautilus ~/Windows/Users/Diogo\ Ferreira/Desktop/ &
}

source ~/.dotfiles/.git-completion

# Defining foreground variables for the prompt

P_BLACK="\[$(tput setaf 0)\]"
P_RED="\[$(tput setaf 1)\]"
P_GREEN="\[$(tput setaf 2)\]"
P_YELLOW="\[$(tput setaf 3)\]"
P_BLUE="\[$(tput setaf 4)\]"
P_MAGENTA="\[$(tput setaf 5)\]"
P_CYAN="\[$(tput setaf 6)\]"
P_WHITE="\[$(tput setaf 7)\]"
P_POWDER_BLUE="\[$(tput setaf 153)\]"
P_BOLD="\[$(tput bold)\]"
P_RESET="\[$(tput sgr0)\]"

# Setting a fancy prompt for the current user

export PS1="$P_BOLD$P_GREEN╭── $P_RED\u$P_BLUE@$P_POWDER_BLUE\h: $P_YELLOW\w $P_MAGENTA ["'$(basename "$(git symbolic-ref HEAD 2>/dev/null)")$([[ ! -z "$(git status --porcelain 2>/dev/null)" ]] && echo " ✘")'"]\n$P_GREEN\
╰──$ $P_RESET"

export VISUAL=vim
export EDITOR="$VISUAL"

# Preserve path in new window
. /etc/profile.d/vte.sh
