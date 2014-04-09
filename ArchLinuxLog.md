# ctrl-caps swaping  
edit `/etc/X11/xorg.conf.d/00-keyboard.conf`
    Option "XkbOptions" "ctrl:swapcaps"  
restart.

# fcitx  
edit `/etc/locale.gen` coment-off  
    ja_JP.UTF-8  
and
    sudo locale-gen
    gsettings set org.gnome.settings-daemon.plugins.keyboard active false

in `~/dotfiles/.xprofile`
    export GTK_IM_MODULE=fcitx
    export QT_IM_MODULE=fcitx
    export XMODIFIERS="@im=fcitx"  
  
# system font
    yaourt -S ttf-migmix
create/edit `~/dotfiles/.fonts.conf`  
ln -s ~/dotfiles/.fonts.conf ~/.fonts.conf  

# latex environment
    yaourt -S texlive-most
    yaourt -S texlive-langcjk
stab  

# oh-my-zsh
    yaourt -S wget
    wget --no-check-certificate http://install.ohmyz.sh -O - | sh
stab  

# tmux  
    pacman -S tmux  

# solarlized
## terminal(xterm)
    wget https://raw.githubusercontent.com/altercation/solarized/master/xresources/solarized
    mv solarized ~/dotfiles/.Xresources
    ln -s ~/dotdiles/.Xresources ~/.Xresources
    xrdb ~/.Xresources
check xterm.  

## terminal(gnome-terminal)
    git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git

## tmux
    git clone https://github.com/seebi/tmux-colors-solarized.git
create & edit `.tmux.conf`
    set-option -g prefix C-t
and at terminal,
    tmux source-file ~/.tmux.conf
      
# tmux-powerline
    git clone https://github.com/erikw/tmux-powerline.git
stab

# source-highlight  
    yaourt -S source-highlight  

# ricty
    yaourt -S fontforge
download Inconsolata and Migu1M.  
    git clone https://github.com/yascentur/Ricty.git
    ./ricty_generator.sh Inconsolata.otf migu-1m-regular.ttf migu-1m-bold.ttf
    mkdir ~/.fonts
    cp -f Ricty*.ttf ~/.fonts/
    fc-cache -vf


# emacs
