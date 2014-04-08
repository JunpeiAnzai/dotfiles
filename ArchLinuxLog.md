# ctrl-caps swaping  
edit `/etc/X11/xorg.conf.d/00-keyboard.conf`
    Option "XkbOptions" "ctrl:swapcaps"  
restart.

# fcitx  
    gsettings set org.gnome.settings-daemon.plugins.keyboard active false
in `~/dotfiles/.xprofile`
    export GTK_IM_MODULE=fcitx
    export QT_IM_MODULE=fcitx
    export XMODIFIERS="@im=fcitx"  
  

    

