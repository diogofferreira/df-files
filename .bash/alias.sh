# System specific
alias ls="ls --color"
alias ll='ls -l --color=auto'

# Development
alias chrome-dev="google-chrome-stable --disable-web-security --user-data-dir &"
alias mongo-viegy="mongod --dbpath=/home/diogo/Documents/Development/Viegy/viegy-db/"

# Misc
win(){
    mkdir -p ~/Windows;
    if ! mount | grep /mnt/dev/sda4 > /dev/null ; then
        sudo mount -t ntfs -o umask=0770,remove_hiberfile /dev/sda4 ~/Windows/
    fi
    thunar ~/Windows/Users/Diogo\ Ferreira/Desktop/ &
}
