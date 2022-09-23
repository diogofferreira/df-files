# System specific
alias ls="ls --color"
alias ll='ls -l --color=auto'

# Laptop + monitor setup management
function internal_configs() { 
    rm ~/.Xdefaults 
    rm ~/.Xresources 
    rm ~/.xinitrc 
    ln -f -s ~/.Xdefaults-internal ~/.Xdefaults 
    ln -f -s ~/.Xresources-internal ~/.Xresources 
    ln -f -s ~/.xinitrc-internal ~/.xinitrc 
} 
  
function external_configs() { 
    rm ~/.Xdefaults 
    rm ~/.Xresources 
    rm ~/.xinitrc 
    ln -f -s ~/.Xdefaults-external ~/.Xdefaults 
    ln -f -s ~/.Xresources-external ~/.Xresources 
    ln -f -s ~/.xinitrc-external ~/.xinitrc 
} 
  
function startx-internal() { 
    internal_configs 
    startx 
} 

function startx-external() { 
    external_configs 
    startx 
} 
