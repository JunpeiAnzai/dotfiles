# ctrl-caps swapping
edit `.profile`

    setxkbmap -option ctrl:swapcaps
    ln -s ~/dotfiles/.profile ~/.profile
	
# fcitx
due to confliction to mozc-emacs, deleted.
edit `/etc/locale.gen` coment-off

    ja_JP.UTF-8
and

    sudo locale-gen
    gsettings set org.gnome.settings-daemon.plugins.keyboard active false

in `~/dotfiles/.xprofile`
    export GTK_IM_MODULE=ibus
    export QT_IM_MODULE=ibus
    export XMODIFIERS="@im=ibus"

deleted.
# ibus-mozc
    gsettings set org.gnome.settings-daemon.plugins.keyboard active true
	yaourt -S mozc

# system font

    yaourt -S ttf-migmix
	
create/edit `~/dotfiles/.fonts.conf`

    ln -s ~/dotfiles/.fonts.conf ~/.fonts.conf

# latex environment

    yaourt -S texlive-most
    yaourt -S texlive-langcjk
stab  

# oh-my-zsh
deleted.

    yaourt -S wget
    wget --no-check-certificate http://install.ohmyz.sh -O - | sh

# tmux
    pacman -S tmux

## tmux-mem-cpu-load
    yaourt -S tmux-mem-cpu-load
edit `.tmux.conf` and,

    tmux -source ~/.tmux.conf
	
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

    git clone https://github.com/yascentur/Ricty.git
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

## Undo-Tree
`package-install` and choose `undo-tree`.  
edit `init.el`

    (require 'undo-tree)
    (global-undo-tree-mode)


## solarized
goto solarized section.
stab  

## auto-complete.el
add marmarade package repository and `package-refresh-contents`. 
`install-package` and choose `auto-complete`.

    hg clone https://bitbucket.org/tequilasunset/auto-complete-latex
    cp -r auto-complete-latex ~/.emacs.d/lisp/

## markdown-mode.el
first,

    yaourt -S markdown

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
edit `~/dotfiles/fonts.conf`

    <match target="font">
      <edit mode="assign" name="autohint"><bool>true</bool></edit>
      <edit mode="assign" name="hinting"><bool>true</bool></edit>
      <edit mode="assign" name="hintstyle"><const>hintslight</const></edit>
    </match>

and

	ln -s ~/dotfiles/fonts.conf ~/.config/fontconfig/fonts.conf

## flash plugin
    yaourt -S chromium-pepper-flash

## pdf plugin
    yaourt -S chromium-libpdf

# Intel parallel Studio XE
first, you have to get license file *.lic.  
since package cache exceeds memory size of PC (`tmpfs` directory `/tmp`), mount `/tmp` in `ext4` and reboot.
in `/etc/fstab`,

    UUID=76a969c1-ba28-4b7e-848f-8c915fbcaa9b       /tmp               ext4            rw,relatime,data=ordered 0 1  
and,

    yaourt -S intel-parallel-studio-xe
	
after installation and license activation, add to `/dotfiles/orig.zsh`

    source /opt/intel/pkg_bin/compilervars.sh intel64
final, recover `/etc/fstab` configuration.

# gcc-fortran
    yaourt -S gcc-fortran

# zukitwo-theme
    yaourt -S zukitwo-themes
	yaourt -S ttf-droid
    yaourt -S gnome-tweak-tool

# profile-sync-daemon
    yaourt -S profile-sync-daemon
edit `/etc/psd.conf`

    sudo systemctl enable psd psd-resync
	sudo systemctl start psd psd-resync
check whether psd runs properly or not,
    profile-sync-daemon parse

# dropbox
    yaourt -S dropbox
	yaourt -S nautilus-dropbox

edit `.profile`, add `dropboxd &`

# mendeleydesktop
    yaourt -S mendeleydesktop
	
# gvfs-smb
    yaourt -S gvfs-smb
nautilus doesn't show windows network automatically?  
stab
