# ctrl-caps swapping  
edit `/etc/X11/xorg.conf.d/00-keyboard.conf`
    Option "XkbOptions" "ctrl:swapcaps"  
restart.

# fcitx
due to confliction to mozc-emacs, deleted.
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
      
## emacs
    git clone https://github.com/sellout/emacs-color-theme-solarized.git
    cp -r emacs-color-theme-solarized ~/.emacs.d/theme/
edit ~/.emacs.d/init.el
    (add-to-list 'custom-theme-load-path "~/.emacs.d/theme")
    (load-theme 'solarized-dark t t) 
    
# tmux-powerline
    git clone https://github.com/erikw/tmux-powerline.git
stab

# source-highlight  
    yaourt -S source-highlight  

# ricty
    yaourt -S fontforge
download Inconsolata and Migu1M.  
    gi
	t clone https://github.com/yascentur/Ricty.git
    ./ricty_generator.sh Inconsolata.otf migu-1m-regular.ttf migu-1m-bold.ttf
    mkdir ~/.fonts
    cp -f Ricty*.ttf ~/.fonts/
    fc-cache -vf

# disable cursor blink
    gsettings set org.gnome.desktop.interface cursor-blink false

# mercurial
    
# emacs
## mozc.el
    yaourt -Ss mozc
conflict to mozc-fcitx. remove mozc-fcitx.
## twittering-mode
    git clone git://github.com/hayamiz/twittering-mode.git
    cp twittering-mode.el ~/.emacs.d/lisp/
## solarized  
goto solarized section.
stab  

## auto-complete.el
add marmarade package repository and `package-refresh-contents`. 
`install-package` and choose `auto-complete`.  
    hg clone https://bitbucket.org/tequilasunset/auto-complete-latex
    cp -r auto-complete-latex ~/.emacs.d/lisp/

## markdown-mode.el
`package-install` and choose `markdown-mode`  

## yatex
    hg clone http://www.yatex.org/hgrepos/yatex yatex
edit `makefile` line 6
    -- PREFIX = /usr/local
	++ PREFIX = /usr
	sudo make install

## flymake
`package-install` and choose `flymake`

### flymake for fortran
stab

## magit
`package-install` and choose `magit`

# aspell
create `.aspell.conf` and edit
    lang en US
and,
    ln -s ~/dotfiles/.aspell.conf ~/.aspell.conf


# make github key
    mkdir ~/.ssh/github
	ssh-keygen
	mv id_rsa.github.com* ~/.ssh/github/
edit ~/.ssh/config
    Host github.com
      Compression yes
      IdentityFile ~/.ssh/github/id_rsa.github.com
	  User git
and test connection,
    ssh-add ~/.ssh/github/id_rsa.github.com
    ssh -T git@github.com

# chromium
## font rendoring
create & edit `~/,config/fontconfig/fonts.conf`  
    <match target="font">
      <edit mode="assign" name="autohint"><bool>true</bool></edit>
      <edit mode="assign" name="hinting"><bool>true</bool></edit>
      <edit mode="assign" name="hintstyle"><const>hintslight</const></edit>
    </match>

